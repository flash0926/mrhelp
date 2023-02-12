#' MendelR包常用使用方法
#'
#' @export
#'
#' @examples mr_use()
#'
mr_use <- function(){
  message("常用方法")
  message("两样本")
  message("mr_common(\"ieu-a-2\", \"ieu-a-2\")")
  message("p1 = 5e-8, p2=5e-5,\nwrite_csv=TRUE, write_ppt=TRUE,\nmethod_list = c(\"mr_ivw\",\"mr_egger_regression\",\"mr_weighted_median\", \"mr_weighted_mode\"),\nrm_snps=NULL")
  message("")
  message("中介孟德尔")
  message("mr_intermediary(\"ebi-a-GCST001475\", \"ukb-a-328\", \"ieu-b-4954\")")
  message("多变量孟德尔")
  message("mr_multi(c(\"ieu-a-2\", \"ieu-b-2\"), \"ebi-a-GCST011081\")")
  message("药靶孟德尔")
  message("mr_common(\"ieu-a-300\", \"ieu-a-7\", r2=0.3, kb=100, gene=\"HMGCR\", eaf_threshold = 0.01)")

  message("本地数据文件的表头格式一定是:")
  message("SNP,beta,se,effect allele,other allele,pval,eaf")
  message("根据原数据的变量含义修改")
}
