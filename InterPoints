# Entrada: Dos discos del sistema.
# Salida: Punto(s) de interseccion de los dos discos.

Dist <- function(P, Q){ dist(rbind(P,Q))[1] }

InterPoints <- function(D.i, D.j){
     # centros y radios de los discos D.i y D.j
     c.i <- D.i[1:2]; r.i <- D.i[3]
     c.j <- D.j[1:2]; r.j <- D.j[3]
     
     c.ij <- c.j - c.i
     dist.ij <- Dist(c.i, c.j)
     
     # sin interseccion
     if(dist.ij >= r.i+r.j+prec){
          stop(``Los discos tienen interseccion vacia.'')
     }
     
     # radios demasiado cercanos, seran iguales
     if(abs(r.i-r.j) <= prec) { r.j <- r.i }
     
     # discos concentricos
     if(dist.ij <= prec){
          d.ij <- c.i
          return(list(d.ij))
     }
     
     # solo un punto, de manera externa
     if(abs(dist.ij - (r.i+r.j)) < prec){
          d.ij <- (r.j*c.i + r.i*c.j)/(r.i+r.j)
          return(list(d.ij))
     }
     
     # contencion completa pero no concentricos
     if(all(dist.ij > prec, dist.ij <= abs(r.i-r.j)+prec)){
          r.ij <- abs(r.i-r.j)
          if(r.j > r.i){
               c.i <- c.j; r.i <- r.j; c.ij <- -c.ij
          }
          d.ij <- c.i + r.i*c.ij/r.ij
          return(list(d.ij))
     }
     
     # dos puntos de interseccion
     n.ij <- c(-c.ij[2], c.ij[1])
     
     # calculamos los coeficientes a y b tales que
     # d.ij = c.i + a * c.ij + b * n.ij and
     # d.ji = c.i + a * c.ij - b * n.ij
     a <- 0.5*(1 + (r.i-r.j)*(r.i+r.j)/dist.ij^2)
     b <- sqrt(r.i^2 - (a*dist.ij)^2)/dist.ij
     d.ij <- c.i + a * c.ij + b * n.ij
     d.ji <- c.i + a * c.ij - b * n.ij
     
     return(list(d.ij, d.ji))
}
