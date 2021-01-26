# 

## filter match and non-match reference snp

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
#match
perl ../match_ref_snp.pl ../Atha_cross/ref_col_ref_snp.vcf 1001_1.vcf >1001_match_ref_snp.tsv
#non-match
perl non_match_ref_snp.pl ../Atha_cross/ref_col_ref_snp.vcf 1001_1.vcf > 1001_1_non-match_ref_snp.tsv

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

## plot

```
Rscript all1.R
```

