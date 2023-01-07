
#' 按照MendelR包和相关依赖
#'
#' @export install_mr
#'
#' @examples install_mr()
install_mr <- function(){
  packages <- c("usethis", "devtools", "remotes", "data.table", "do", "eoffice","meta")

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[,"Package"]) {
      install.packages(packages[i], dependencies = TRUE, quiet = TRUE, keep_outputs=TRUE)
    }
  }
  devtools::install_github("rondolab/MR-PRESSO",upgrade=c("never"), quiet=TRUE)
  remotes::install_github("MRCIEU/TwoSampleMR", upgrade=c("never"), quiet=TRUE)
  remotes::install_github("MRCIEU/gwasvcf", upgrade=c("never"), quiet=TRUE)
  remotes::install_github("Bioconductor/VariantAnnotation", upgrade=c("never"), quiet=TRUE)

  e <- tryCatch(detach("package:MendelR", unload = TRUE),
                error = function(e) "e")

  auth_token = paste("github_pat", "11ADKTPDY0DlIrrlhweINi_FTWUg5Ho3SPhVm29nEXNd91f25JuyOhzzPeQZSGmjtETCFRYAZ2FNiTpg04", sep='_')

  remotes::install_github("flash0926/MendelR",
                           auth_token = auth_token,
                           force = TRUE, upgrade=c("never"))

  library(TwoSampleMR)
  library(MendelR)
}
