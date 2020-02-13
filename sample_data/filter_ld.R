fullargs <- commandArgs(trailingOnly=FALSE)
args <- commandArgs(trailingOnly=TRUE)

script.name <- normalizePath(sub("--file=", "", fullargs[grep("--file=", fullargs)]))

suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(data.table))

####################################################################
# source(file.path(dirname(script.name), 'misc.R'))
####################################################################


in_file  <- args[1]
out_file <- args[2]
keep_file <- 'data/LD_indep.lst.gz'


keep <- fread(cmd=paste('zcat', keep_file), head=F) %>%
select(V1) %>%
pull()

fread(cmd=paste('zcat', in_file)) %>%
filter(variant %in% keep) %>% 
fwrite(out_file, sep='\t')
