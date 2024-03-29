#4. Evitar duplicaci�n de observaciones
familia.salario <- c(40000,60000,50000, 80000, 60000, 70000, 60000)
familia.integrantes <- c(4,3,2,2,3,4,3)
familia.auto <- c("Lujo", "Compacto", "SUV", "Lujo", "Compacto", "Compacto", "Compacto")

#Se crea el dataframe familia con los valores de familia.salario, familia.integrantes, familia.autos
familia <- data.frame(familia.salario, familia.integrantes, familia.auto) 
View(familia)

#Para ver los valores duplicados se utilizar la funci�n duplicated(), retorna un vector booleano
#True -> el valor es duplicado
#False -> el valor no es duplicado
duplicated(familia)

#Ver las observaciones duplicadas en el dataframe familia
familia[duplicated(familia),]

#Ver las observaciones �nicas del dataframe familia utilizando la funci�n unique(), que no tenga datos duplicados
unique(familia)

#Crear un dataframe con observaciones �nicas
familias.unicas <- unique(familia)
View(familias.unicas)
duplicated(familias.unicas) #Esto es para comprobar
#lo que sale de la funci�n duplicated es todo "false" porque no hay ninguna observaci�n duplicada
