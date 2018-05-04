(TeX-add-style-hook
 "report"
 (lambda ()
   (TeX-run-style-hooks
    "../notebook")
   (TeX-add-symbols
    '("code" 1)
    "pcausal"
    "pobserved"
    "ecausal"
    "eobserved"
    "logistic")
   (LaTeX-add-labels
    "cha:backgr-quest-quest"
    "cha:data-exper-descr"
    "sec:antic-chall"
    "sec:caus-analys-exper"
    "sec:variables-interest"
    "sec:works-cited"
    "cha:appendices"
    "sec:appendix-1")))

