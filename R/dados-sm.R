#'	Dados meteorológicos diários de Santa Maria-RS
#'
#'	Conjunto de dados diários de temperatura do ar e precipitação de
#'	Santa Maria-RS fornecidos pelo INMET
#'
#'
#'	@section Dados disponíbilizados:
#'	Os dados são compostos de 3 quadro de dados:
#'	\describe{
#'			\item{clima_sm}{dados históricos diários}
#'			\item{tempo_sm}{dados diários do último ano}
#'			\item{recordes_atual_sm}{recordes dos dados do último ano}
#'	}
#'	@format Todos os dados estão no formato [tibble][tibble::tibble-package].
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"clima_sm"

#'	Dados meteorológicos do ano atual
#'
#'	@format [tibble][tibble::tibble-package].
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"tempo_sm"

#'	Recordes de temperatura e precipitação do último ano
#'
#'	@format [tibble][tibble::tibble-package].
#'	@importFrom tibble tibble
#'	@source	\url{https://bdmep.inmet.gov.br/}
"recordes_atual_sm"
