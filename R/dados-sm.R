#'	Dados meteorológicos diários de Santa Maria-RS
#'
#'	Conjunto de dados diários de temperatura do ar e precipitação de
#'	Santa Maria-RS fornecidos pelo INMET
#'
#'
#'	@section Dados disponíbilizados:
#'	Os dados são compostos de 3 quadro de dados:
#'	\describe{
#'			\item{[clima_sm]}{dados históricos diários}
#'			\item{[tempo_sm]}{dados diários do último ano}
#'			\item{[recordes_atual_sm]}{recordes do último ano}
#'	}
#'	@format Todos os dados estão no formato [tibble][tibble::tibble-package].
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"dados_sm"

#-------------------------------------------------------------------------------
#'	Estatísticas diárias do clima de Santa Maria-RS
#'
#'	Estatísticas descritivas para cada dia do ano baseada na série histórica
#'	dos dados climáticos da estação meteorológica do INMET em Santa Maria-RS.
#'
#'  @keywords datasets
#'  @docType data
#'  @format `clima_sm` consists of the following information in a
#'  [tibble][tibble::tibble-package]  with 201 rows and 4 columns.
#' 	\describe{
#' 			\item{date}{data em formato POSIXct (formato de data e horário no R)}
#' 			\item{tar}{temperatura do ar média diária em °C}
#' 			\item{prec}{precipitação diária acumulada em mm}
#' 			\item{dda}{dia do ano, varia de 1 a 365 (ou 366)}
#' 	}
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"tempo_sm"

#-------------------------------------------------------------------------------
#'	Dados meteorológicos do último ano
#'
#'	Dados meteorológicos diários observados no último ano na estação
#'	meteorológica do INMET em Santa Maria-RS.
#'
#'  @keywords datasets
#'  @docType data
#'  @format `tempo_sm` consists of the following information in a
#'  [tibble][tibble::tibble-package]  with 201 rows and 4 columns.
#' 	\describe{
#' 			\item{date}{data em formato POSIXct (formato de data e horário no R)}
#' 			\item{tar}{temperatura do ar média diária em °C}
#' 			\item{prec}{precipitação diária acumulada em mm}
#' 			\item{dda}{dia do ano, varia de 1 a 365 (ou 366)}
#' 	}
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"tempo_sm"


#-------------------------------------------------------------------------------
#'	Recordes de temperatura e precipitação do último ano
#'
#'	@format [tibble][tibble::tibble-package].
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"recordes_atual_sm"
