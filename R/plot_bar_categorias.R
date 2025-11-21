#' Barplot horizontal de categorias
#'
#' @param df Data frame contendo a variável categórica.
#' @param coluna Nome da coluna (sem aspas, tidy evaluation).
#' @param fill_colors Vetor de cores nomeadas (opcional).
#'
#' @return Um gráfico ggplot2.
#' @export
plot_bar_categorias <- function(df, coluna, fill_colors = NULL) {

  df_count <- df %>%
    dplyr::count({{ coluna }})

  p <- ggplot2::ggplot(df_count,
                       ggplot2::aes(x = {{ coluna }}, y = n, fill = {{ coluna }})) +
    ggplot2::geom_col() +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal()

  if (!is.null(fill_colors)) {
    p <- p + ggplot2::scale_fill_manual(values = fill_colors)
  }

  return(p)
}

