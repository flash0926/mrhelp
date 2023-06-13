
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
  #if(!"MVMR" %in% installed.packages()[,"Package"]){
  #  devtools::install_github("WSpiller/MVMR", build_opts = c("--no-resave-data", "--no-manual"), build_vignettes = TRUE)
  #}

  #remotes::install_github("MRCIEU/gwasvcf", upgrade=c("never"), quiet=TRUE)
  #remotes::install_github("Bioconductor/VariantAnnotation", upgrade=c("never"), quiet=TRUE)

  if ("MendelR" %in% (.packages())) {
    e <- tryCatch(detach("package:MendelR", unload = TRUE))
  }

  check_and_download()

  if("MendelR" %in% installed.packages()[,"Package"]){
    message("下载并安装成功")
  }else{
    message("下载失败")
    message("可以自行打开链接下载安装 ")
    message(get_download_url())
  }
  library(MendelR)
}
check_and_download <- function(){
  url <- get_download_url()
  name <- ""
  if(.Platform$OS.type == "windows"){
    name <- "MendelR.zip"
  }else{
    name <- "MendelR.tar.gz"
  }
  if(file.exists(name)){
    file.remove(name)
  }
  download.file(url, name)
  install.packages(name, repos = NULL)
}

get_download_url <- function(){
  url <- ""
  if(.Platform$OS.type == "windows"){
    url <- "https://kimfiles.oss-cn-beijing.aliyuncs.com/MendelR.zip"
  }else{
    url <- "https://kimfiles.oss-cn-beijing.aliyuncs.com/MendelR.tar.gz"
  }
  return(url)
}
