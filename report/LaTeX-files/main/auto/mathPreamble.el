(TeX-add-style-hook
 "mathPreamble"
 (lambda ()
   (TeX-run-style-hooks
    "array")
   (TeX-add-symbols
    '("partialderivative" ["argument"] 1)
    '("brackets" 1)
    '("parentheses" 1)
    '("Matrix" 1)
    '("indicator" 1)
    "reals"
    "naturals"
    "integers"
    "independent"
    "expectation"
    "probability"
    "variance"
    "covariance"
    "iid"
    "otherepsilon"
    "realepsilon"
    "varepsilon"
    "epsilon"
    "independenT")
   (LaTeX-add-environments
    "formulae")
   (LaTeX-add-array-newcolumntypes
    "C"
    "L"
    "R")))

