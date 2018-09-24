# Entrada: El sistema de discos, dimension maxima, parametro maximo, el 1-esqueleto y sus parametros.
# Salida: Simplejos de la filtracion y sus parametros.

Complex <- function(k, Cech.s, S0, radii, tree, maxscale){
     lambda <- NULL
     simplex <- matrix(NA,1,1)
     i <- 1
     while(i<=(k-1) && nrow(simplex)>0){
          simplex <- matrix(NA, 0, i+2)
          for(jr in 1:nrow(Cech.s[[i]])){
               # para cada (i+1)-simplex:
               
               # vecinos menores del simplejo jr
               LN <- InterLN(Cech.s, i, jr)
               if(!is.null(LN)){
                    for(l in 1:length(LN)){
                         # supercara del simplejo jr
                         s <- c(LN[l], Cech.s[[i]][jr,])
                         # parametro del nuevo simplejo
                         p <- Weight(s, S0, radii, tree)   
                         
                         # si parametro <= maxscale
                         # cuenta en la filtracion
                         if((p-maxscale)<=prec){
                              lambda <- c(lambda, p)
                              simplex <- rbind(simplex, s)
                              name <- s[1]
                              for(n in 2:length(s)){
                                   name <- c(paste0(name, ``.'', s[n]))
                              }
                              tree[[name]] <- p
                         }
                    }
               }
          }
          
          # agregar los simplejos a la lista
          if(!is.null(simplex) && nrow(simplex)>0){
               Cech.s[[i+1]] <- matrix(simplex, nrow(simplex))
          }
          i <- i+1
     }
     return(list(tree, Cech.s, lambda))
}
