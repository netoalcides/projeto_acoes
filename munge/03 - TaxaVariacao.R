info( logger, "ACOES_PROJECT::Cria dataset com as taxas de variacao" )

variacao <- dados %>% 
  mutate_if( is.numeric, 
             funs( (. - lag(.)) / lag(.) ) ) %>% 
  na.omit
