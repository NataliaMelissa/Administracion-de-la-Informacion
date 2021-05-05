#3. Crear ficheros de datos

#Cada vez que se compilan comandos en R, se crean y guardan las variables, funciones, etc en el Global environment
# - Estas variables se pueden guardar en un fichero de tipo .RData
# - Una vez guardados en el fichero, se pueden guardar, enviar (persona o computadora), cargar en otra sesión de RStudio o computadora, 

#caso 1: Crear y cargar ficheros Rdata y rds
clientes <- c("Arturo", "Bill", "Jack") #Vector nombre clientes
fechas <- c("2021-05-01", "2021-04-28", "2021-03-30") #Vector fechas
pagos <- c(315.1, 205.4,450.2) #Vector pagos
cliente.frec <- c("Arturo", "Jack") #Vector clientes frecuentes

#Convertir los strings en formato fecha utilizando la funcion date()
fechas <- as.Date(c("2021-05-01", "2021-04-28", "2021-03-30"))

pedidos <- data.frame(clientes, fechas, pagos) #Se crea dataframe pedidos que contiene el vector clientes, fechas, pagos
View(pedidos)

#Fichero RData:
#Se guarda el Dataframe pedidos con la función Save(objeto, Lugar a guardar), Lugar a guardar = directorio de trabajo
save(pedidos, file = "C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/pedidos.Rdata")

#Se pueden guardar más de dos objetos en el mismo file
save(pedidos, cliente.frec, file = "C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/pedidos.Rdata")

#Para guardar todos los objetos de la sesión actual, utilizaremos la función save.image(Lugar a guardar)
save.image(file = "C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/alldata.Rdata" )

#Fichero rds:
saveRDS(pedidos, file = "C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/pedidos.rds")

#Se pueden guardar los objetos en un fichero rds con la función saveRDS()
# - En este caso, solo se serializa (guarda en disco) los datos mas no el nombre del objeto.
# - En la función saveRDS(objeto, Lugar a guardar) Solo es posible almacenar un objeto por archivo .rds

#Eliminación de objetos del ambiente global
remove(pedidos) 

# Para liberar memoria en R:
# - Es recomendable eliminar los objetos que ya no utilizamos con la función remove()
# - Limpiar el entorno de variables y la consola con el icono de la escoba

#Carga de archivos RData
load("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/pedidos.Rdata") 
#La carga de archivos RData se realiza mediante la función load(Direccion donde se guardó el fichero)

#Para ser notificados durante la carga, sobre la existencia de objetos con el mismo nombre en nuestra sesión de trabajo
# - Se debe utilizar la función attach() en vez de la función load()
# - Los parámetros de attach(Direccion donde se guardó el fichero)
# - Con attach() mostrará una advertencia si el objeto ya existe en la sesión de trabajo
attach("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/pedidos.Rdata")

#Carga de archivos rds
orders <- readRDS("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/pedidos.rds")

#Para cargar archivos rds se debe:
# - 1ro crear la variable en donde será almacenado
# - 2do utilizar la función readRDS() para cargar el archivo rds
#   -> Los parámetros de readRDS(Direccion donde se guardó el fichero)

#Caso 2: Crear un fichero CSV a partir de un dataframe
write.csv(pedidos,'pedidos.csv', na="NA",row.names=FALSE) #Ejemplo 1
write.csv(pedidos,'pedidos2.csv', na="NA") #Ejemplo 2

#La funcion write.csv() es para crear archivos .csv (excel)
# - Se guarda el dataframe luego de que ha pasado por las técnicas de pre procesamiento (el DF está "limpio")
# - Los parámetros de la función write.csv(DF, na="NA") son:
#   -> DF = nombre del dataframe del que se va a crear el archivo csv
#   -> na = "NA" significa que los valores NA del dataframe pasarán como cadena de string "NA"
#   -> row.names = FALSE permite evitar que se cree una primera variable con un número correlativo de fila.
#      *Este parámetro es opcional, el Ejemplo 1 la tiene y el Ejemplo 2 no lo tiene