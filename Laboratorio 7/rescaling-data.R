#Directorio de trabajo:
setwd("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7")

install.packages("scales")
library(scales)

#1. Transformación lineal de datos (reescalado lineal)
#Cargar los datos en un dataframe estudiantes
estudiantes <- read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/data-conversion1.csv")
View(estudiantes) #Ver dataframe

#Se reescalan los valores de Income del dataframe estudiantes a valores entre 0 y 1  con la función rescale()
estudiantes$Income.rescaled <- rescale(estudiantes$Income) #La función rescale() reescala los valores con mínimo 0 y máximo 1
View(estudiantes)

#El valor reescalado se obtiene: (Valor original - Valor Mínimo)/(Valor Máximo - Valor Mínimo)
(estudiantes$Income - min(estudiantes$Income)) / (max(estudiantes$Income)- min(estudiantes$Income))

#Se puede reescalar los valores especificando un parámetro con rescale(Dataframe, parámetro)
rescale(estudiantes$Income, to = c(0,100))
View(estudiantes)

#Reescalado de más de una variable en un dataframe
rescalar.cols <- function(df, cols){ #Función para reescalar múltiples variables
  nombres <- names(df)
  for (col in cols){
    nombre <- paste(nombres[col], 'rescaled', sep = '.')
    df[nombre] <- rescale(df[,col])
  }
  cat(paste("Hemos reescalado ", length(cols), " variable(s)"))
  df
}

#Reescalando las variables edad (Age) y altura (Height) del df estudiantes. 
estudiantes <- rescalar.cols(estudiantes, c(1,4)) 
View(estudiantes)


