
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
                           force = TRUE, quiet=TRUE)

  library(TwoSampleMR)
  library(MendelR)
  mr_o2o("ieu-b-2", "ieu-a-2", write_csv=FALSE, write_ppt=FALSE)
}
