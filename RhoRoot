# Entrada: Un sistema de discos y dos parametros a,b (donde rho(a)*rho(b)<0).
# Salida: La raiz de rho.

RhoRoot <- function(M, a, b, prec=1e-9){
     #numero de iteraciones
     num.iter <- ceiling(abs(log(b-a)-log(prec))/log(2))
     
     rho.M.a <- Rho(M, a)   # rho(a)
     rho.M.b <- Rho(M, b)   # rho(b)
     
     n <- 1
     mp <- 0.5*(a + b)   # punto medio
     rho.M.mp <- Rho(M, mp)   # rho(mp)
     
     # hacemos lo mismo, por <= numero de iteraciones
     while(abs(rho.M.mp)>=prec && n<=num.iter){
          mp <- 0.5*(a + b)
          rho.M.mp <- Rho(M, mp)
          
          # cambiamos el intervalo
          if(rho.M.mp * rho.M.b < 0){
               a <- mp
          } else {
               b <- mp
          }
          
          n <- n+1
     }
     return(mp)
}
