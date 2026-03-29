# Manual Build Check

## Commands
1. `latexmk -pdf -interaction=nonstopmode thesis.tex`
2. `pdflatex -interaction=nonstopmode -output-directory=tmp thesis.tex`

## Result
- `latexmk` processed the new chapter structure and produced `tmp/thesis.pdf`, but the final move to `thesis.pdf` failed with `Permission denied`.
- A direct `pdflatex` run to `tmp/` completed successfully after the final wording cleanup and again produced `tmp/thesis.pdf`.
- The new file structure is valid enough for LaTeX to process both `ch06_discussion.tex` and `ch07_conclusion_future_work.tex`.

## Interpretation
- The `Permission denied` problem looks like an output file lock on `thesis.pdf`, not a chapter-source syntax failure.
- The direct `pdflatex` pass confirms that the chapter sources compile after the final review-driven edits.
- The log also requested a rerun for cross-references, which is normal after adding a new included chapter file.

## Practical conclusion
- The chapter integration is wired correctly.
- The final edited Chapter 6 and Chapter 7 sources compile to `tmp/thesis.pdf`.
- Rebuild again after releasing the lock on `thesis.pdf` if you want the top-level output file refreshed.
