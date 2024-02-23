install:
   curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh 

compile:
  tectonic -Z shell-escape --keep-intermediates agujournaltemplate.tex
