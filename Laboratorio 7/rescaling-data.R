#Directorio de trabajo:
setwd("C:/Naty/Universidad/Ciclo 6/Administraci�n de la informaci�n/Rstudio/Laboratorio 7")

install.packages("scales")
library(scales)

#1. Transformaci�n lineal de datos (reescalado lineal)
#Cargar los datos en un dataframe estudiantes
estudiantes <- read.csv("C:/Naty/Universidad/Ciclo 6/Administraci�n de la informaci�n/Rstudio/Laboratorio 7/Data/data-conversion1.csv")
View(estudiantes) #Ver dataframe

#Se reescalan los valores de Income del dataframe estudiantes a valores entre 0 y 1  con la funci�n rescale()
estudiantes$Income.rescaled <- rescale(estudiantes$Income) #La funci�n rescale() reescala los valores con m�nimo 0 y m�ximo 1
View(estudiantes)

#El valor reescalado se obtiene: (Valor original - Valor M�nimo)/(Valor M�ximo - Valor M�nimo)
(estudiantes$Income - min(estudiantes$Income)) / (max(estudiantes$Income)- min(estudiantes$Income))

#Se puede reescalar los valores especificando un par�metro con rescale(Dataframe, par�metro)
rescale(estudiantes$Income, to = c(0,100))
View(estudiantes)

#Reescalado de m�s de una variable en un dataframe
rescalar.cols <- function(df, cols){ #Funci�n para reescalar m�ltiples variables
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


