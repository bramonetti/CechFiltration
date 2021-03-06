# Entrada: Cantidad de discos a crear (r) y la dimension (n).
# Salida: Sistema de r discos en Rn.

CellsGenerator} <- function(r, n){
     # points collection
     M <- matrix(0, nrow=r, ncol=n+1)
     
     # intersection point
     c <- runif(n, 0.5, 0.5)
     
     for(i in 1:r){
          # disc radius that will contain ``c''
          M[i,n+1] <- ratio <- runif(1, 0, 1)
          M[i,1:n] <- as.vector(c + sphereUnif(n=1, d=n-1, r=0.5))
     }
     return(M)
}
