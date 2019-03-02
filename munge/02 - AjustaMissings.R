info( logger, "ACOES_PROJECT::Ajusta os missings" )

dados %<>%
  filter( year( data ) >= year( Sys.Date() ) - 5 ) %>%
  na.omit()
