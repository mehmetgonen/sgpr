structured_gpr_test <- function(K_1_test_tra, K_1_test_test, K_2_test_tra, K_2_test_test, state) {
  N_1_tra <- ncol(K_1_test_tra)
  N_1_test <- nrow(K_1_test_tra)
  N_2_tra <- ncol(K_2_test_tra)
  N_2_test <- nrow(K_2_test_tra)

  diag_term <- (matrix(matrix(state$d_1, N_2_tra, N_1_tra, byrow = TRUE), N_1_tra * N_2_tra, 1) * matrix(matrix(state$d_2, N_2_tra, N_1_tra, byrow = FALSE), N_1_tra * N_2_tra, 1) + state$parameters$sigma^2)^-1
  
  Y_mean <- t(matrix(matrix((K_2_test_tra %*% state$U_2) %*% matrix(diag_term * matrix(t(state$U_2) %*% t(state$Y_tra) %*% state$U_1, nrow = N_1_tra * N_2_tra, ncol = 1), nrow = N_2_tra, ncol = N_1_tra) %*% t(K_1_test_tra %*% state$U_1), nrow = N_1_test * N_2_test, ncol = 1), N_2_test, N_1_test))
  
  Y_variance <- matrix(0, nrow = nrow(Y_mean), ncol = ncol(Y_mean))
  for (row in 1:nrow(Y_variance)) {
    for (column in 1:ncol(Y_variance)) {
      temp <- kronecker(K_1_test_tra[row,] %*% state$U_1, K_2_test_tra[column,] %*% state$U_2)
      Y_variance[row, column] <- K_1_test_test[row, row] * K_2_test_test[column, column] - temp %*% (diag_term * t(temp))
    }
  }

  prediction <- list(Y_mean = Y_mean, Y_variance = Y_variance)
}
