#!/bin/sh

grep -m 1 -e '\s*describe\s*(' "$1" | # the first line with a describe(
    cut -f1 -d, | # whatever is left of the first comma
    cut -f2 -d'(' | # whatever is right of the first left-paren
    sed 's/^.\(.*\).$/\1/' # trim off the first and last character (the quotes)
                           # I would have liked non-greedy here but oh well
