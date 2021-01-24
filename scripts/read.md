#
## filter match  and non-match reference snp
```
- Atha_cross
cd /mnt/d/data/plastid/Atha_cross
#match
grep -v "##" Atha_cross.vcf >Atha_cross_1.vcf
grep -v "##" Atha_cross_6%.vcf >ref_col_ref_snp.vcf
perl ../match_ref_snp.pl ref_col_ref_snp.vcf Atha_cross_1.vcf >Atha_cross_mt_ref_snp.tsv

#non-match
grep -v "##" only_F2.vcf > Atha_cross_F2.vcf

- Atha_1001
cd /mnt/d/data/plastid/Atha_1001
#match
perl ../match_ref_snp.pl ../Atha_cross/ref_col_ref_snp.vcf 1001_1.vcf >1001_mt_ref_snp.tsv
#non-match

```
