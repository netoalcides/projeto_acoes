#### Analise Exploratoria dos precos ####
dados %>% 
  gather( key = ativos, value = precos, -data ) %>% 
  ggplot( aes(x = data, y = precos, colour = ativos) ) +
  facet_wrap( ~ ativos, scales = "free" ) +
  geom_line() +
  theme( legend.position = "none" )

dados %>% 
  gather( key = ativos, value = precos, -data ) %>% 
  group_by( ativos ) %>% 
  summarise_at( vars(precos),
                funs(min, max) ) %>% 
  data.frame

#### Analise Exploratoria da taxa de variacao ####
# graficos #
variacao %>% 
  gather( key = ativos, value = taxa, -data ) %>% 
  ggplot( aes(x = data, y = taxa, colour = ativos) ) +
  facet_wrap( ~ ativos, scales = "free" ) +
  geom_line() +
  theme( legend.position = "none" )

# medidas de posicao e variacao
variacao %>% 
  gather( key = ativos, value = taxa, -data ) %>% 
  group_by( ativos ) %>% 
  summarise_at( vars(taxa),
                funs(mean, sd, min, max) ) %>% 
  data.frame

# grafico com media e desvio padrao

variacao %>% 
  gather( key = ativos, value = taxa, -data ) %>% 
  group_by( ativos ) %>% 
  summarise_at( vars(taxa),
                funs(mean, sd, min, max) ) %>% 
  ggplot( aes( x = sd, y = mean, colour = ativos ) ) +
  geom_point() +
  xlab( 'risco' ) +
  ylab( 'retorno' )

# grafico com media e desvio padrao em html
graf_html <- variacao %>% 
  gather( key = ativos, value = taxa, -data ) %>% 
  group_by( ativos ) %>% 
  summarise_at( vars(taxa),
                funs(mean, sd, min, max) ) %>% 
  ggplot( aes( x = sd, y = mean, colour = ativos ) ) +
  geom_point( size = 5) +
  xlab( 'risco' ) +
  ylab( 'retorno' )

ggplotly( graf_html )  

# media e dp por ano

variacao %>%
  mutate( ano = year(data) ) %>% 
  select( -data ) %>% 
  gather( key = ativos, value = taxa, -ano ) %>% 
  group_by( ativos, ano ) %>% 
  summarise_at( vars(taxa),
                funs(mean, sd, min, max) ) %>% 
  plot_ly( x = ~sd,
           y = ~mean,
           frame = ~ano,
           color = ~ativos,
           text = ~paste('</br> media: ', round(mean, 4),
                         '</br> dp: ', round(sd, 4),
                         '</br> ativo: ', ativos ),
           hoverinfo = 'text',
           type = 'scatter',
           mode = 'markers',
           marker = list(size = 10),
           showlegend = F )













