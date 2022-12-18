
#' 按照MendelR包和相关依赖
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

  remotes::install_github("MRCIEU/TwoSampleMR", upgrade=c("never"), quiet=TRUE)
  remotes::install_github("MRCIEU/gwasvcf", upgrade=c("never"), quiet=TRUE)
  remotes::install_github("Bioconductor/VariantAnnotation", upgrade=c("never"), quiet=TRUE)

  e <- tryCatch(detach("package:MendelR", unload = TRUE),
                error = function(e) "e")

  auth_token = paste("github_pat", "11ADKTPDY05rlfzotvJRRB_BzMcckFAzD3wg3XZk2c9BiqadXdAMovZcRfXhhiTcwUIGZQJ2KL6hM7J6gf", sep='_')

  remotes::install_github("flash0926/MendelR",
                           auth_token = auth_token,
                           force = TRUE, upgrade=c("never"))

  library(TwoSampleMR)
  library(MendelR)
}
