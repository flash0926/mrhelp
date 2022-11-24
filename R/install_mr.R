
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

  remotes::install_github("MRCIEU/TwoSampleMR")
  devtools::install_github("kexhong/MendelR",
                           auth_token = "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",
                           force = TRUE, upgrade=c("never"))

  library(TwoSampleMR)
  library(MendelR)
  mr_o2o("ieu-b-2", "ieu-a-2", write_csv=FALSE, write_ppt=FALSE)
}
