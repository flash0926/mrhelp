
#' 按照MendelR包和相关依赖
#'
#' @export install_mr
#'
#' @examples install_mr()
install_mr <- function(){
  packages <- c("usethis", "RPostgreSQL","devtools", "remotes", "data.table", "do", "eoffice")

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[,"Package"]) {
      install.packages(packages[i], dependencies = TRUE, quiet = TRUE, keep_outputs=TRUE)
    }
  }
  if (!"MRPRESSO" %in% installed.packages()[,"Package"]) {
    devtools::install_github("rondolab/MR-PRESSO",upgrade=c("never"), quiet=TRUE)
  }
  if (!"meta" %in% installed.packages()[,"Package"]) {
    devtools::install_github("guido-s/meta",upgrade=c("never"), quiet=TRUE)
  }
  if (!"TwoSampleMR" %in% installed.packages()[,"Package"]) {
    devtools::install_github("MRCIEU/TwoSampleMR",upgrade=c("never"), quiet=TRUE)
  }

  #remotes::install_github("MRCIEU/gwasvcf", upgrade=c("never"), quiet=TRUE)
  #remotes::install_github("Bioconductor/VariantAnnotation", upgrade=c("never"), quiet=TRUE)

  #卸载后重新安装
  (path <- .libPaths()[sapply(.libPaths(), function(i) "MendelR" %in%
                                list.files(i))])
  unlink(paste0(path, "/", "MendelR"), force = TRUE, recursive = TRUE)
  e <- tryCatch(detach("package:MendelR", unload = TRUE),
                error = function(e) "e")
  ######
  kk <- "11ADKTPDY0HYNqG2vJR8ZT_n4gpY6PvMajZiXWujKkwnodAXjIsg6ufWUoRTuX57kmP2X5HZG5np4K14w9"
  auth_token = paste("github_pat", kk, sep='_')
  ###
  remotes::install_github("flash0926/MendelR",
                           auth_token = auth_token,
                           force = TRUE, upgrade=c("never"))

  library(TwoSampleMR)
  library(MendelR)
}
