plotMR <- function(output,phenos, vars){
#phenos should be of length K - number of phenotypes
#vars should be of length M - number of variants
par(mfrow = c(2,1))
par(xaxt="n")
lablist<-vars[xts$theta0 > 0]

 plot(row(xts$theta0)[xts$theta0 > 0],xts$theta0[xts$theta0 > 0], xlab = "Pleiotropic variants\nDiscarded instruments", ylab = "Pleiotropy estimates")
axis(1, at=row(xts$theta0)[xts$theta0 > 0], labels = FALSE)
text(row(xts$theta0)[xts$theta0 > 0], par("usr")[3] - 0.2, labels = lablist, srt = 45, pos = 1, xpd = TRUE)
 lablst <- phenos
 plot(row(xts$thetaL),xts$thetaL, xlab = "Phenotype", ylab = "Causal effect estimate log(OR)/SD")
 axis(1, at=row(xts$thetaL), labels = FALSE)
text(row(xts$thetaL), par("usr")[3] - 0.2, labels = lablist, srt = 45, pos = 1, xpd = TRUE)

}
