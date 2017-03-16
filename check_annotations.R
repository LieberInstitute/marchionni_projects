##

library(GenomicRanges)
library(rtracklayer)

## read in gene info
info = read.delim("Annotation/F6_CAT.gene.info.tsv.gz",as.is=TRUE)
gr = makeGRangesFromDataFrame(info, 
	seqnames.field = "cntg", start.field = "geneStart",
	end.field = "geneEnd", strand.field = "strnd", keep = TRUE)
gr$annotation = "ENS"
gr$annotation[grep("^CAT", gr$geneID)] = "CAT"
names(gr) = gr$geneID

## read in bed that was quantified
bed = import("Annotation/F6_CAT.gene.bed.gz")
names(bed) = bed$name
bed = bed[info$geneID]
identical(ranges(gr), ranges(bed)) # same

## clean up promoters and transcripts
gr$prmtrID = CharacterList(strsplit(gr$prmtrID, ";"))
gr$trnscptID = CharacterList(strsplit(gr$trnscptID, ";"))

## check metrics
round(tapply(width(gr)/1e6, gr$annotation, sum)) # in Mb

oo = order(width(gr), decreasing=TRUE)[1:10]
sum(width(gr[oo]))/1e6 # 150Mb...