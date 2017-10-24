library('GenomicRanges')
load('disjoinedByunstrand.rda')

table(strand(djnUnstrandGR))
#      +      -      *
# 585052 535392 344986
tapply(width(djnUnstrandGR), strand(djnUnstrandGR), sum) / 1e6
#         +         -         *
# 279.72935 256.28421  78.32475

DjnPos <- djnUnstrandGR[strand(djnUnstrandGR) == '-']
DjnNeg <- djnUnstrandGR[strand(djnUnstrandGR) == '+']
DjnBoth <- djnUnstrandGR[strand(djnUnstrandGR) == '*']

dir.create('DjnPos')
dir.create('DjnNeg')
dir.create('DjnBoth')

save(DjnPos, file = 'DjnPos/DjnPos.Rdata')
save(DjnNeg, file = 'DjnNeg/DjnNeg.Rdata')
save(DjnBoth, file = 'DjnBoth/DjnBoth.Rdata')

sapply(c('Pos', 'Neg', 'Both'), function(x) {
    shell <- paste0('#!/bin/bash
#$ -cwd
#$ -N Djn', x, '
#$ -o ./djn', x, '_rse_log.txt
#$ -e ./djn', x, '_rse_log.txt
#$ -m e

## Usage:
# qsub djn', x, '_rse.sh 

bash /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/run_rse.sh -r "/dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/Djn', x, '/Djn', x, '.Rdata" -s "sumsDjn', x, '" -c 1
')
    cat(shell, file = paste0('Djn', x, '/djn', x, '_rse.sh'))
})

sessionInfo()

# R version 3.4.1 (2017-06-30)
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: macOS Sierra 10.12.6
#
# Matrix products: default
# BLAS: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRblas.0.dylib
# LAPACK: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRlapack.dylib
#
# locale:
# [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
#
# attached base packages:
# [1] parallel  stats4    stats     graphics  grDevices utils     datasets  methods   base
#
# other attached packages:
# [1] GenomicRanges_1.29.15 GenomeInfoDb_1.13.5   IRanges_2.11.19       S4Vectors_0.15.12     BiocGenerics_0.23.3
#
# loaded via a namespace (and not attached):
# [1] zlibbioc_1.23.0         compiler_3.4.1          XVector_0.17.1          GenomeInfoDbData_0.99.1 RCurl_1.95-4.8          bitops_1.0-6
