# Entrada: Un sistema de discos y un parametro.
# Salida: El valor de rho(M_lambda).

Rho <- function(M, lambda, prec=1e-9){
     m <- dim(M)[1]   # renglones de M
     c <- M[, 1:2]; r <- M[, 3]   # centros y radios
     rho.output <- -Inf   # empezamos con el menor
     
     for(i in 1:(m-1)){
          for(j in (i+1):m){
               # puntos de interseccion de D_i y D_j
               d.M  <- InterPoints(c(c[i, ],
                    lambda*r[i]), c(c[j, ], lambda*r[j]))
               d.ij <- d.M[[1]]
               if(length(d.M)==2) {d.ji <- d.M[[2]]}
               
               # valores que puede tomar k
               k.values <- (1:m)[-c(i, j)]
               k.index <- 1
               
               # variable para controlar el maximo
               rho.ij.is.higher <- TRUE
               
               # valores de rho para i y j
               rho.ijk <- rep(0, m-2)
               
               while(rho.ij.is.higher && k.index != m-1){
                    k <- k.values[k.index]
                    k.center <- c[k, ]
                    
                    # rho con d.ij
                    rho.ijk[k.index] <- lambda*r[k] -
                         sqrt(sum( (d.ij -
                         c[k, ])^2 ))
                    
                    # si rho.ijk < rho, no sera el maximo
                    if(rho.ijk[k.index] < rho.output){
                         rho.ij.is.higher <- FALSE
                    }
                    k.index <- k.index + 1
               }
               
               # si rho.ijk puede ser rho, tomamos el minimo
               if(rho.ij.is.higher) { rho.output <- min(rho.ijk) }
               
               # si d.ji existe, hacemos lo mismo
               if(length(d.M)==2){
                    k.index <- 1
                    rho.ji.is.higher <- TRUE
                    rho.jik <- rep(0, m-2)
                    
                    while(rho.ji.is.higher && k.index != m-1){
                         k <- k.values[k.index]
                         k.center <- c[3, ]
                         rho.jik[k.index] <- lambda*r[k] -
                              sqrt(sum((d.ji - c[k, ])^2))
                         
                         if(rho.jik[k.index] < rho.output){
                              rho.ji.is.higher <- FALSE
                         }
                         
                         k.index <- k.index + 1
                    }
                    
                    if(rho.ji.is.higher) { rho.output <- min(rho.jik) }
               }
          }
     }
     return(rho.output)
}
