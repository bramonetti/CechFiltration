# Entrada: Un sistema de discos.
# Salida: La escala de Rips del sistema.

RipsScale <- function(M){
     m <- dim(M)[1]   # renglones de M
     dist.matrix <- dist(M[, 1:2])   # matriz de distancia
     scales <- c()
     count <- 1
     
     # parametros de 1-simplejos
     for(i in 1:(m-1)){
          for(j in (i+1):m){
               scales[count] <- dist.matrix[count]/(M[i, 3] + M[j, 3])
               count <- count + 1
          }
     }
     return(max(scales))
}
