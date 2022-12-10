#' 读取大文件的表头数据
#'
#' @param filename 文件名 包含后缀
#'
#' @export
#'
show_file_head <- function(filename)
{
  a <- read.table(filename, nrows = 10, header = TRUE)
  for (i in colnames(a)){
    print(i)
  }
}
