#Pre Procesamiento
ValoresVacios <- is.na(DFVideos_MX)
View(ValoresVacios)
summary(ValoresVacios)

#Funciones para valores aleatorios
rand.valor <- function(x){
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}

random.df <- function(df, cols){
  nombres <- names(df)
  for (col in cols) {
    nombre <- paste(nombres[col], sep = ".")
    df[nombre] <- rand.valor(df[,col])
  }
  df
}

#Reemplazo por datos aleatorios columnas likes(9), dislikes(10), views(8), comment_count(11)
DFMexico_Limpio <- random.df(DFVideos_MX, c(8,9,10,11))
Comprobacion_Aleatorio <- is.na(DFMexico_Limpio)
summary(Comprobacion_Aleatorio)

#Guardando Dataframe
save(DFMexico_Limpio, file = "~R/EB-Admin-Info/Data/DF_Limpio.RData")
write.csv(DFMexico_Limpio, "DFMexicoVideos_Limpio.csv", row.names = FALSE)