#Cargar los datos
DFHoteles <- read.csv("hotel_bookings.csv")
View(DFHoteles)
#Inspeccionar los datos
nrow(DFHoteles)
ncol(DFHoteles)
colnames(DFHoteles)
str(DFHoteles)
summary(DFHoteles)
table(DFHoteles$reserved_room_type)
table(DFHoteles$assigned_room_type)

#Clientes repetidos:
barplot(table(DFHoteles$is_repeated_guest, DFHoteles$hotel),
        main = "Cliente repetido por tipo de hotel",
        xlab = "Tipo de hotel", ylab = "Cantidad de clientes")

repetidos <- DFHoteles$is_repeated_guest

for (i in length(repetidos)){
  
}

tot <- sum(repetidos)/length(repetidos)


hist(repetidos, 
     main = "Clientes repetidos y no repetidos de ambos hoteles",
     xlab = "No repetidos y repetidos", ylab = "Cantidad clientes",
     col = c("red", "green"))

legend("topright", legend = c("Repetido", "No repetido"),
       fill =  c("green", "red"))

#Canal de reserva:
table(DFHoteles$distribution_channel, DFHoteles$hotel)

barplot(table(DFHoteles$distribution_channel))

a = table(DFHoteles$distribution_channel)

a

b = table(DFHoteles$distribution_channel, DFHoteles$hotel)

City = c(b[1], b[2], b[3], b[4], b[5])

pie(a, main = "Canal de distribución de reserva en ambos hoteles", 
    col = c("yellow", "orange", "red", "purple", "blue"), 
    border = c("yellow", "orange", "red", "purple", "blue"))

legend("topright", legend = c("TA/TO", "GDS", "Direct", "Corporate", "Undefined"),
       fill =  c("purple", "red", "orange", "yellow", "blue"))

etiquetas <- c("Corporate", "Direct", "GDS", "TA/TO", "Undefined")

pie(City, labels = etiquetas,
    main = "Canal de distribución de reserva en el City Hotel", 
    col = c("yellow", "lightblue", "orange", "mistyrose", "red"), 
    border = c("yellow", "lightblue", "orange", "mistyrose", "red"))

legend("topright", legend = c("TA/TO", "GDS", "Direct", "Corporate", "Undefined"),
       fill =  c("mistyrose", "orange", "lightblue", "yellow", "red"))

Resort = c(b[1,2], b[2,2], b[3,2], b[4,2], b[5,2])

pie(Resort, labels = etiquetas,
    main = "Canal de distribución de reserva en el Resort Hotel", 
    col = c("lightgreen", "gold", "black", "indianred1", "brown"), 
    border = c("lightgreen", "gold", "black", "indianred1", "brown"))

legend("topright", legend = c("TA/TO", "GDS", "Direct", "Corporate", "Undefined"),
       fill =  c("indianred1", "gold", "black", "lightgreen", "brown"))
