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
    "pdfpages")))

