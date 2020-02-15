plotMR <- function(output,phenos, vars){
#phenos should be of length K - number of phenotypes
#vars should be of length M - number of variants
par(mfrow = c(2,1))
par(xaxt="n")
lablist<-vars[output$theta0 > 0]

 plot(row(output$theta0)[output$theta0 > 0],output$theta0[output$theta0 > 0], xlab = "Pleiotropic variants\nDiscarded instruments", ylab = "Pleiotropy estimates")
axis(1, at=row(output$theta0)[output$theta0 > 0], labels = FALSE)
text(row(output$theta0)[output$theta0 > 0], par("usr")[3], labels = lablist, srt = 45, pos = 1, xpd = TRUE)
 lablst2 <- phenos
 plot(row(output$thetaL),output$thetaL, xlab = "Phenotype", ylab = "Causal effect estimate log(OR)/SD")
 axis(1, at=row(output$thetaL), labels = FALSE)
text(row(output$thetaL), par("usr")[3], labels = lablst2, srt = 45, pos = 1, xpd = TRUE)

}
