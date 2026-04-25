param(
  [string]$OldCommit = 'e37203aaee1e8a63d4ace46af6bbff9e9ae75080'
)

$ErrorActionPreference = 'Stop'

function Write-Utf8NoBom {
  param(
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Content
  )

  $encoding = [System.Text.UTF8Encoding]::new($false)
  [System.IO.File]::WriteAllText($Path, $Content, $encoding)
}

function Get-GitFileText {
  param(
    [Parameter(Mandatory = $true)][string]$Commit,
    [Parameter(Mandatory = $true)][string]$RepoRelativePath
  )

  $spec = '{0}:{1}' -f $Commit, $RepoRelativePath
  $output = & git show $spec
  if ($LASTEXITCODE -ne 0) {
    throw "git show failed for $spec"
  }

  return (($output -join "`n") + "`n")
}

function Get-TexDefBody {
  param(
    [Parameter(Mandatory = $true)][string]$Text,
    [Parameter(Mandatory = $true)][string]$MacroName
  )

  $needle = "\def\$MacroName{"
  $start = $Text.IndexOf($needle, [System.StringComparison]::Ordinal)
  if ($start -lt 0) {
    throw "Could not find macro definition for $MacroName"
  }

  $index = $start + $needle.Length
  $depth = 1
  $builder = [System.Text.StringBuilder]::new()

  while ($index -lt $Text.Length -and $depth -gt 0) {
    $char = $Text[$index]
    switch ($char) {
      '{' {
        $depth++
        [void]$builder.Append($char)
      }
      '}' {
        $depth--
        if ($depth -gt 0) {
          [void]$builder.Append($char)
        }
      }
      default {
        [void]$builder.Append($char)
      }
    }

    $index++
  }

  if ($depth -ne 0) {
    throw "Unbalanced braces while parsing $MacroName"
  }

  return $builder.ToString().Trim()
}

function Invoke-LatexdiffFragment {
  param(
    [Parameter(Mandatory = $true)][string]$OldFile,
    [Parameter(Mandatory = $true)][string]$NewFile,
    [Parameter(Mandatory = $true)][string]$OutputFile
  )

  $lines = & latexdiff `
    --type=UNDERLINE `
    --packages=biblatex,hyperref,amsmath `
    $OldFile `
    $NewFile

  if ($LASTEXITCODE -ne 0) {
    throw "latexdiff failed for $NewFile"
  }

  Write-Utf8NoBom -Path $OutputFile -Content (($lines -join "`n") + "`n")
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = (Resolve-Path (Join-Path $scriptDir '..')).Path
Set-Location $repoRoot

$diffRoot = Join-Path $repoRoot 'advisor-diff'
$oldRoot = Join-Path $diffRoot 'old'
$generatedRoot = Join-Path $diffRoot 'generated'
$tmpRoot = Join-Path $diffRoot 'tmp'

foreach ($dir in @($diffRoot, $oldRoot, $generatedRoot, $tmpRoot)) {
  if (-not (Test-Path -LiteralPath $dir)) {
    New-Item -ItemType Directory -Path $dir | Out-Null
  }
}

$bodyDiffFiles = @(
  'ai_declaration.tex',
  'introduction.tex',
  'ch01_background.tex',
  'ch02_analysis.tex',
  'ch03_system_design.tex',
  'ch05_user_workflow.tex',
  'ch06_discussion.tex',
  'ch07_conclusion_future_work.tex'
)

$allOldFiles = $bodyDiffFiles + @('metadata.tex')

foreach ($file in $allOldFiles) {
  $oldText = Get-GitFileText -Commit $OldCommit -RepoRelativePath $file
  Write-Utf8NoBom -Path (Join-Path $oldRoot $file) -Content $oldText
}

foreach ($file in $bodyDiffFiles) {
  $oldFile = Join-Path $oldRoot $file
  $generatedFile = Join-Path $generatedRoot (($file -replace '\.tex$', '') + '.diff.tex')
  Invoke-LatexdiffFragment -OldFile $oldFile -NewFile (Join-Path $repoRoot $file) -OutputFile $generatedFile
}

$oldMetadata = Get-Content (Join-Path $oldRoot 'metadata.tex') -Raw
$newMetadata = Get-Content (Join-Path $repoRoot 'metadata.tex') -Raw

$oldAbstractEn = Get-TexDefBody -Text $oldMetadata -MacroName 'Abstract'
$newAbstractEn = Get-TexDefBody -Text $newMetadata -MacroName 'Abstract'
$oldAbstractCs = Get-TexDefBody -Text $oldMetadata -MacroName 'AbstractCS'
$newAbstractCs = Get-TexDefBody -Text $newMetadata -MacroName 'AbstractCS'

$oldAbstractEnFile = Join-Path $tmpRoot 'abstract-en.old.tex'
$newAbstractEnFile = Join-Path $tmpRoot 'abstract-en.new.tex'
$oldAbstractCsFile = Join-Path $tmpRoot 'abstract-cs.old.tex'
$newAbstractCsFile = Join-Path $tmpRoot 'abstract-cs.new.tex'
$abstractEnDiffFile = Join-Path $tmpRoot 'abstract-en.diff.tex'
$abstractCsDiffFile = Join-Path $tmpRoot 'abstract-cs.diff.tex'

Write-Utf8NoBom -Path $oldAbstractEnFile -Content ($oldAbstractEn + "`n")
Write-Utf8NoBom -Path $newAbstractEnFile -Content ($newAbstractEn + "`n")
Write-Utf8NoBom -Path $oldAbstractCsFile -Content ($oldAbstractCs + "`n")
Write-Utf8NoBom -Path $newAbstractCsFile -Content ($newAbstractCs + "`n")

Invoke-LatexdiffFragment -OldFile $oldAbstractEnFile -NewFile $newAbstractEnFile -OutputFile $abstractEnDiffFile
Invoke-LatexdiffFragment -OldFile $oldAbstractCsFile -NewFile $newAbstractCsFile -OutputFile $abstractCsDiffFile

$metadataBuilder = [System.Text.StringBuilder]::new()
[void]$metadataBuilder.AppendLine('\chapter*{Abstract Changes}')
[void]$metadataBuilder.AppendLine('\addcontentsline{toc}{chapter}{Abstract Changes}')
[void]$metadataBuilder.AppendLine()
[void]$metadataBuilder.AppendLine('\section*{English Abstract}')
[void]$metadataBuilder.AppendLine((Get-Content $abstractEnDiffFile -Raw).Trim())
[void]$metadataBuilder.AppendLine()
[void]$metadataBuilder.AppendLine('\section*{Czech Abstract}')
[void]$metadataBuilder.AppendLine((Get-Content $abstractCsDiffFile -Raw).Trim())
[void]$metadataBuilder.AppendLine()

Write-Utf8NoBom -Path (Join-Path $generatedRoot 'metadata-diff.tex') -Content $metadataBuilder.ToString()

$diffPreamble = @'
% DIF PREAMBLE EXTENSION ADDED BY LATEXDIFF
% DIF UNDERLINE PREAMBLE %DIF PREAMBLE
\RequirePackage[normalem]{ulem} %DIF PREAMBLE
\RequirePackage{color}\definecolor{RED}{rgb}{1,0,0}\definecolor{BLUE}{rgb}{0,0,1} %DIF PREAMBLE
\providecommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}} %DIF PREAMBLE
\providecommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}} %DIF PREAMBLE
% DIF SAFE PREAMBLE %DIF PREAMBLE
\providecommand{\DIFaddbegin}{} %DIF PREAMBLE
\providecommand{\DIFaddend}{} %DIF PREAMBLE
\providecommand{\DIFdelbegin}{} %DIF PREAMBLE
\providecommand{\DIFdelend}{} %DIF PREAMBLE
\providecommand{\DIFmodbegin}{} %DIF PREAMBLE
\providecommand{\DIFmodend}{} %DIF PREAMBLE
% DIF FLOATSAFE PREAMBLE %DIF PREAMBLE
\providecommand{\DIFaddFL}[1]{\DIFadd{#1}} %DIF PREAMBLE
\providecommand{\DIFdelFL}[1]{\DIFdel{#1}} %DIF PREAMBLE
\providecommand{\DIFaddbeginFL}{} %DIF PREAMBLE
\providecommand{\DIFaddendFL}{} %DIF PREAMBLE
\providecommand{\DIFdelbeginFL}{} %DIF PREAMBLE
\providecommand{\DIFdelendFL}{} %DIF PREAMBLE
% DIF COLORLISTINGS PREAMBLE %DIF PREAMBLE
\lstdefinelanguage{DIFcode}{ %DIF PREAMBLE
  moredelim=[il][\color{red}\sout]{\%DIF\ <\ }, %DIF PREAMBLE
  moredelim=[il][\color{blue}\uwave]{\%DIF\ >\ } %DIF PREAMBLE
} %DIF PREAMBLE
\lstdefinestyle{DIFverbatimstyle}{ %DIF PREAMBLE
  language=DIFcode, %DIF PREAMBLE
  basicstyle=\ttfamily, %DIF PREAMBLE
  columns=fullflexible, %DIF PREAMBLE
  keepspaces=true %DIF PREAMBLE
} %DIF PREAMBLE
\lstnewenvironment{DIFverbatim}[1][]{\lstset{style=DIFverbatimstyle}}{} %DIF PREAMBLE
\lstnewenvironment{DIFverbatim*}[1][]{\lstset{style=DIFverbatimstyle,showspaces=true}}{} %DIF PREAMBLE
\lstset{extendedchars=\true,inputencoding=utf8}
% DIF END PREAMBLE EXTENSION ADDED BY LATEXDIFF
'@

$mainThesis = Get-Content (Join-Path $repoRoot 'thesis.tex') -Raw
$beginDocumentMarker = '\begin{document}'
$beginDocumentIndex = $mainThesis.IndexOf($beginDocumentMarker, [System.StringComparison]::Ordinal)
if ($beginDocumentIndex -lt 0) {
  throw 'Could not find \begin{document} in thesis.tex'
}

$preamble = $mainThesis.Substring(0, $beginDocumentIndex).TrimEnd()
$oldCommitLabel = if ($OldCommit.Length -gt 12) { $OldCommit.Substring(0, 12) } else { $OldCommit }

$reviewBody = @"
\begin{document}
\tableofcontents

\chapter*{Advisor Review Diff}
\addcontentsline{toc}{chapter}{Advisor Review Diff}
This document shows advisor-review changes between \type{$oldCommitLabel} and \type{HEAD}.
It intentionally does not diff the full flattened thesis preamble, \type{xmp.tex}, or the main thesis file.
The metadata changes are presented below as readable abstract text diffs, while changed chapters are included as per-file \type{latexdiff} outputs.
Chapter 3 only has minor textual consistency edits (``use case-specific'' to ``use-case-specific'').
Current Chapter 4 is included without diff markup so that later chapter numbering and the main cross-references remain stable.

\input{advisor-diff/generated/metadata-diff.tex}
\input{advisor-diff/generated/ai_declaration.diff.tex}
\input{advisor-diff/generated/introduction.diff.tex}
\input{advisor-diff/generated/ch01_background.diff.tex}
\input{advisor-diff/generated/ch02_analysis.diff.tex}
\input{advisor-diff/generated/ch03_system_design.diff.tex}
\input{ch04_implementation.tex}
\input{advisor-diff/generated/ch05_user_workflow.diff.tex}
\input{advisor-diff/generated/ch06_discussion.diff.tex}
\input{advisor-diff/generated/ch07_conclusion_future_work.diff.tex}
\clearpage
\input{bibliography.tex}
\appendix
\input{appendix_attachments.tex}
\end{document}
"@

$wrapper = $preamble + "`n`n" + $diffPreamble.Trim() + "`n`n" + $reviewBody
Write-Utf8NoBom -Path (Join-Path $repoRoot 'thesis-diff.tex') -Content $wrapper

function Invoke-CheckedCommand {
  param(
    [Parameter(Mandatory = $true)][string]$Executable,
    [Parameter(Mandatory = $true)][string[]]$Arguments,
    [Parameter(Mandatory = $true)][string]$FailureMessage
  )

  & $Executable @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw $FailureMessage
  }
}

Invoke-CheckedCommand `
  -Executable 'pdflatex' `
  -Arguments @('-interaction=nonstopmode', '-halt-on-error', '-output-directory=tmp', 'thesis-diff.tex') `
  -FailureMessage 'Initial pdflatex pass failed for thesis-diff.tex'

Invoke-CheckedCommand `
  -Executable 'biber' `
  -Arguments @('--input-directory', 'tmp', '--output-directory', 'tmp', 'thesis-diff') `
  -FailureMessage 'Biber failed for thesis-diff'

Invoke-CheckedCommand `
  -Executable 'pdflatex' `
  -Arguments @('-interaction=nonstopmode', '-halt-on-error', '-output-directory=tmp', 'thesis-diff.tex') `
  -FailureMessage 'Second pdflatex pass failed for thesis-diff.tex'

Invoke-CheckedCommand `
  -Executable 'pdflatex' `
  -Arguments @('-interaction=nonstopmode', '-halt-on-error', '-output-directory=tmp', 'thesis-diff.tex') `
  -FailureMessage 'Final pdflatex pass failed for thesis-diff.tex'

Copy-Item -LiteralPath (Join-Path $repoRoot 'tmp\thesis-diff.pdf') -Destination (Join-Path $repoRoot 'thesis-diff.pdf') -Force
