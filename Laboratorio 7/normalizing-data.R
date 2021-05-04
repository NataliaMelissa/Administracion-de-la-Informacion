#2. Normalización / estandarización de datos
#Carga de datos
casas <- read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/BostonHousing.csv")
View(casas)

#Caso 1: Normalización ajustando al promedio y desviación típica
casas.z <- scale(casas) 
View(casas.z)

casas.a <-scale(casas, center = TRUE, scale = TRUE)
casas.B <-scale(casas, center = FALSE, scale = FALSE)


#La función scale() se usa para estandarizar los valores
# - Solo se puede usar cuando todas las variables son numéricas o da error
# - Estandariza los valores a 0,1 (a cada columna le resta la media y la divide entre su desviación típica)
# - Los valores que están cercanos a cero serian los muy cercanos a la media de dicha variable en el dataset
# - Los muy mayores a cero serían los más distantes a la media de dicha variable en el dataset
# - Tiene dos argumentos muy importantes la función scale:
#   -> Centre = TRUE, habilita la resta de la media y scale = TRUE habilita la división entre la desviación típica.
#   -> center = FALSE y scale = FALSE, obtenemos el dataframe inicial (no realiza la normalización)
#   -> center = TRUE y scale = FALSE, se hace la normalización ajustando el promedio
#   -> center = FALSE y scale = TRUE, se hace la normalización ajustando a la desviación estándar o típica


#caso 2: Normalización ajustando al promedio
casas.mean <- scale(casas, center = TRUE, scale = FALSE)
View(casas.mean)

#Caso 3: Normalización ajustando a la desviación típica o estándar
casas.sd <- scale(casas, center = FALSE, scale = TRUE)
View(casas.sd)

#Normalización de más de una variable conservando las variables originales
normalizar.cols <- function(df, cols){
 nombres <- names(df)
 for (col in cols){
   nombre <- paste(nombres[col], "z", sep = ".")
   df[nombre]<- scale(df[,col])
 }
 cat(paste("Hemos normalizado ", length(cols), " variable(s)"))
 df
}

#Normalizamos con esta función, las variables 1, 3 y de la 5 a la 8 del dataframe original casas
casas <- normalizar.cols(casas, c(1,3,5:8))
View(casas)
  




