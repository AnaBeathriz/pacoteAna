#' Dotplot de enriquecimento funcional
#'
#' @param df Data frame contendo vias, log10(FDR) e número de genes.
#' @param via Coluna com nome da via.
#' @param log10_col Coluna com valor -log10(FDR).
#' @param genes_col Coluna com número de genes.
#'
#' @return Um gráfico ggplot2.
#' @export
#' @importFrom dplyr %>% arrange desc mutate
#' @importFrom stringr str_wrap
#' @importFrom ggplot2 ggplot aes geom_point scale_fill_gradient theme_minimal labs
plot_dotplot_enriquecimento <- function(df, via, log10_col, genes_col) {

  df2 <- df %>%
    dplyr::arrange(dplyr::desc({{ log10_col }})) %>%
    dplyr::mutate(via_wrapped = stringr::str_wrap({{ via }}, width = 40),
                  via_wrapped = factor(via_wrapped, levels = rev(unique(via_wrapped))))

  ggplot2::ggplot(df2, ggplot2::aes(x = {{ log10_col }}, y = via_wrapped)) +
    ggplot2::geom_point(ggplot2::aes(size = {{ genes_col }}, fill = {{ log10_col }}),
                        shape = 21, color = "black") +
    ggplot2::scale_fill_gradient(low = "#B8E3A5", high = "#1B3E76") +
    ggplot2::theme_minimal() +
    ggplot2::labs(x = expression(Log[10]~FDR), y = NULL)
}
