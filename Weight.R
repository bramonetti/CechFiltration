# Entrada: Sistema de discos, lista de parametros y simplejo s.
# Salida: Escala de Cech del simplejo s.

Weight <- function(sigma, S0, radii, tree){
     if(length(sigma)==3){
          B <- S0[sigma,]
          B <- cbind(B, radii[sigma,])
          p <- CechScale(B)
     } else {
          # utilizamos el Teorema de Helly
          A <- combinations(n=length(sigma),
               r=(length(sigma)-1),
               v=sigma,
               repeats=FALSE)
          p <- 0   # parametro de las caras
          for(a in 1:nrow(A)){
               nameA <- A[a,1]
               for(n in 2:ncol(A)){
                    nameA <- c(paste0(nameA, ``.'', A[a,n]))
               }
               p <- max(p,tree[[nameA]])
          }
     }
     return(p)
}
