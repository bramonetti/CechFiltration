# Entrada: Dimension maxima, parametro maximo y sistema de discos.
# Salida: Filtracion de Cech del sistema de discos.

Filtration <- function(prec,k,maxscale,info){
     if(k<0 || maxscale<=0 || nrow(info)==0){
          print(``Nada que calcular, modificar informacion.'')
     } else {
          # empieza el archivo .txt
          write(1, file = ``Filtration.txt'', append = FALSE, sep = `` '')
          
          # S0 es la matriz (x,y) ; N el numero de 0-simp
          S0 <- matrix(info[,-3], ncol=2)
          N <- nrow(S0)
          
          # agregar 0-esqueleto al archivo .txt
          esq_0 <- matrix(c(rep.int(0,N), 1:N, rep.int(1,N)), nrow=N)
          write(t(esq_0),
                         file = ``Filtration.txt'',
                         ncolumns = 3,
                         append = TRUE,
                         sep = `` '')
          
          if(k>=1){
               radii <- matrix(info[,3], ncol=1)
               
               # matriz de distancia
               D = dist(S0)
               DistM <- as.matrix(D)
               
               # obtenemos el 1-esqueleto con los parametros
               esq_1 <- OneEsq(DistM, maxscale, prec, radii)
               
               if(!is.null(esq_1[[2]]) && abs(min(esq_1[[2]])-prec)>0){
                    # relacion de simplejos con sus parametros
                    tree <- esq_1[[1]]
                    # lista de simplejos
                    Cech.s <- list(esq_1[[2]])
                    # vector de parametros  
                    param <- c(0,esq_1[[3]])
                    
                    if(k>=2){
                         # complejo para k-simplejos x (k>=2)
                         simplex <- Complex(k, Cech.s,
                              S0, radii,
                              tree, maxscale)
                         tree <- simplex[[1]]
                         Cech.s <- simplex[[2]]
                         param <- c(param, simplex[[3]])
                    }
                    
                    # remover repeticiones y
                    # acomodar los valores de forma creciente
                    param <- sort(unique(param), decreasing = FALSE)
                    aid <- NULL
                    
                    for(i in 1:(length(param)-1)){
                         if(abs(param[i]-param[i+1])<=prec){
                              aid <- c(aid, i+1)
                         }
                    }
                    
                    if(!is.null(aid)) {param <- param[-(aid)]}
                    
                    # lista de simplejos y niveles de la filtracion
                    if(!is.null(Cech.s)){
                         Cech.f <- Levels(Cech.s, param, tree)
                         
                         # agregar i-esqueletos (i=1, ..., k)
                         # al archivo .txt
                         for(i in 1:length(Cech.f)){
                              write(t(Cech.f[[i]]),
                                   file = ``Filtration.txt'',
                                   ncolumns = i+3,
                                   append = TRUE,
                                   sep = `` '')
                         }
                    }
               }
          }
          
          print(``Tu archivo Filtration.txt esta listo.'')
     }
     return(param)
}
