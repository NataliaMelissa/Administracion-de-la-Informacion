#Carga de Datos
install.packages("jsonlite")
library(jsonlite)
DFVideos_MX <- read.csv("MXvideos_cc50_202101.csv", header = TRUE, stringsAsFactors = FALSE)
View(DFVideos_MX)
#Carga de Categorías
Categoria_MX <- fromJSON("MX_category_id.json")
id <- (Categoria_MX[["items"]][["id"]])
titulo <- (Categoria_MX[["items"]][["snippet"]][["title"]])
DFCategoria <- data.frame(id, titulo)
View(DFCategoria)
#No hay id 29 en DFCategoría, por lo que se carga el archivo US
Categoria_US <- fromJSON("US_category_id.json")
id <- (Categoria_US[["items"]][["id"]])
titulo <- (Categoria_US[["items"]][["snippet"]][["title"]])
DFCategoriaEx <- data.frame(id, titulo)
View(DFCategoriaEx)
#Añadiendo Categorías al Dataframe
DFVideos_MX$category_id[is.na(DFVideos_MX$category_id)] <- 0
DFVideos_MX$category <- DFVideos_MX$category_id
n = 1
for (id in DFCategoria$id){
  DFVideos_MX$category <- replace(DFVideos_MX$category, DFVideos_MX$category == id, DFCategoria$titulo[n])
  n = n+1
}
DFVideos_MX$category[DFVideos_MX$category == "29"] <- DFCategoriaEx$titulo[17]
DFVideos_MX$category[DFVideos_MX$category == "0"] <- 'Undefined'
names(DFVideos_MX)[names(DFVideos_MX) == "ï..video_id"] <- "video_id"
#Guardando el Dataframe Extraído en Rdata y csv
save(DFVideos_MX, file = "~/R/EB-Admin-Info/Data/DF_Extraido.RData")
write.csv(DFVideos_MX, file = "~/R/EB-Admin-Info/Data/DF_Extraido.csv", row.names = FALSE)
