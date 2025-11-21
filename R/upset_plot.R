#' UpSet Plot a partir de uma lista de vetores
#'
#' @param lista Lista nomeada de vetores (cada vetor é um conjunto).
#' @param order_by Ordem das interseções (default: "freq").
#'
#' @return Um UpSet plot.
#' @export
plot_upset <- function(lista, order_by = "freq") {

  genes <- unique(unlist(lista))
  df <- data.frame(Gene = genes)

  for (nome in names(lista)) {
    df[[nome]] <- df$Gene %in% lista[[nome]]
  }

  df[, -1] <- lapply(df[, -1], as.numeric)

  UpSetR::upset(
    df,
    sets = names(lista),
    order.by = order_by
  )
}
