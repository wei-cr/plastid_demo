#!/usr/bin/env Rscript
rm(list=ls())
library(ggplot2)
library(readr)
library(grid)
library(gridExtra)

f1<-read.csv(file("SRR616966_folds.tsv"), header = T,sep = "\t");
f2<-read.csv(file("SRR611086_folds.tsv"), header = T,sep = "\t");
f3<-read.csv(file("SRR5216995_folds.tsv"), header = T,sep = "\t");
f4<-read.csv(file("SRR616965_folds.tsv"), header = T,sep = "\t");
f5<-read.csv(file("SRR611087_folds.tsv"), header = T,sep = "\t");
f6<-read.csv(file("SRR545231_folds.tsv"), header = T,sep = "\t");
f7<-read.csv(file("SRR063638_folds.tsv"), header = T,sep = "\t");
f8<-read.csv(file("SRR1542423_folds.tsv"), header = T,sep = "\t");
f9<-read.csv(file("SRR1572628_folds.tsv"), header = T,sep = "\t");
f<-list(f1,f2,f3,f4,f5,f6,f7,f8,f9)
L1<-list("a","b","c","d","e","f","g","h","i")
L2<-list("a","b","c","d","e","f","g","h","i")
L3<-list("a","b","c","d","e","f","g","h","i")
L4<-list("a","b","c","d","e","f","g","h","i")

for ( n in c(1:9) ){
    f[[n]]$Fold<-as.factor(f[[n]]$Fold)
    f[[n]]$chrom<-factor(f[[n]]$chrom,levels = c("Nc","Mt","Pt"))

    f[[n]]$percentage<-c(rep(0.0,times = 30))
    for( i in seq(0,27,3)){
        s=f[[n]]$bases[i+1]+f[[n]]$bases[i+2]+f[[n]]$bases[i+3]
        x=round(f[[n]]$bases[i+1]/s,digits = 2)
        y=round(f[[n]]$bases[i+2]/s,digits = 2)
        z=round(f[[n]]$bases[i+3]/s,digits = 2)
        f[[n]]$percentage[i+1]=x
        f[[n]]$percentage[i+2]=y
        f[[n]]$percentage[i+3]=z
    }
    L1[[n]]<- ggplot(f[[n]],aes(x=Fold,y=percentage,group=chrom,colour=chrom)) + geom_line(size=0.6,lty=1) + geom_point(size=1.2)+theme_bw()+
                scale_color_manual(values = c("#4D9DE0","#E15554","#3BB273"))+
                            labs(x="Fold",y="Percentage")+theme(axis.title = element_text(size = 10))+theme(aspect.ratio=1)+
                                        theme(panel.grid=element_blank())+theme(legend.title=element_blank())+
                                        theme(legend.position = "none")+
                                                            theme(axis.text = element_text(color = "black",size = 11))+
                                                            theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))+
                                                                        theme( axis.ticks = element_line(size = 0.3),axis.ticks.length=unit(.08, "cm"))+theme(panel.border = element_rect(size=0.1))


    f[[n]]$bases_0<-c(rep(0.0,times = 30))
    for( i in seq(0,27,3)){
        x=round(f[[n]]$bases[i+1]/f[[n]]$bases[1],digits = 3)
        y=round(f[[n]]$bases[i+2]/f[[n]]$bases[2],digits = 3)
        z=round(f[[n]]$bases[i+3]/f[[n]]$bases[3],digits = 3)
        f[[n]]$bases_0[i+1]=x
        f[[n]]$bases_0[i+2]=y
        f[[n]]$bases_0[i+3]=z
    }
    L2[[n]]<- ggplot(f[[n]],aes(x=Fold,y=bases_0,group=chrom,colour=chrom)) + geom_line(size=0.6,lty=1) + geom_point(size=1.2)+theme_bw()+
                scale_color_manual(values = c("#4D9DE0","#E15554","#3BB273"))+
                            labs(x="Fold",y="bases_0")+theme(axis.title = element_text(size = 10))+theme(aspect.ratio=1)+
                                        theme(panel.grid=element_blank())+theme(legend.title=element_blank())+
                                        theme(legend.position = "none")+
                                                            theme(axis.text = element_text(color = "black",size = 11))+
                                                            theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))+
                                                                        theme( axis.ticks = element_line(size = 0.3),axis.ticks.length=unit(.08, "cm"))+theme(panel.border = element_rect(size=0.1))




    L3[[n]]<- ggplot(f[[n]],aes(x=Fold,y=mean,group=chrom,colour=chrom)) + geom_line(size=0.6,lty=1) + geom_point(size=1.2)+theme_bw()+
                    scale_color_manual(values = c("#4D9DE0","#E15554","#3BB273"))+
                    labs(x="Fold",y="covdepth")+
                    theme(axis.title = element_text(size = 10))+
                    theme(aspect.ratio=1)+
                    theme(panel.grid=element_blank())+
                    theme(legend.position = "none")+
                    theme(axis.text = element_text(color = "black",size = 11))+
                    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))+
                    scale_y_log10()+
                    theme( axis.ticks = element_line(size = 0.3),axis.ticks.length=unit(.08, "cm"))+theme(panel.border = element_rect(size=0.1))                                                                    

    L4[[n]]<- ggplot(f[[n]],aes(x=Fold,y=covRate,group=chrom,colour=chrom)) + geom_line(size=0.6,lty=1) + geom_point(size=1.2)+theme_bw()+
                scale_color_manual(values = c("#4D9DE0","#E15554","#3BB273"))+
                labs(x="Fold",y="covRate")+
                theme(axis.title = element_text(size = 10))+
                theme(aspect.ratio=1)+
                theme(panel.grid=element_blank())+
                theme(legend.position = "none")+
                theme(axis.text = element_text(color = "black",size = 11))+
                theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))+
                theme( axis.ticks = element_line(size = 0.3),axis.ticks.length=unit(.08, "cm"))+theme(panel.border = element_rect(size=0.1))+ylim(0,1)
}

pdf(width = 9 ,height = 18,useDingbats=FALSE)
grid.arrange(L1[[1]],L2[[1]],L3[[1]],L4[[1]],
    L1[[2]],L2[[2]],L3[[2]],L4[[2]],
    L1[[3]],L2[[3]],L3[[3]],L4[[3]],
    L1[[4]],L2[[4]],L3[[4]],L4[[4]],
    L1[[5]],L2[[5]],L3[[5]],L4[[5]],
    L1[[6]],L2[[6]],L3[[6]],L4[[6]],
    L1[[7]],L2[[7]],L3[[7]],L4[[7]],
    L1[[8]],L2[[8]],L3[[8]],L4[[8]],
    L1[[9]],L2[[9]],L3[[9]],L4[[9]],   
    ncol=4,nrow=9)
dev.off()


