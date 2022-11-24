
#' install pkgs
#'
#' @export install_mr
#'
#' @examples install_mr()
install_mr <- function(){
  packages <- c("usethis", "devtools", "remotes", "data.table", "do", "eoffice")

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[,"Package"]) {
      install.packages(packages[i], dependencies = TRUE, quiet = TRUE, keep_outputs=TRUE)
    }
  }

  remotes::install_github("MRCIEU/TwoSampleMR", upgrade=c("never"))

  auth_token = "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"

  devtools::install_github("kexhong/MendelR",
                           auth_token = auth_token,
                           force = TRUE, upgrade=c("never"))

  library(TwoSampleMR)
  library(MendelR)
  mr_o2o("ieu-b-2", "ieu-a-2", write_csv=FALSE, write_ppt=FALSE)
}
