#' mr use method
#'
#' @export
#'
#' @examples
#' mr_use()
mr_use <- function(){

  message("常用方法")
  message("1.两个ieu编号方法")
  message("mr_o2o(\"ieu-a-2", "ieu-a-2\")")
  message("2.第一个参数是本地的csv文件, 第二个是ieu编号")
  message("mr_l2o(\"snp_file", "ieu-a-2\")")
  message("3.两个都是本地csv文件")
  message("mr_o2o(\"snp_file_1", "snp_file_2\")")
  message("")
  message("可以传入的参数:")
  message("p1 = 5e-8, p2=5e-5,\nwrite_csv=TRUE, write_ppt=TRUE,\nmethod_list = c(\"mr_ivw","mr_egger_regression","mr_weighted_median", "mr_weighted_mode\"),\nrm_snps=NULL")
  message("")
  message("csv 文件的表头格式一定是:")
  message("SNP,beta,se,effect allele,other allele,pval,eaf")
}
