
#' Load all packages needed, installing any missing packages if desired.
#'
#' @param auto_install Install any packages that could not be loaded.
#' @param update Update any packages that can be updated.
#' @param java_mem Amount of RAM to allocate to rJava; must happen before
#'   library is loaded. If it happens afterwards it will not change available memory.
#' @param verbose If TRUE display extra output during execution.
load_all_packages =
  function(packages_cran = NULL,
           packages_github = NULL,
           auto_install = FALSE,
           update = FALSE,
           java_mem = NULL,
           verbose = FALSE) {
    
  if (verbose) {
    # Output R version so we know which package versions we're using.
    cat(R.version.string, "\n")
  }
  
  if (verbose) {
    cat("CRAN packages:", paste(packages_cran, collapse = ", "), "\n")
    cat("Github packages:", paste(packages_github, collapse = ", "), "\n")
  }
  
  # Allocate memory to rJava for bartMachine; needs to happen before we load rJava library.
  # TODO: may want to defer this step (and loading rJava) until we have setup parallelization.
  if (!is.null(java_mem)) {
    ck37r::set_java_memory(java_mem)
  }
  
  # Code is not yet run. We run afterward, possibly with messages suppressed.
  expression = quote({
    
    # Install any packages from github that are needed.
    if (length(packages_github) > 0) {
      # This will consider installing all packages, in case the github version
      # is more up to date.
      # TODO: only try for non-installed packages unless update = TRUE.
      if (auto_install) {
        devtools::install_github(packages_github)
      }
      
      if (is.null(names(packages_github))) {
        # Extract package name as the repo name of each package, if the vector itself is not named.
        # This assumes github packages are of the form: username/repo@whatev (@whatev optionally included).
        github_names = gsub("^[^/]+/([^@]+)", "\\1", packages_github)
      } else {
        # Support a named vector, in case the package name is not the same as the repo name.
        github_names = names(packages_github)
      }
      invisible(sapply(github_names, require, character.only = T))
    }
    
    # This part clearly requires that the ck37r package was already installed,
    # either via packages_cran or packages_github.
    ck37r::load_packages(packages_cran, auto_install, update, verbose = verbose)
  })
  
  # Now run the stored code either directly or with messages suppressed.
  if (verbose) {
    # Allow messages to be output.
    eval(expression)
  } else {
    # Supress messages.
    suppressMessages(eval(expression))
  }
  
  if (verbose) {
    invisible(ck37r::get_java_memory(verbose = TRUE))
  }
}

#' @param packages_cran Character vector of CRAN packages to load, and possibly install if needed.
#' @param packages_github Character vector of github packages to load, and possibly install if needed.
startup = function(packages_cran = NULL,
                   packages_github = NULL,
                   auto_install = FALSE,
                   verbose = FALSE,
                   ...) {
  
  # We need to bootstrap two minimally required packages: devtools and ck37r.
  
  if (!suppressMessages(suppressWarnings(require("devtools")))) {
    if (verbose) cat("Package devtools not found; installing.\n")
    if (auto_install) {
      install.packages("devtools")
      library(devtools)
    } 
    # Try again.
    if (!suppressMessages(suppressWarnings(require("devtools")))) {
      stop('Package devtools is required but not installed. Try install.packages("devtools")')
    }
  }
  
  # Confirm that ck37r is installed.
  if (!suppressMessages(suppressWarnings(require(ck37r)))) {
    if (verbose) cat("Package ck37r not found; installing.\n")
    if (auto_install) {
      devtools::install_github("ck37/ck37r")
    }
    # Try again.
    if (!suppressMessages(suppressWarnings(require(ck37r)))) {
      stop('Package ck37r is required but not installed. Try devtools::install_github("ck37/ck37r")')
    }
  }
  
  if (is.null(packages_cran)) {
    # Extract defaults based on an attribute so that it can be examined/modified if needed.
    packages_cran = attr(startup, "packages_cran")
  }
  
  if (is.null(packages_github)) {
    # Extract defaults based on an attribute so that it can be examined/modified if needed.
    packages_github = attr(startup, "packages_github")
  }
  
  # This could be moved to load_all_packages.
  # TODO: move this function to ck37r::startup()
  load_all_packages(packages_cran = packages_cran,
                    packages_github = packages_github,
                    auto_install = auto_install,
                    verbose = verbose,
                    ...)
}
# Specify defaults as attributes so that they can be extracted programmatically.
attr(startup, "packages_cran") = c(
  ##################
  # Survival
  "survival",
  "survminer",
  
  ##################
  # Visualization
  "ggplot2",
  
  
  ##################
  # Data manipulation
  #"data.table",
  "dplyr",
  "plyr",
  #"tibble",
  #"tidyr",
  #"forcats",
  
  ##################
  # Data input/output
  #"feather",
  #"readr",
  "haven",
  "rio",
  
  ################
  # High performance computation
  "doParallel",
  #"doSNOW",
  "future",
  "RhpcBLASctl",
  
  ################
  # Reporting
  #"xtable",
  
  #################
  # Machine learning
  
  # Warning: This will crash R if a JDK is not installed.
  "bartMachine",
  #"caret",
  "e1071",
  "earth",
  #"gam",
  #"gbm",
  "glmnet",
  #"h2o",        # This needs a custom install, version on CRAN is too old.
  #"KernelKnn",
  "kernlab",
  "mgcv",
  "nnet",
  #"pROC",
  #"randomForest",
  "ranger",
  "ROCR",
  "rpart",
  #"speedglm",
  "xgboost",
  
  ################
  # Statistics
  #"gee",
  #"sandwich"#,
  
  ################
  # Misc
  "pryr"
)

attr(startup, "packages_github") = c(
#  "ecpolley/SuperLearner",
  "wilsoncai1992/survtmle2",
  "wilsoncai1992/onestep.survival",
  "benkeser/survtmle",
  "ck37/ck37r")
