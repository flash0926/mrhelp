
#' 按照MendelR包和相关依赖
#'
#' @export install_mr
#'
#' @examples install_mr()
install_mr <- function(){
  packages <- c("usethis", "RPostgreSQL","devtools", "remotes", "data.table", "do", "eoffice", "epigraphdb")

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
  if(!"MVMR" %in% installed.packages()[,"Package"]){
    devtools::install_github("WSpiller/MVMR", build_opts = c("--no-resave-data", "--no-manual"), build_vignettes = TRUE)
  }

  #remotes::install_github("MRCIEU/gwasvcf", upgrade=c("never"), quiet=TRUE)
  #remotes::install_github("Bioconductor/VariantAnnotation", upgrade=c("never"), quiet=TRUE)

  if ("MendelR" %in% (.packages())) {
    e <- tryCatch(detach("package:MendelR", unload = TRUE))
  }

  url <- "https://kimfiles.oss-cn-beijing.aliyuncs.com/MendelR.zip"
  download.file(url, "MendelR.zip")

  install.packages("MendelR.zip", repos = NULL, type = "win.binary")

  library(MendelR)
}
