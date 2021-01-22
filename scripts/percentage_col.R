#!/usr/bin/env Rscript
rm(list=ls())
library(readr)
options(scipen=200)
f<-read_tsv(file("stdin"), col_names = T);

f$percentage<-c(rep(0.0,times = 30))
for( i in seq(0,27,3)){
    s=f$bases[i+1]+f$bases[i+2]+f$bases[i+3]
    x=round(f$bases[i+1]/s,digits = 2)
    y=round(f$bases[i+2]/s,digits = 2)
    z=round(f$bases[i+3]/s,digits = 2)
    f$percentage[i+1]=x
    f$percentage[i+2]=y
    f$percentage[i+3]=z
}
data<-data.frame(f$Fold,f$chrom,f$percentage)
colnames(data)<-c("Fold","chrom","percentage")
write_tsv(data,file="col.tsv")
