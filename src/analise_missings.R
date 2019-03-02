#### Verifica missings nos ativos ####
# Tabela
dados %>% 
  gather( key = ativos, value = valores, -data ) %>% 
  mutate( valores = ifelse( is.na(valores) == TRUE, 'na', 'ok') ) %>% 
  group_by( ativos ) %>% 
  count( valores ) %>% 
  spread( key = valores, value = n ) %>% 
  mutate( total = na + ok,
          perc_perdidos = na / total * 100 ) %>% 
  arrange( desc(perc_perdidos) ) %>% 
  data.frame


# Grafico
dados %>% 
  gather( key = ativos, value = valores, -data ) %>% 
  mutate( valores = ifelse( is.na(valores) == TRUE, 'na', 'ok') ) %>% 
  group_by( ativos ) %>% 
  count( valores ) %>% 
  spread( key = valores, value = n ) %>% 
  mutate( total = na + ok,
          perc_perdidos = na / total * 100 ) %>% 
  ggplot( aes( x = reorder( ativos, -perc_perdidos ), y = perc_perdidos) ) +
  geom_bar( stat = 'identity' )


#### Verifica missings nos ativos para os ultimos 5 anos ####
# Tabela
dados %>% 
  filter( year( data ) >= year( Sys.Date() ) - 5 ) %>% 
  gather( key = ativos, value = valores, -data ) %>% 
  mutate( valores = ifelse( is.na(valores) == TRUE, 'na', 'ok') ) %>% 
  group_by( ativos ) %>% 
  count( valores ) %>% 
  spread( key = valores, value = n ) %>% 
  mutate( total = na + ok,
          perc_perdidos = na / total * 100 ) %>% 
  arrange( desc(perc_perdidos) ) %>% 
  data.frame


# Grafico
dados %>% 
  filter( year( data ) >= year( Sys.Date() ) - 5 ) %>% 
  gather( key = ativos, value = valores, -data ) %>% 
  mutate( valores = ifelse( is.na(valores) == TRUE, 'na', 'ok') ) %>% 
  group_by( ativos ) %>% 
  count( valores ) %>% 
  spread( key = valores, value = n ) %>% 
  mutate( total = na + ok,
          perc_perdidos = na / total * 100 ) %>% 
  ggplot( aes( x = reorder( ativos, -perc_perdidos ), y = perc_perdidos) ) +
  geom_bar( stat = 'identity' )
