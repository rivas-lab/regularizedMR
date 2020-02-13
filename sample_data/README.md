# sample  data

## MI, HDL, and LDL in UKB example from the Neale lab

We use summary statistics from the Ben Neale lab.
We prepare the LD inpendent set of variants (`LD_indep_list.R`) and subset the summary statistics to those variants. 

LD independent sets are defined in ukbb-tools repo (https://github.com/rivas-lab/ukbb-tools/tree/master/14_LD_map).


```{bash}
bash download.sh

Rscript LD_indep_list.R

Rscript filter_ld.R data/I9_MI.gwas.imputed_v3.both_sexes.tsv.bgz data/MI.tsv
Rscript filter_ld.R data/30760_irnt.gwas.imputed_v3.both_sexes.tsv.bgz data/HDL.tsv
Rscript filter_ld.R data/30780_irnt.gwas.imputed_v3.both_sexes.tsv.bgz data/LDL.tsv
```

