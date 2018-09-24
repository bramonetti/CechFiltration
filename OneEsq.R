# Entrada: Matriz de distancias, parametro maximo y radios de los discos del sistema.
# Salida: Los 1-simplejos de la filtracion y sus parametros.

OneEsq <- function(DistM, maxscale, prec, radii){
     tree <- hash()
     simplex <- matrix(NA, 0, 2)
     lambda <- NULL
     
     # consideramos las aristas con parametro <= maxscale
     for(i in 1:(nrow(DistM)-1)){
          for(j in (i+1):ncol(DistM)){
               p <- DistM[i,j]/(radii[i]+radii[j])
               
               if((p-maxscale)<=prec){
                    simplex <- rbind(simplex, c(i,j))
                    lambda <- c(lambda, p)
                    name <- c(paste0(i, ``.'', j))
                    tree[[name]] <- p
               }
          }
     }
     esq_1 <- matrix(simplex, ncol=2)
     return(list(tree, esq_1, lambda))
}
