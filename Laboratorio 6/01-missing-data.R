setwd("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 6")
data<-read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 6/Data/missing-data.csv",na.strings = "")

#1. Eliminar Datos sin valor
data.limpia <- na.omit(data)
View(data.limpia)

#Verificar con la función is.na() los valores del dataframe que contengan "NA", retorna "True" si contiene NA y "False" si no tiene NA
is.na(data[4,2]) #Dataframe Data fila 4 columna 2: Valor NA -> is.na() retornará True
is.na(data[6,1]) #Dataframe Data fila 6 columna 1: Valor NA -> is.na() retornará True
is.na(data[1,1]) #Dataframe Data fila 1 columna 1: valor 89800 -> is.na() retornará false
is.na(data$Income) #Retornará un vector bool de la columna income del dataframe Data sobre los valores NA
is.na(data$Phone_type) #Retornará un vector bool de la columna Phone_typedel dataframe Data sobre los valores NA
is.na(data$Car_type) #Retornará un vector bool de la columna Car_type del dataframe Data sobre los valores NA

#2. Limpieza selectiva de datos sin valor
#Caso 1: Limpiar datos NA de sólo una variable de un dataframe
data.income.limpio <- data[!is.na(data$Income),]
data.prueba.limpio <- data[!is.na(data$Income),!is.na(data$Phone_type),!is.na(data$Car_type)]
data.prueba.limpio <- data[!is.na(data)]
rm(data.prueba.limpio)
na.omit(data.income.limpio)

#Caso 2: Limpiar datos NA de todo el dataframe
complete.cases(data.income.limpio) #La funcion complete.cases() qretorna un vector booleano
#Retorna True si encuentra valores NA
#Retorna False si no encuentra valores NA 
data.limpia2 <- data[complete.cases(data),]#El dataframe obtenido con na.omit() lo podemos generar también con la función complete.cases()

#Caso 3: Limpiar los valores ‘cero’ de una variable de un dataframe
data$Income[data$Income == 0] #Verificamos cuantas filas tiene Income con valor cero.
data$Income[data$Income == 0] <- NA #Asignarle el valor NA a los valores que tengan cero
data$Income[data$Income == 0] #Verificar cuántas filas tienen valor cero 

#Caso#4: Limpiar los valores NA con valores/métricas estadísticas y/o matemáticas
#Sacar el promedio de los ingresos: promedio de la columna "Income" del dataframe Data
mean(data$Income) #Si hay alguna variable NA, la función retornará que el promedio es NA
#Al poner na.rm=TRUE le dice que no considere los valores que sean NA para sacar el promedio
mean(data$Income, na.rm=TRUE) #La función mean() saca el promedio

#Desviación Estándar de salarios: la desviación estándar de la columna "Income" del datframe Data
sd(data$Income) #Calcula la desviación estandar la función sd()
#Al poner na.rm=TRUE le dice que no considere los valores que sean NA para sacar la desviación estándara
sd(data$Income, na.rm=TRUE)

#Suma de los salarios: suma la columna "Income" del dataframe Data
sum(data$Income) #Calcula la suma la función sum()
#Al poner na.rm=TRUE le dice que no considere los valores que sean NA para sacar la suma
sum(data$Income, na.rm=TRUE)



