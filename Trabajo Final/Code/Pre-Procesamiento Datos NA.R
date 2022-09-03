#Pre Procesamiento
DFVideos_MX <- read.csv("~/R/EB-Admin-Info/Data/DF_Extraido.csv")
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

#Eliminando filas con video_id vacíos
View(DFMexico_Limpio)
Vacios <- DFMexico_Limpio$video_id == ""
summary(Vacios)
DFMexico_Limpio <- subset(DFMexico_Limpio, video_id != "")
Vacios <- DFMexico_Limpio$video_id == ""
summary(Vacios)

N <- DFMexico_Limpio$video_id == "\\n"
summary(N)
DFMexico_Limpio <- subset(DFMexico_Limpio, video_id != "\\n")
N <- DFMexico_Limpio$video_id == "\\n"
summary(N)

row.names(DFMexico_Limpio) <- NULL

#Llenando valores vacíos
Vacios <- DFMexico_Limpio$description == ""
summary(Vacios)
DFMexico_Limpio$description <- replace(DFMexico_Limpio$description, Vacios, "Sin descripción")

Vacios <- DFMexico_Limpio$thumbnail_link == ""
summary(Vacios)
DFMexico_Limpio$thumbnail_link <- replace(DFMexico_Limpio$thumbnail_link, Vacios, "Link Inexistente")

table(DFMexico_Limpio$ratings_disabled)
table(DFMexico_Limpio$comments_disabled)
table(DFMexico_Limpio$video_error_or_removed)

Vacios <- DFMexico_Limpio$ratings_disabled == ""
summary(Vacios)
DFMexico_Limpio$ratings_disabled <- replace(DFMexico_Limpio$ratings_disabled, Vacios, "DESCONOCIDO")

Vacios <- DFMexico_Limpio$comments_disabled == ""
summary(Vacios)
DFMexico_Limpio$comments_disabled <- replace(DFMexico_Limpio$comments_disabled, Vacios, "DESCONOCIDO")

Vacios <- DFMexico_Limpio$video_error_or_removed == ""
summary(Vacios)
DFMexico_Limpio$video_error_or_removed <- replace(DFMexico_Limpio$video_error_or_removed, Vacios, "DESCONOCIDO")

table(DFMexico_Limpio$ratings_disabled)
table(DFMexico_Limpio$comments_disabled)
table(DFMexico_Limpio$video_error_or_removed)

Vacios <- DFMexico_Limpio$tags == ""
summary(Vacios)
DFMexico_Limpio$tags <- replace(DFMexico_Limpio$tags, Vacios, "Sin tags")

Vacios <- DFMexico_Limpio$tags == "[none]"
summary(Vacios)
DFMexico_Limpio$tags <- replace(DFMexico_Limpio$tags, Vacios, "Sin tags")

Vacios <- DFMexico_Limpio$title == ""
summary(Vacios)
DFMexico_Limpio$title <- replace(DFMexico_Limpio$title, Vacios, "Sin titulo")

Vacios <- DFMexico_Limpio$channel_title == ""
summary(Vacios)
DFMexico_Limpio$channel_title <- replace(DFMexico_Limpio$channel_title, Vacios, "Sin canal")

Vacios <- DFMexico_Limpio$trending_date == ""
summary(Vacios)

Vacios <- DFMexico_Limpio$publish_time == ""
summary(Vacios)


#Quitando los outliers

boxplot(DFMexico_Limpio$likes, horizontal = TRUE)
boxplot.stats(DFMexico_Limpio$likes)
out<-DFMexico_Limpio$likes[DFMexico_Limpio$likes<17533]

boxplot(out, horizontal = TRUE)
boxplot.stats(out)
out<-out[out<7265]

boxplot(DFMexico_Limpio$views, horizontal = TRUE)
boxplot.stats(DFMexico_Limpio$views)
out<-DFMexico_Limpio$views[DFMexico_Limpio$views<17533]

boxplot(out, horizontal = TRUE)
boxplot.stats(out)
out<-out[out<492021]

boxplot(DFMexico_Limpio$dislikes, horizontal = TRUE)
boxplot.stats(DFMexico_Limpio$dislikes)
out<-DFMexico_Limpio$dislikes[DFMexico_Limpio$dislikes<647]

boxplot(out, horizontal = TRUE)
boxplot.stats(out)
out<-out[out<508]


#Guardando Dataframe
save(DFMexico_Limpio, file = "~R/EB-Admin-Info/Data/DF_Limpio.RData")
write.csv(DFMexico_Limpio, "DFMexicoVideos_Limpio.csv", row.names = FALSE)
