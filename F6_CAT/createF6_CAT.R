## Usage:
# Rscript createF6_CAT.R > createF6_CAT_log.txt 2>&1

library('GenomicRanges')
library('devtools')

info <- read.table('F6_CAT.gene.info.tsv.gz', sep = '\t', header = TRUE,
    quote = '', comment.char = '', na.strings = '__na',
    stringsAsFactors = FALSE)
    
F6CAT <- GRanges(seqnames = info$cntg,
    ranges = IRanges(
        start = info$geneStart,
        end = info$geneEnd,
    )
)
mcols(F6CAT) <- info[, -which(colnames(info) %in% c('cntg', 'geneStart',
    'geneEnd'))]

save(F6CAT, file = 'F6CAT.Rdata')

## Reproducibility information
print('Reproducibility information:')
Sys.time()
proc.time()
options(width = 120)
session_info()