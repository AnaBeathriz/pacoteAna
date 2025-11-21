#' Gráfico de pizza simples
#'
#' @param valores Vetor numérico com os valores.
#' @param categorias Vetor de nomes das categorias.
#' @param title Título do gráfico.
#'
#' @return Um gráfico de pizza (base R)
#' @export
#' @importFrom graphics pie
plot_pie <- function(valores, categorias, title = "") {

  porcentagens <- round(valores / sum(valores) * 100, 1)
  rotulos <- paste0(categorias, " (", porcentagens, "%)")

  cores <- grDevices::colorRampPalette(c("#D0E1F9", "#0D3B66"))(length(valores))

  pie(valores,
      labels = rotulos,
      col = cores,
      main = title,
      border = "white")
}

