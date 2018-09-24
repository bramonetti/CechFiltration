# Entrada: Archivos 'output\_*.txt' (salida de PERSEUS).
# Salida: Archivo .png con el codigo de barras.

Persistence <- function(param){
     # archivos .txt por leer
     filelist = list.files(pattern = ``output_'')
     filelist <- filelist[-length(filelist)]
     
     # lista con la info de los archivos .txt
     A <- list()
     for(i in 1:length(filelist)){
          info <- file.info(filelist[i])
          if(info[1]!=0){
               A[[i]] <- read.table(filelist[i])
               A[[i]] <- cbind(rep.int(i-1, nrow(A[[i]])), A[[i]])
               A[[i]] <- matrix(data=as.matrix(A[[i]]), ncol=3)
          }
     }
     
     # cambiamos el parametro por el nivel
     D <- NULL
     for(i in 1:length(A)){
          B <- A[[i]]
          if(!is.null(B)){
               for(j in 1:nrow(B)){
                    if(B[j, 2]==-1){
                         B[j,2] <- param[length(param)] +(maxscale/3)
                    } else {
                         B[j,2] <- param[B[j,2]]
                    }
                    
                    if(B[j, 3]==-1){
                         B[j, 3] <- param[length(param)] +(maxscale/3)
                    } else {
                         B[j, 3] <- param[B[j, 3]]
                    }
               }
          }
          
          D <- rbind(D, B)
     }
     
     # guardar la filtracion en un codigo de barras
     png(file = ``BarcodeFiltration.png'')
     plot.diagram(D, barcode=TRUE)
     dev.off()
     
     print(``Tu archivo BarcodeFiltration.png esta listo.'')
}
