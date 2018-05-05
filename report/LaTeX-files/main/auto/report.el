(TeX-add-style-hook
 "report"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "oneside" "notitlepage")))
   (TeX-run-style-hooks
    "latex2e"
    "../notebook"
    "../notebook-cells/1"
    "../notebook-cells/2"
    "../notebook-cells/3"
    "../notebook-cells/4"
    "../notebook-cells/5"
    "../notebook-cells/6"
    "../notebook-cells/7"
    "../notebook-cells/8"
    "../notebook-cells/9"
    "../notebook-cells/10"
    "../notebook-cells/11"
    "../notebook-cells/12"
    "../notebook-cells/13"
    "../notebook-cells/14"
    "../notebook-cells/15"
    "../notebook-cells/16"
    "../notebook-cells/17"
    "../notebook-cells/18"
    "../notebook-cells/19"
    "../notebook-cells/20"
    "../notebook-cells/21"
    "book"
    "bk10")
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

