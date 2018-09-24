# Entrada: Un vertice u y los 1-simplejos.
# Salida: Vertices vecinos a u con etiquetas menores.

LowerNbrs <- function(S1, u){
     L <- NULL
     j <- 1
     
     while(j<=nrow(S1)){
          if(S1[j,1]<u){
               if(S1[j, 2]==u) {L <- c(L, S1[j, 1])}
               j <- j+1
          } else {
               j <- nrow(S1)+1
          }
     }
     return(L)
}
