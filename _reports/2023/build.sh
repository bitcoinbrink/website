#!/bin/bash -e

SOURCES_IN_ORDER="""
  opening.md
  falbesoner.md
  ford.md
  goegge.md
  jahr.md
  stepanov.md
  vuylsteke.md
  zhao.md
  brink.md
"""

#  --variable mainfont="DejaVu Sans" \

pandoc \
  --template=template.tex \
  --variable papersize=a4 \
  --variable geometry:"top=2cm, bottom=2cm, left=2cm, right=2cm" \
  --variable classoption=twocolumn \
  --variable columnsep=800pt \
  --pdf-engine=xelatex \
  --variable urlcolor=blue \
  -o brink-annual-report-2023.pdf $SOURCES_IN_ORDER
  
