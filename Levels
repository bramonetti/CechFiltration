# Entrada: Lista de simplejos con sus parametros y los parametros en orden creciente.
# Salida: Lista de simplejos con sus niveles.

Levels <- function(Cech.s, param, tree){
     Cech.f <- Cech.s
     
     # cambiamos el parametro del simplejo por el nivel de la filtracion
     for(i1 in 1:length(Cech.s)){
          if(nrow(Cech.s[[i1]])>0){
               scale <- NULL
               for(i2 in 1:nrow(Cech.s[[i1]])){
                    i3 <- 1
                    while(i3<=length(param)){
                         namef <- Cech.s[[i1]][i2, 1]
                         for(n in 2:length(Cech.s[[i1]][i2, ])){
                              namef <- c(paste0(namef,
                                   ``.'',
                                   Cech.s[[i1]][i2, n]))
                         }
                         if(abs(tree[[namef]] - param[i3])<=prec){
                              scale <- c(scale, i3)
                              i3 <- length(param)+1
                         } else {
                              i3 <- i3+1
                         }
                    }
               }
               
               Cech.f[[i1]] <- cbind(rep.int(i1,
                    nrow(Cech.s[[i1]])),
                    Cech.s[[i1]],
                    scale)
          }
     }
     return(Cech.f)
}
