# Entrada: Un simplejo s y los simplejos de la misma dimension.
# Salida: Vertices vecinos a todos los vertices de s con etiquetas menores.

InterLN <- function(Cech.s, i, jr){
     # vecinos menores del primer vertice
     LN <- LowerNbrs(Cech.s[[1]], Cech.s[[i]][jr, 1])
     
     # de esos vecinos, tambien deben ser para los todos los vertices
     if(!is.null(LN)){
          jc <- 2
          while(jc<=ncol(Cech.s[[i]])){
               LN.i <- LowerNbrs(Cech.s[[1]], Cech.s[[i]][jr, jc])
               if(is.null(LN.i)){
                    return(LN <- NULL)
               } else {
                    aid <- NULL
                    for(u in 1:length(LN)){
                         ver <- FALSE
                         v <- 1
                         while(v<=length(LN.i) && ver==FALSE){
                              if(LN[u]==LN.i[v]){
                                   ver <- TRUE
                                   aid <- c(aid,u)
                              }
                              v <- v+1
                         }
                    }
                    if(!is.null(aid)){
                         LN <- LN[(aid)]
                    } else {
                         LN <- NULL
                         return(LN)
                    }
               }
               jc <- jc+1
          }
     }
     return(LN)
}
