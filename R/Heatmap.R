#' Heatmap simples
#'
#' @param mat Matriz numérica.
#' @param scale Se TRUE, aplica padronização por linha.
#'
#' @return Um heatmap gerado por pheatmap.
#' @export
plot_heatmap <- function(mat, scale = FALSE) {

  if (scale) {
    mat <- t(scale(t(mat)))
  }

  pheatmap::pheatmap(mat)
}
