info( logger, "ACOES_PROJECT::Define os dados a serem coletados" )


agua <- c( "SBSP3.SA" )

alimentos <- c( "JBSS3.SA" )

bancos <- c( "BBAS3.SA", "BBDC4.SA", "BBDC3.SA", "BBSE3.SA", "ITSA4.SA", "ITUB4.SA" )

educacao <- c( "KROT3.SA", "ESTC3.SA" )

energia <- c( "EQTL3.SA", "ENBR3.SA" )

imoveis <- c( "MULT3.SA", "BRML3.SA" )

minerio <- c( "PETR3.SA", "PETR4.SA", "USIM5.SA", "GOAU4.SA", "CMIG4.SA", "VALE3.SA" )

quimica <- c( "BRKM5.SA" )

saude <- c( "RADL3.SA", "QUAL3.SA" )

transporte <- c( "CCRO3.SA", "ECOR3.SA"  )

telecom <- c( "VIVT4.SA", "TIMP3.SA" )

varejo <- c( "LREN3.SA", "PCAR4.SA", "UGPA3.SA", "VVAR3.SA", "LAME4.SA")

indices <- c( "^BVSP" )


lista_ativos <- c( agua, alimentos, bancos, educacao, 
                   energia, imoveis, minerio, quimica, 
                   saude, transporte, telecom, varejo, 
                   indices )


info( logger, "ACOES_PROJECT::Coleta os dados" )

dados <- map( lista_ativos, 
              function(x) {getSymbols( x, 
                                       src = "yahoo", 
                                       from = "2000-01-01", 
                                       to = as.Date( Sys.Date() ) , 
                                       auto.assign = FALSE) } )

rm(lista_ativos) # limpa o objeto da memoria


