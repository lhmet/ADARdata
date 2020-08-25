#' Dados meteorológicos diários de Santa Maria-RS
#'
#' Conjunto de dados diários de temperatura do ar e precipitação de
#' Santa Maria-RS fornecidos pelo INMET
#'
#' @name dados_sm
#' @format Todos os dados estão no formato [tibble][tibble::tibble-package].
#' @section Dados disponíbilizados:
#' Os dados são compostos de 3 quadro de dados:
#' \describe{
#' 		\item{[clima_sm]}{dados históricos diários}
#'   	\item{[tempo_sm]}{dados diários do último ano}
#'	 	\item{[recordes_atual_sm]}{recordes do último ano}
#' }
#' @source	\url{https://bdmep.inmet.gov.br/}
NULL

#-------------------------------------------------------------------------------
#' Dados e estatísticas diárias do clima de Santa Maria-RS
#'
#' Contém os dados climáticos e as estatísticas descritivas para cada dia do
#' ano da  estação meteorológica do INMET em Santa Maria-RS.
#'
#' @format `clima_sm` consiste em um [tibble][tibble::tibble-package] com
#' 20564 linhas e 19 colunas.
#' \describe{
#' 		\item{date}{data em formato POSIXct (formato de data e horário no R)}
#' 		\item{tar}{temperatura do ar média diária em °C}
#' 		\item{prec}{precipitação diária acumulada em mm}
#' 		\item{dda}{dia do ano, varia de 1 a 365 (ou 366)}
#' 		\item{tar_max}{temperatura máxima absoluta no `dda`}
#' 		\item{tar_min}{temperatura mínima absoluta no `dda`}
#' 		\item{tar_med}{temperatura média no `dda`}
#' 		\item{tar_valid}{número de observações válidas no `dda`}
#' 		\item{tar_se}{erro padrão médio dad `tar` para o `dda`}
#' 		\item{prec_max}{`prec` máxima no `dda`}
#' 		\item{prec_min}{`prec` mínima no `dda`}
#' 		\item{prec_med}{`prec` média no `dda`}
#' 		\item{prec_valid}{número de observações de `prec` válidas no `dda`}
#' 		\item{prec_se}{desvio padrão da `prec` para o `dda`}
#' 		\item{n}{número de anos, limite máximo de `tar_valid` e `prec_valid`}
#' 		\item{tar_med_max}{é a \eqn{tar_med + 1*tar_se}}
#' 		\item{tar_95}{percentis de 95% das observações `tar` no `dda`}
#' 		\item{tar_med_min}{é a \eqn{tar_med - 1*tar_se}}
#' 		\item{tar_05}{percentis de 5% das observações `tar` no `dda`}
#' }
#' @keywords datasets
#' @docType data
#' @importFrom tibble tibble
#' @source	\url{https://bdmep.inmet.gov.br/}
"clima_sm"




#-------------------------------------------------------------------------------
#' Dados meteorológicos do último ano
#'
#' Dados meteorológicos diários observados no último ano na estação
#' meteorológica do INMET em Santa Maria-RS.
#'
#' @keywords datasets
#' @docType data
#' @format `tempo_sm` consiste em um  [tibble][tibble::tibble-package] com
#'  201 linhas e 4 colunas.
#' \describe{
#' 		\item{date}{data em formato POSIXct (formato de data e horário no R)}
#' 		\item{tar}{temperatura do ar média diária em °C}
#' 		\item{prec}{precipitação diária acumulada em mm}
#' 		\item{dda}{dia do ano, varia de 1 a 365 (ou 366)}
#' }
#' @importFrom tibble tibble
#' @source	\url{https://bdmep.inmet.gov.br/}
"tempo_sm"


#-------------------------------------------------------------------------------
#' Recordes de temperatura do último ano
#'
#' @format [tibble][tibble::tibble-package] com 9 linhas e 8 colunas.
#' \describe{
#' 		\item{dda}{dia do ano}
#' 		\item{tar_min}{temperatura mínima absoluta histórica}
#' 		\item{tar_max}{temperatura máxima absoluta histórica}
#' 		\item{date}{data em formato POSIXct}
#' 		\item{tar}{valor da ocorrência do recorde}
#' 		\item{record_max}{um caractere, 'S' ('N') indica que é (não é) um recorde de
#' 		temperatura máxima}
#' 		\item{record_min}{um caractere, 'S' ('N') indica que é (não é) um recorde de
#' 		temperatura mínima}
#' }
#' @importFrom tibble tibble
#' @source	\url{https://bdmep.inmet.gov.br/}
"recordes_atual_sm"
