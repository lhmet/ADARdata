# Preparação dos dados para gráficos do ggplot2 do cap. 11 do livro ADAR.

# Visualização da série diária de temperatura do ano atual
# contextualizada com as estatísticas passadas.

easypackages::libraries(
  c(
    "tidyverse", "rio", "openair",
    "lubridate", "magrittr", "janitor",
    "here"
  )
)

# dados de SM
# início 31/12/1911

# --------------------------------
# dados recebidos em um link por e-mail a partir de https://bdmep.inmet.gov.br/
# salvos em datasets/superficie/inmet e copiado para extdata
arq_bdmep <- here("inst/extdata/dados_83936_H_1911-12-31_2020-07-31.csv")

# importar dados
dados_hist <- rio::import(arq_bdmep,
  format = "csv",
  skip = 10,
  na.strings = "null",
  dec = ","
  # encoding = "Latin-1"
)
names(dados_hist)
dados_hist_orig <- dados_hist

# limpar nomes
dados_hist <- tibble::as_tibble(dados_hist) %>%
  setNames(., stringi::stri_trans_general(names(.), "latin-ascii")) %>%
  janitor::clean_names()

tail(dados_hist)
# arrumar nomes
(nms_orig <- names(dados_hist))
lut_nms <- c(
  "dia", "hora",
  "nuvens_altas", "nuvens_baixas", "nuvens_medias", "neb_dec",
  "prec", "patm", "patm_0",
  "tar_bs", "tar_bu", "td",
  "ur", "wd", "ws", "visib",
  "dummy"
)
names(lut_nms) <- nms_orig
dados_hist <- setNames(dados_hist, nm = lut_nms[names(dados_hist)])



# remover variavéis sem nenhum dado
dados_hist <- dados_hist %>%
  dplyr::select(!where(~ all(is.na(.x))))

# dados_hist %>% select(hora) %>% distinct()

# date
dados_hist <- dados_hist %>%
  dplyr::mutate(
    hora = recode(hora,
      "1200" = "12",
      "1800" = "18",
      "0" = "00"
      # .default = "NA"
    ),
    hora = paste0(hora, ":00:00"),
    date = lubridate::as_datetime(paste0(dia, " ", hora)),
    dia = NULL,
    hora = NULL
  ) %>%
  dplyr::select(date, tar_bs, prec, dplyr::everything())


# verificando vars numericas
sample_n(dados_hist, 20)
# dados_hist <- mutate(across(-date, as.numeric))


# janitor::tabyl(dados_hist, nuvens_altas) %>%
#   janitor::adorn_pct_formatting(digits = 0, affix_sign = TRUE) %>%
#   janitor::adorn_totals(where = c("row", "col"))

# psych::describe(dados_hist, na.rm = TRUE)

# filter de obs that have values at least for one variable
# is.POSIXct(dados_hist$date)
any_obs_valid <- function(x) rowSums(!is.na(x)) > 0

dados_hist <-
  filter(dados_hist, any_obs_valid(
    across(
      .cols = where(~ !is.POSIXct(.x))
      # .fns = ~ .x > 0
    )
  ))

# dados_hist %>% select(where(~ !is.POSIXct(.x)))
# some_obs <- apply(dados_hist[, -1], 1, function(x) any(!is.na(x)))
# sum(some_obs)
# dados_hist <- filter(dados_hist, some_obs)



# dados_hist %>%
#   #filter() %>%
#   openair::timePlot(., c("tar_bs", "prec"))

#------------------------------------------------------------------------------
# dados diários
dd_hist <- dados_hist %>%
  dplyr::arrange(date) %>%
  dplyr::rename("tar" = tar_bs) %>%
  # get_dupes()
  dplyr::mutate(
    date = date - 3 * 3600,
    ###################################
    # remoção de dados errôneos de prec
    ###################################
    prec = dplyr::if_else(!(year(date) <= 1986 | year(date) >= 2000), NA_real_, prec)
  ) %>%
  dplyr::group_by(date = lubridate::ceiling_date(date, unit = "day")) %>%
  dplyr::summarise(
    dplyr::across(
      .cols = tar,
      .fns = list(med = mean, valid = ~ sum(!is.na(.x))),
      na.rm = TRUE
    ),
    dplyr::across(
      .cols = prec,
      .fns = list(tot = sum, valid = ~ sum(!is.na(.x))),
      na.rm = TRUE
    ),
    n = n(),
    .groups = "drop"
  ) # %T>%  openair::timePlot(., c("tar_med", "prec_tot"))

#------------------------------------------------------------------------------
# estatiscas por dia do ano dos anos anteriores
passado <- dd_hist %>%
  dplyr::select(date, tar = tar_med, prec = prec_tot) %>%
  dplyr::mutate(dda = lubridate::yday(date)) %>%
  # tira o ano atual
  dplyr::filter(lubridate::year(date) != lubridate::year(lubridate::today())) %>%
  dplyr::group_by(dda) %>%
  dplyr::arrange(dda) %>%
  dplyr::mutate(
    dplyr::across(
      .cols = dplyr::all_of(c("tar", "prec")),
      .fns = list(
        max = ~ max(.x, na.rm = TRUE),
        min = ~ min(.x, na.rm = TRUE),
        med = ~ mean(.x, na.rm = TRUE),
        valid = ~ sum(!is.na(.x)),
        se = ~ sd(.x, na.rm = TRUE)
      ),
      na.rm = TRUE
    ),
    n = n()
  ) %>%
  dplyr::mutate(
    tar_med_max = tar_med + (2.101 * tar_se / sqrt(tar_valid)),
    tar_95 = quantile(tar, probs = 0.975, na.rm = TRUE),
    tar_med_min = tar_med - (2.101 * tar_se / sqrt(tar_valid)),
    tar_05 = quantile(tar, probs = 0.025, na.rm = TRUE)
    # prec_med_sup = prec_med + (2.101*prec_se/sqrt(prec_valid)),
    # prec_med_inf = prec_med - (2.101*prec_se/sqrt(prec_valid))
  ) %>%
  ungroup()
passado

# timePlot(filter(passado, year(date) == 2018),
#          c("tar", "tar_med","tar_max", "tar_med_max",
#            "tar_min", "tar_med_min"),
#          group = TRUE)

#------------------------------------------------------------------------------
# dados atuais: ultimo ano
atual <- dd_hist %>%
  dplyr::select(
    date,
    tar = tar_med#,
    #prec = prec_tot
    ) %>%
  dplyr::mutate(dda = lubridate::yday(date)) %>%
  # tira o ano atual
  dplyr::filter(lubridate::year(date) == lubridate::year(lubridate::today()))

# recordes históricos de max e min
recordes <- passado %>%
  dplyr::select(dda, tar_min, tar_max) %>%
  dplyr::distinct()


recordes_atual <- dplyr::left_join(recordes, atual, by = "dda") %>%
  dplyr::mutate(
    record_max = dplyr::if_else(tar > tar_max, "S", "N"),
    record_min = dplyr::if_else(tar < tar_min, "S", "N")
  ) %>%
  dplyr::filter(record_max == "S" | record_min == "S")

# ---------------------------------------------------------------
# dados_pres <-

clima_sm <- as_tibble(passado)
tempo_sm <- atual
recordes_atual_sm <- recordes_atual

usethis::use_data(
  clima_sm, tempo_sm, recordes_atual_sm,
  version = 3,
  overwrite = TRUE
)
