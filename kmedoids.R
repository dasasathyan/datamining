library(fpc)
pam.result <- pam(IrisDataset1,3)
table(pam.result$clustering, IrisDataset1$Class)
layout(matrix(c(1,2),1,2)) # 2 graphs per page
plot(pam.result)
layout(matrix(1)) # change back to one graph per page
plot(pam.result)
return()
return()
pam.result2 <- pam(IrisDataset1,4)
table(pam.result2$clustering, IrisDataset1$Class)
plot(pam.result2)
return()
return()