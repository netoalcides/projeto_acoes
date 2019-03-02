info( logger, "ACOES_PROJECT::Transforma em data frame" )

dados %<>%
  do.call( cbind, . )

dados <- data.frame( index(dados), as.data.frame(dados) )

dados %<>% 
  rename( data = index.dados. ) %>% 
  as_data_frame %>% 
  select( data, contains('Adjusted') )


info( logger, "ACOES_PROJECT::Renomeia colunas" )

colunas <- colnames( dados )[-1] %>% 
  str_extract(., pattern = '[^.]+') %>% 
  setNames( colnames( dados )[-1], . )

dados %<>% 
  rename_( .dots = colunas )
