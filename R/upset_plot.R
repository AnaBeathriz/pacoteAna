#' Dotplot de enriquecimento funcional
#'
#' Gera um dotplot mostrando Log10_FDR vs vias, com tamanho proporcional ao numero de genes
#' e forma de acordo com o banco de dados de referencia.
#'
#' @param df Data frame com colunas: Via, Database, Log10_FDR, Input_number.
#' @return Um grafico ggplot2.
#' @export
plot_enriquecimento <- function(df) {

  # Ordena e ajusta os fatores
  df <- df %>%
    dplyr::arrange(desc(Log10_FDR)) %>%
    dplyr::mutate(Via = factor(stringr::str_wrap(Via, 40),
                               levels = rev(unique(stringr::str_wrap(Via, 40)))))

  # Cria o dotplot
  grafico <- ggplot2::ggplot(df, ggplot2::aes(x = Log10_FDR, y = Via)) +
    ggplot2::geom_rect(ggplot2::aes(ymin = as.numeric(Via)-0.45, ymax = as.numeric(Via)+0.45,
                                    xmin = 0, xmax = max(Log10_FDR)+0.3, fill = Log10_FDR),
                       alpha = 0.25, color = "white", linewidth = 0.5) +
    ggplot2::geom_vline(xintercept = c(2,4,6), linetype = "dotted", color = "grey40",
                        linewidth = 0.6, alpha = 0.8) +
    ggplot2::geom_segment(ggplot2::aes(x = 0, xend = Log10_FDR, y = Via, yend = Via, color = Log10_FDR),
                          linewidth = 2.2, alpha = 0.9) +
    ggplot2::geom_point(ggplot2::aes(size = Input_number, fill = Log10_FDR, shape = Database),
                        color = "black", stroke = 0.7, alpha = 0.95) +
    ggplot2::scale_fill_gradient(low = "#B8E3A5", high = "#1B3E76", name = expression(Log[10]~FDR)) +
    ggplot2::scale_color_gradient(low = "#B8E3A5", high = "#1B3E76", guide = "none") +
    ggplot2::scale_size_continuous(range = c(4,14), name = "Numero de genes") +
    ggplot2::scale_shape_manual(values = c("Reactome"=21,"KEGG PATHWAY"=22,"PANTHER"=24)) +
    ggplot2::labs(x = expression(Log[10]~FDR), y = NULL,
                  title = "Enriquecimento funcional", shape = "Banco de dados") +
    ggplot2::theme_minimal(base_size = 15) +
    ggplot2::theme(panel.grid = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_text(size = 12, face = "bold"),
                   axis.text.x = ggplot2::element_text(size = 12),
                   plot.title = ggplot2::element_text(size = 16, face = "bold", hjust = 0.5),
                   legend.position = "right",
                   legend.title = ggplot2::element_text(size = 13, face = "bold"),
                   legend.text = ggplot2::element_text(size = 12))

  return(grafico)
}
