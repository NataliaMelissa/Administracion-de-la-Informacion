#Directorio de trabajo:
setwd("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7")

#1. Categorización de datos numéricos
estudiantes2 <- read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/data-conversion.csv")
View(estudiantes2)

niveles <- c(-Inf, 10000, 31000, Inf) #Vectoe valores de niveles
nom.nivel <- c('Bajo', 'Medio', 'Alto') #Vector nombre de niveles

#Ejemplo 1: se le asignan los breaks 
estudiantes2$Income.cat <- cut(estudiantes$Income, breaks = niveles, labels = nom.nivel) #Creación columna adicional al DF estudiantes2 llamada Income.cat

#variable categorica = variable que pertenece a una categoría pueden ser numéricas o no, pero no se pueden realizar operaciones numéricas

#La función cut() sirve para asignar asigna las etiquetas a la variable categórica en base a otra variable
# - Se le asigna el valor en base a otra variable (VariableBase)
# - Los "break" se le pueden asignar (como el ejemplo 1) o se puede hacer que se los asigne R
# - "labels" es el valor (en este caso un nombre) que tendrá la variable categorica creada 
#   -> En el ejemplo 1 los nombres están en el vector nom.nivel, entonces labels = nom.nivel
#   -> En el ejemplo 2 los nombres se le asignan con c() y se escriben directamente ahí, entonces labels = c()
# - cut(VariableBase, breaks, labels)

View(estudiantes2)
str(estudiantes2)

#Ejemplo 2: R asigna los breaks
estudiantes2$Income.cat2 <- cut(estudiantes2$Income, breaks = 4,labels = c("Nivel 1", "Nivel 2", "Nivel 3", "Nivel 4"))
View(estudiantes2)
str(estudiantes2)

#Caso: Variables ficticias categóricas
estudiantes3 <- read.csv("C:/Naty/Universidad/Ciclo 6/Administración de la información/Rstudio/Laboratorio 7/Data/data-conversion.csv")
install.packages("dummies")
library(dummies)

View(estudiantes3)

#Se crea un nuevo dataset utilizando la función dummy.data.frame()
estudiantes3.dummy <- dummy.data.frame(estudiantes3, sep = ".")
names(estudiantes3.dummy)
View(estudiantes3.dummy)
dummy(estudiantes3$State, sep=".")

#Se puede especificar una lista de nombres de columnas categóricas de un dataframe a las que se le quiera crear variables ficticias
dummy.data.frame(estudiantes3, names = c("State"), sep =".") #Se crea la columna con la variable ficticia "State"
dummy.data.frame(estudiantes3, names = c("State", "Gender"), sep =".") #Se crean 2 columnas con variables ficticias: "State" y "Gender"


