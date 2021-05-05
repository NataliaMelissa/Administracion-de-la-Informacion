#2. Detección y corrección de valores atípicos
ozone.data <- read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/ozone.csv")
View(ozone.data)
#Importante: Se utiliza stringsAsFactors = FALSE para que los valores NA no los cargue como string sino como objeto NA.

#El método más común para identificar los outliers suele ser el boxplot
# - La forma más rápida donde podemos ver directamente los valores atípicos.
# - Los pequeños círculos fuera del bigote inferior de la caja son los outliersc

#Detección de valores atípicos;
outliers.values <- boxplot(ozone.data$pressure_height)$out #Se le asigna al vector outlier.values los valores sin outliers del dataframe ozone.data de la columna pressure_height
outliers.values

summary(ozone.data$pressure_height)

#Boxplot para ver los datos de la columna pressure_height del dataframe ozone.data
boxplot(ozone.data$pressure_height, main = "Pressure Heigh",
        boxwex = 0.5)

#El parámetro boxwex es útil para añadir un factor de escala que se aplica a la anchura de la caja
# - Menor a 1 la caja será más estrecha
# - Mayor a 1 será más amplia

#Boxplot para ver los datos de la columna pressure_height por mes (con la columna month) del DF ozone.data
boxplot(pressure_height ~ Month, data = ozone.data,
        main = "Pressure Height per Month")

#Boxplot para ver los valores por mes de la lectura de ozono, en la variable ozone_reading
boxplot(ozone_reading ~ Month, data = ozone.data,
        main = "Ozone reading per Month")

#Se puede acceder directamente a los valores atípicos usando el parámetro "out" en la función boxplot()
boxplot(ozone_reading ~ Month, data = ozone.data, main = "Ozone reading per Month")$out

#Corrección de valores atípicos
#Caso 1: : Cambio de outliers por el promedio y/o la mediana
fix_outliers <- function(x, removeNA = TRUE){
  #Calculamos los quantiles 1) por arriba del 5% y por debajo del 95%
    quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
    x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
    x[x>quantiles[2]] <- median(x, na.rm = removeNA)
    x
}

#La función creada fix_outliers  reemplazará los valores de una variable, considerando lo siguiente:
# - Si el valor atípico está por debajo del quinto percentil lo reemplazamos con la media.
# - Si el valor atípico está por encima del percentil 95, lo reemplazamos con la mediana.

#Prueba de la función fix_outliers reemplazando los valores atípicos de la variable pressure_height y no considerando los NA para el cálculo.
sin.outliers <- fix_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2)) #La función par() especifica el número de filas y columnas que tendrá el espacio donde se verán los boxplot.

#Se visualizan los datos sin outliers en un boxplot
boxplot(fix_outliers(ozone.data$pressure_height), main = "Presión sin Outliers")

#Se visualizan los datos con outliers en un boxplot
boxplot(ozone.data$pressure_height, main = "Presión con Outliers")

#Caso 2: Cambio de outliers enmascarando sus valores (capping) 
replace_outliers <- function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)
  # si el outlier esta por debajo del cuartil 0.5 o por arriba de 0.95
    caps <- quantile(x, probs = c(.05, .95), na.rm = removeNA)
    # Calculamos el rango intercuartilico
      iqr <- qrts[2]-qrts[1]
      # Calculamos el 1.5 veces el rango intercuartiligo (iqr)
        altura <- 1.5*iqr
        #reemplazamos del vector los outliers por debajo de 0.05 y 0.095
          x[x<qrts[1]-altura] <- caps[1]
          x[x>qrts[2]+altura] <- caps[2]
          x
}

#La función creada replace_outliers localiza los valores atípicos que caen arriba/debajo del bigote.
# - Pasadas las 1.5 veces el rango intercuartílico se decide "capar" o "enmascarar" dichas observaciones
#   ->  sustituyéndolas por el percentil 0.05 en caso que estén por debajo del bigote inferior
#   ->  sustituyéndolas por el percentil 0.95 en caso que estén por encima del bigote superior

par(mfrow = c(1,2))
#Se visualizan los datos sin outliers en un boxplot
boxplot(replace_outliers(ozone.data$pressure_height), main = "Presión sin Outliers")

#Se visualizan los datos con outliers en un boxplot
boxplot(ozone.data$pressure_height, main = "Presión con Outliers")

