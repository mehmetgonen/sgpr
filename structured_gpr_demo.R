source("structured_gpr_train.R")
source("structured_gpr_test.R")

K_spatial_tra_tra <- ?? #should be the kernel matrix between training instances using spatial covariates
K_spatial_test_tra <- ?? #should be the kernel matrix between test and training instances using spatial covariates
K_spatial_test_test <- ?? #should be the kernel matrix between test instances using spatial covariates

K_temporal_tra_tra <- ?? #should be the kernel matrix between training instances using temporal covariates
K_temporal_test_tra <- ?? #should be the kernel matrix between test and training instances using temporal covariates
K_temporal_test_test <- ?? #should be the kernel matrix between test instances using temporal covariates

Y_tra <- ?? #should be the response matrix for training instances

parameters <- list()
parameters$sigma <- ?? #should be the noise parameter of output values

#perform training
state <- spatiotemporal_gpr_train(K_spatial_tra_tra, K_temporal_tra_tra, Y_tra, parameters)

#perform prediction
prediction <- spatiotemporal_gpr_test(K_spatial_test_tra, K_spatial_test_test, K_temporal_test_tra, K_temporal_test_test, state)

#display the predictions
print(prediction$Y_mean)
