# Entrada: Sistema de discos, dimension maxima y parametro maximo.
# Salida: Archivo .txt con los niveles de la filtracion.

### CREAR R PUNTOS EN S^n ###
info <- CellsGenerator(50, 2)
write.csv(info, file = ``points.csv'')

### O LEER ARCHIVO .csv CON CENTROS Y RADIOS (x,y,r) ###
info <- scan(``points.csv'', sep=``,'')
info <- matrix(info, ncol=3, byrow=TRUE)
prec <- 1e-9 # precision in calculos
k <- 3 # dimension mayor a calcular (0-N)
maxscale <- 0.6 # parametro maximo
param <- Filtration(prec,k,maxscale,info)
