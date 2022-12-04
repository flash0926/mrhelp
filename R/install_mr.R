
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

  remotes::install_github("MRCIEU/TwoSampleMR", upgrade=c("never"), quiet=TRUE)

  e <- tryCatch(detach("package:MendelR", unload = TRUE),
                error = function(e) "e")

  auth_token = paste("github_pat", "11ADKTPDY0f11t1onGFYTc_dER4Ozc4RbXtbrV9JrEfzub5YJhde03Ua4pxveSFwcQC7RF6PB5GPRhf8pB", sep='_')

  remotes::install_github("flash0926/MendelR",
                           auth_token = auth_token,
                           force = TRUE, upgrade=c("never"))

  library(TwoSampleMR)
  library(MendelR)
}
