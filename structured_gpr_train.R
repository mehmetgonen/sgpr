structured_gpr_train <- function(K_1_tra_tra, K_2_tra_tra, Y_tra, parameters) {
  svd_1 <- svd(K_1_tra_tra)
  svd_2 <- svd(K_2_tra_tra)
  
  state <- list(U_1 = svd_1$u, d_1 = svd_1$d, U_2 = svd_2$u, d_2 = svd_2$d, Y_tra = Y_tra, parameters = parameters)
}
