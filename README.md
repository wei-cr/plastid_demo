

## filter match and non-match reference snp

- 拟南芥

```
- Atha_cross
cd /mnt/d/data/plastid/Atha_cross
#match
grep -v "##" Atha_cross.vcf >Atha_cross_1.vcf
grep -v "##" Atha_cross_6%.vcf >ref_col_ref_snp.vcf
perl ../match_ref_snp.pl ref_col_ref_snp.vcf Atha_cross_1.vcf >Atha_cross_match_ref_snp.tsv

#non-match
grep -v "##" only_F2.vcf > Atha_cross_F2.vcf
perl ../non_match_ref_snp.pl ref_col_ref_snp.vcf Atha_cross_F2.vcf > Atha_cross_F2_non-match_ref_snp.tsv

- Atha_1001
cd /mnt/d/data/plastid/Atha_1001
grep -v "##" 
#match
perl ../match_ref_snp.pl ../ref_col_ref_snp.vcf Atha_1001_1.vcf >Atha_1001_match_ref_snp.tsv
#non-match
perl ../non_match_ref_snp.pl ../ref_col_ref_snp.vcf Atha_1001_1.vcf > Atha_1001_non-match_ref_snp.tsv

- Atha_cross_new
cd /mnt/d/data/plastid/Atha_cross_new/Atha_cross
#F2
grep -v "##" F2.vcf > F2_1.vcf
perl ../../match_ref_snp.pl ../../ref_col_ref_snp.vcf F2_1.vcf >F2_match_ref_snp.tsv
perl ../../non_match_ref_snp.pl ../../ref_col_ref_snp.vcf F2_1.vcf >F2_non_match_ref_snp.tsv
#F4
grep -v "##" F4.vcf > F4_1.vcf
perl ../../match_ref_snp.pl ../../ref_col_ref_snp.vcf F4_1.vcf >F4_match_ref_snp.tsv
#P0
grep -v "##" P0.vcf >P0_1.vcf
perl ../../match_ref_snp.pl ../../ref_col_ref_snp.vcf P0_1.vcf > P0_match_ref_snp.tsv
perl ../../non_match_ref_snp.pl ../../ref_col_ref_snp.vcf P0_1.vcf > P0_non_match_ref_snp.tsv
#P1
grep -v "##" P1.vcf > P1_1.vcf
perl ../../match_ref_snp.pl ../../ref_col_ref_snp.vcf P1_1.vcf > P1_match_ref_snp.tsv
cat P1_match_ref_snp.tsv | sed 's/0\.99[0-9]/1/g' | sed 's/0\.99/1/g' > P1_c_match_ref_snp.tsv
perl ../../non_match_ref_snp.pl ../../ref_col_ref_snp.vcf P1_1.vcf > P1_non_match_ref_snp.tsv
#mix
grep -v "##" mix.vcf > mix_1.vcf
perl ../../match_ref_snp.pl ../../ref_col_ref_snp.vcf mix_1.vcf > mix_match_ref_snp.tsv
cat mix_match_ref_snp.tsv | sed 's/0\.99./1/g' >mix_c_match_ref_snp.tsv
perl ../../non_match_ref_snp.pl ../../ref_col_ref_snp.vcf mix_1.vcf > mix_non_match_ref_snp.tsv

- Atha_ma
cd /mnt/d/data/plastid/Atha_ma
grep -v "##" Atha_ma.vcf> Atha_ma_1.vcf
perl ../match_ref_snp.pl ../ref_col_ref_snp.vcf Atha_ma_1.vcf >Atha_ma_match_ref_snp.tsv
perl ../non_match_ref_snp.pl ../ref_col_ref_snp.vcf Atha_ma_1.vcf >Atha_ma_non_match_ref_snp.tsv
#转置
cat Atha_ma_non_match_ref_snp.tsv | datamash transpose > Atha_ma_t_non_match_ref_snp.tsv

```

- 水稻

```
#
bcftools merge --merge all -l <(
        cat P0.tsv |
            cut -f 1 |
            parallel -k -j 1 ' [ -f vcf/{}.vcf.gz ] && echo "vcf/{}.vcf.gz" '
    ) \
    > P0.vcf
grep -v "##"  P0.vcf > P0_1.vcf
cp P0_1.vcf Osat_cross_ref_snp.vcf
perl ../match_ref_snp.pl Osat_cross_ref_snp.vcf P0_1.vcf >P0_Osat_cross_match_ref_snp.tsv
perl ../non_match_ref_snp.pl Osat_cross_ref_snp.vcf P0_1.vcf > P0_Osat_cross_non_match_ref_snp.tsv

bcftools merge --merge all -l <(
        cat P1.tsv |
            cut -f 1 |
            parallel -k -j 1 ' [ -f vcf/{}.vcf.gz ] && echo "vcf/{}.vcf.gz" '
    ) \
    > P1.vcf
grep -v "##" P1.vcf > P1_1.vcf
perl ../match_ref_snp.pl Osat_cross_ref_snp.vcf P1_1.vcf >P1_Osat_cross_match_ref_snp.tsv
perl ../non_match_ref_snp.pl Osat_cross_ref_snp.vcf P1_1.vcf >P1_Osat_cross_non-match_ref_snp.tsv

bcftools merge --merge all -l <(
        cat F1.tsv |
            cut -f 1 |
            parallel -k -j 1 ' [ -f vcf/{}.vcf.gz ] && echo "vcf/{}.vcf.gz" '
    ) \
    > F1.vcf
grep -v "##" F1.vcf > F1_1.vcf
perl ../match_ref_snp.pl Osat_cross_ref_snp.vcf F1_1.vcf >F1_Osat_cross_match_ref_snp.tsv
perl ../non_match_ref_snp.pl Osat_cross_ref_snp.vcf  F1_1.vcf >F1_Osat_cross_non-match_ref_snp.tsv

bcftools merge --merge all -l <(
        cat F2.tsv |
            cut -f 1 |
            parallel -k -j 1 ' [ -f vcf/{}.vcf.gz ] && echo "vcf/{}.vcf.gz" '
    ) \
    > F2.vcf
grep -v "##" F2.vcf > F2_1.vcf
perl ../match_ref_snp.pl Osat_cross_ref_snp.vcf F2_1.vcf >F2_Osat_cross_match_ref_snp.tsv
perl ../non_match_ref_snp.pl Osat_cross_ref_snp.vcf  F2_1.vcf >F2_Osat_cross_non-match_ref_snp.tsv

#3代(Osat_1143)
bcftools view Osat_1143.vcf -s IR5657-33-2,IR64 > IR5657_64.vcf
bcftools view Osat_1143.vcf -s Guangchang13,Aizizhan,Guangchangai >Guangchang13_Ai.vcf
bcftools view Osat_1143.vcf  -s Mianhui501,Peiai64,Peiai64S,Mianhui725 > Mianhui501_peiai64.vcf
bcftools view Osat_1143.vcf  -s IR26-1,IR26-2,Taiyin1hao,Mianhui501 > IR_M.vcf
bcftools view Osat_1143.vcf  -s Ce64,Aihuangmi,Peidi,Peiai64 >Ce_Ai.vcf
bcftools view Osat_1143.vcf  -s Zhaiyeqing8hao,IR24-2,Qingsiai16A >Zhai_IR.vcf
grep -v "##" IR5657_64.vcf > IR5657_64_c.vcf
grep -v "##" Guangchang13_Ai.vcf > Guangchang13_Ai_c.vcf
grep -v "##" Mianhui501_peiai64.vcf > Mianhui501_peiai64_1.vcf
grep -v "##" IR_M.vcf > IR_M_c.vcf
grep -v "##" Ce_Ai.vcf > Ce_Ai_c.vcf
grep -v "##" Zhai_IR.vcf > Zhai_IR_c.vcf
perl ../filter_offspring.pl IR5657_64_c.vcf > IR5657_64_c.tsv
perl ../filter_offspring.pl Guangchang13_Ai_c.vcf > Guangchang13_Ai_c.tsv
perl ../filter_offspring.pl Mianhui501_peiai64_1.vcf > Mianhui501_peiai64_1.tsv
perl ../filter_offspring.pl IR_M_c.vcf > IR_M_c.tsv
perl ../filter_offspring.pl Ce_Ai_c.vcf > Ce_Ai_c.tsv
perl ../filter_offspring.pl Zhai_IR_c.vcf > Zhai_IR_c.tsv


```

## 1001 基因组snp

```
#1001 核基因组snp
cd /mnt/d/data
bsub -q mpi -n 24 -J "1001genomes_snp" "
	cat wile_index.txt |
	parallel --no-run-if-empty --linebuffer  -k -j 4 '
  	bcftools view 1001genomes_snp-short-indel_only_ACGTN.vcf.gz \
  	|grep -v "#" |cut -f {} |cut -d : -f 1 |grep -v "./." |grep -v "0|0" |grep -v "1|1" |wc -l >> sum.tsv' "

#sed '1d' accessions.tsv | cat |
    parallel --colsep '\t' --no-run-if-empty --linebuffer  -k -j 6 '
   bcftools view   1001genomes_snp-short-indel_only_ACGTN.vcf.gz -s   {1} |cut -f 10 \
   cut -d : -f 1 |
   grep "0|1" |wc -l >> snp.tsv \
'
#1001 叶绿体基因组snp
#提取Atha_1001的AF
cd /mnt/d/data/plastid/Atha_1001
perl ../wild.pl Atha_1001_1.vcf >  Atha_1001_AF.tsv 
#统计列数(等列数据）
cd /mnt/d/data/plastid/Atha_1001
cat Atha_1001_AF.tsv | awk  -F"\t" 'END{print NF}'   #703
#统计每个个体的snp位点
for i in {1..703}
do 
	sed '1d' Atha_1001_AF.tsv |cat|cut -f $i |grep  '[[:digit:]]' |wc -l >> 1001_Pt_snp.tsv
done

cat test| awk 'NR==4'或cat test|sed -n '4p' #直接获取某一行的数据
cat  Atha_1001_AF.tsv | sed -n '1p' > 1.tsv
#转置
cat 1.tsv | datamash transpose > 1_1.tsv
paste 1_1.tsv 1001_Pt_snp.tsv >1001_Pt_snp_sum.tsv
sed "1i sample\tsnp\n" 1001_Pt_snp_sum.tsv > 1001_Pt_snp_sum_h.tsv
#snp总数
cat 1001_Pt_snp_sum_h.tsv |cut -f 2 |tsv-summarize -H  --sum snp  ##50655
#统计行数
#sed -n '$=' filename
#awk 'END{print NR}' filename
cat Atha_1001_AF.tsv |wc -l  #4245

#统计同一个SNP位点AF=1的数量
cat Atha_1001_AF.tsv | sed '1d' |
    perl -nla -F'\t' -e '
        my $count =0;
        foreach (@F){
            if ($_==1){
                $count ++;
            }
        }
        print $count;
    '  > fixed1.tsv
grep -v "#" Atha_1001.vcf |cut -f 2,4,5  >pos.tsv
paste pos.tsv fixed1.tsv > pos_fixed_at1.tsv

#拟南芥
#把所有snp的AF值放于一列
perl ../wildallline_hist.pl Atha_1001_1.vcf  >Atha_1001_AF_oneline_hist.tsv
sed "1i AF" Atha_1001_AF_oneline_hist.tsv > Atha_1001_AF_oneline_hist_h.tsv
#绘制直方图
cat Atha_1001_AF_oneline_hist_h.tsv |Rscript -e '
	library(ggplot2);
	f<-read.csv(file("stdin"),header = T);
	fig<-ggplot(f,aes(x=AF))+geom_histogram(stat = "bin", breaks = c(seq(0,1,0.05)),fill="grey50")+
  	scale_x_continuous(breaks = c(seq(0,1,0.2)))+theme_bw()+theme(panel.grid=element_blank())+labs(x="AF")+
  	theme(aspect.ratio=1)
  	ggsave(fig,filename="hist.pdf",width = 4 ,height = 3,useDingbats=FALSE)
'
#查看我们gatk筛选的snp和1001的叶绿体snp是否一致
cd /mnt/d/data/plastid/Atha_1001
perl ../wild_pos.pl Atha_1001_1.vcf >Atha_1001_AF_pos.tsv
sed '1i Name' 1_1.tsv > 1_1_name.tsv
wc -l 1_1_name.tsv #704
cat ena/accessions.tsv |cut -f 1,2 > Ecotype_name.tsv
cat 1_1_name.tsv |tsv-join  -H --filter-file Ecotype_name.tsv   --allow-duplicate-keys --key-fields Name --append-fields 1 >Atha_1001_name.tsv
wc -l Atha_1001_name.tsv #704
sed '1d' Atha_1001_name.tsv | sed "1i CHROM\tCHROM\nPOS\tPOS\nREF\tREF\nALT\tALT" |datamash transpose >1_1_name-c.tsv
cat 1_1_name-c.tsv Atha_1001_AF_pos.tsv > Atha_1001_AF_pos_Ecotype.tsv

#Osat_50（野生）
cd /mnt/d/data/plastid/Osat_50
grep -v "##" Osat_50.vcf > Osat_50_1.vcf
#把所有snp的AF值放于一列
perl ../wildallline_hist.pl Osat_50_1.vcf  >Osat_50.vcf_AF_oneline_hist.tsv
sed "1i AF" Osat_50.vcf_AF_oneline_hist.tsv > Osat_50.vcf_AF_oneline_hist_h.tsv
#绘制直方图
cat  Osat_50.vcf_AF_oneline_hist_h.tsv |Rscript -e '
	library(ggplot2);
	f<-read.csv(file("stdin"),header = T);
	fig<-ggplot(f,aes(x=AF))+geom_histogram(stat = "bin", breaks = c(seq(0,1,0.05)),fill="grey50")+
  	scale_x_continuous(breaks = c(seq(0,1,0.2)))+theme_bw()+theme(panel.grid=element_blank())+labs(x="AF")+
  	theme(aspect.ratio=1)
  	ggsave(fig,filename=" Osat_50_hist.pdf",width = 4 ,height = 3,useDingbats=FALSE)
'
```



## plot

```
Rscript all1.R
```

