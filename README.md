
# pacoteAna

Pacote R com um conjunto de funções para criar diferentes tipos de gráficos, incluindo gráficos de barras horizontais, gráficos de pizza, dotplots para enriquecimento funcional e heatmaps.

## Descrição

Este pacote oferece funções para visualizar dados categóricos e numéricos, assim como resultados de enriquecimento funcional. Ele inclui:

- Gráficos de barras horizontais para dados categóricos.  
- Gráficos de pizza simples.  
- Dotplots para enriquecimento funcional com FDR e contagem de genes.  
- Gráficos de enriquecimento funcional com anotação de banco de dados.  
- Heatmaps com opção de escalonamento por linha.  

## Instalação

Você pode instalar a versão de desenvolvimento do pacote diretamente do GitHub:
[GitHub](https://github.com/) com:

``` r
# install.packages("pak")
pak::pak("AnaBeathriz/pacoteAna")
```

##Exemplos de uso
library(pacoteAna)

# 1. Gráfico de barras horizontais
df <- data.frame(grupo = c("A", "B", "A", "C"))
plot_bar_categorias(df, coluna = grupo)

# 2. Gráfico de pizza
valores <- c(10, 20, 30)
categorias <- c("A", "B", "C")
plot_pie(valores, categorias, title = "Gráfico de Pizza Exemplo")

# 3. Dotplot de enriquecimento funcional
df <- data.frame(
  via = c("Caminho 1", "Caminho 2"),
  Log10_FDR = c(3, 5),
  Input_number = c(10, 20)
)
plot_dotplot_enriquecimento(df, via, Log10_FDR, Input_number)

# 4. Gráfico de enriquecimento com banco de dados
df <- data.frame(
  Via = c("Caminho 1", "Caminho 2"),
  Database = c("Reactome", "KEGG PATHWAY"),
  Log10_FDR = c(3, 5),
  Input_number = c(10, 20)
)
plot_enriquecimento(df)

# 5. Heatmap com escalonamento por linha
mat <- matrix(rnorm(20), nrow = 4)
plot_heatmap(mat, scale = TRUE)
