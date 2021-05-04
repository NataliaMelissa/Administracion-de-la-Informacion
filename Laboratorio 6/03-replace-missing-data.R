#3. Reemplazo de datos NA con la media o la extracción aleatoria de valores
#Caso 2: : Reemplazo de datos NA con un valor aleatorio simple 
rand.valor <- function(x){
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  Valorado <- x
  Valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return(Valorado)
}

#Función que recibe como parámetros el dataframe y los nombres de sus columnas que queremos pre-procesar:
random.df <- function(df, cols){
  nombres <- names(df)
  for(col in cols){
    nombre <- paste(nombres[cols], "Valorado", sep = ".")
    df[nombre] <- rand.valor(df[,col])
  }
  df
}

#Se crea un nuevo dataframe limpio, contiene nuevas columnas con los datos limpios provenientes de las columnas 1 (Income) y 2 (Phone_type)
#Las nuevvas columnas creadas son Income.valorado y Phone_type.valorado
data.limpio <- random.df(data, c(1,2))
View(data.limpio)