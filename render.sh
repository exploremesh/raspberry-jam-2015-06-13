#!/bin/bash
pandoc -o welcome.pdf welcome.md --latex-engine=xelatex -V geometry:"top=0.4in, left=0.4in, right=0.4in, bottom=0.6in" -V documentclass=article -V mainfont="Open Sans" -V fontsize=12pt
