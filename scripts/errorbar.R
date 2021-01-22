#!/usr/bin/env Rscript
rm(list=ls())
library(ggplot2)
library(readr)
options(scipen=200)
f<-read_tsv(file("stdin"), col_names = T);
mean<-aggregate(f$percentage,by=list(f$Fold,f$chrom),FUN=mean)
sd<-aggregate(f$percentage,by=list(f$Fold,f$chrom),FUN=sd)
data<-data.frame(mean,sd=sd$x)
colnames(data)<-c("Fold","chrom","mean_bases","sd")
data$Fold=as.factor(data$Fold)
data$chrom<-factor(data$chrom,levels = c("Nc","Mt","Pt"))

temp<- ggplot(data,aes(x=Fold,y=mean_bases,group=chrom,colour=chrom))+geom_line(size=0.2)+geom_point(pch=19,size=0.2)+
    geom_errorbar(aes(ymin=mean_bases-sd, ymax=mean_bases+sd), width=.8,position=position_dodge(0.05))+theme_bw()+scale_color_manual(values = c("#4D9DE0","#E15554","#3BB273"))+
    theme_bw()+scale_color_manual(values = c("#4D9DE0","#E15554","#3BB273"))+labs(x="Fold",y="Percentage")+theme(axis.title = element_text(size = 12))+theme(aspect.ratio=1)+
			             theme(panel.grid=element_blank())+theme(legend.title=element_blank())+
				     theme(legend.position=c(.12,.4),legend.text=element_text(size=10),legend.key.size = unit(12, "pt"),legend.key.width=unit(0.4,'cm'))+
						           theme(axis.text = element_text(color = "black",size = 11))+
                                                                      theme( axis.ticks = element_line(size = 0.3),axis.ticks.length=unit(.08, "cm"))+theme(panel.border = element_rect(size=0.1))

ggsave(temp,file="col_merge.pdf", width = 4, height = 3,dpi=300)
