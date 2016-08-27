(TeX-add-style-hook
 "solution"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "geometry"
    "graphicx"
    "amssymb"
    "epstopdf"
    "amsmath"
    "amsthm"
    "mathtools"
    "pdfpages")
   (TeX-add-symbols
    '("ts" 1))
   (LaTeX-add-labels
    "sec:main-problem"
    "sec:tl-dr"
    "sec:proof"
    "eq:2"
    "eq:3"
    "eq:4"
    "sec:extra-credit"
    "eq:5"
    "eq:6"
    "eq:7"
    "eq:8"
    "eq:9")))

