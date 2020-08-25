
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ADARdata

<!-- badges: start -->

<!-- badges: end -->

O pacote **`{ADARdata}`** contém os dados empregados no livro
[ADAR](https://lhmet.github.io/adar-ebook/).

## Instalação

O pacote pode ser instalado a partir do [GitHub](https://github.com/)
com:

``` r
# install.packages("devtools")
devtools::install_github("lhmet/ADARdata")
```

## Lista de dados

A tabela abaixo apresenta os dados disponibilizados com o
**`{ADARdata}`**.

``` r
library(easypackages)
pacotes <- c("ADARdata",
             "tibble",
             "dplyr",
             "knitr"
             )
libraries(pacotes)
#> Loading required package: ADARdata
#> Loading required package: tibble
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: knitr
#> All packages loaded successfully
# dados disponibilizados
ds <- data(package = 'ADARdata') %>%
  .$results %>%
  tibble::as_tibble() %>% 
  dplyr::select(dados = Item, descrição = Title) %>%
  knitr::kable()
ds
```

| dados               | descrição                                            |
| :------------------ | :--------------------------------------------------- |
| clima\_sm           | Dados meteorológicos diários de Santa Maria-RS       |
| recordes\_atual\_sm | Recordes de temperatura e precipitação do último ano |
| tempo\_sm           | Dados meteorológicos do ano atual                    |
