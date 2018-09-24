# Entrada: Un sistema de discos.
# Salida: La escala de \v{C}ech del sistema.

CechScale <- function(M, prec=1e-9){
     lambda.M <- RipsScale(M)   # escala de Rips
     
     # rho = max_{i, j} ( min_k ( r_k - ||d_{ij} - c_k|| ))
     rho.M.star <- Rho(M, lambda.M)
     
     # la escala de Rips es suficiente
     if(rho.M.star >= -prec) {return(lambda.M)}
     
     # la escala de Rips no es suficiente
     # escala de Rips < escala de Cech <= sqrt(4/3) * escala de Rips
     lambda.star <- RhoRoot(M, lambda.M, sqrt(4/3)*lambda.M)
     
     return(lambda.star)
}
