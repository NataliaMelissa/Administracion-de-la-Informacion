#Leer el archivo:
data<-read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 6/Data/missing-data.csv",na.strings = "")

#3. Reemplazo de datos NA con la media o la extracción aleatoria de valores
#Caso 1: Reemplazo de datos NA con la media de la población 
#Reemplazar los valores '0' a NA antes de sacar la media
data$Income[data$Income == 0] <- NA

#Se crea una cuarta columna (Income.mean) al dataframe Data que contiene el promedio de los ingresos de la población
data$Income.mean <- ifelse(is.na(data$Income), mean(data$Income, na.rm = TRUE), data$Income)
#Si los valores son NA -> los reemplaza con el promedio de ingresos de la población
#Si los valores no son NA -> se queda con los valores originales de los ingresos