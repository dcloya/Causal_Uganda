(TeX-add-style-hook
 "packagePreamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("color" "pdftex") ("graphicx" "pdftex") ("hyperref" "colorlinks=true") ("enumitem" "inline") ("tcolorbox" "most")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "graphics"
    "color"
    "graphicx"
    "amsthm"
    "relsize"
    "amsmath"
    "amssymb"
    "framed"
    "hyperref"
    "enumitem"
    "bbold"
    "mathrsfs"
    "mathtools"
    "fancyhdr"
    "xargs"
    "tcolorbox"
    "bm")))

