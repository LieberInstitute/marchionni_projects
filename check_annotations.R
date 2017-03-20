##

library(GenomicRanges)
library(rtracklayer)
library(jaffelab)

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

##############
# check GTF ##
##############

## read in hg38 lifted GTF from FANTOM
gtf = import("Annotation/F6_CAT.transcript.gtf.gz")

## read in Gencode v25
gen = import("/dcl01/lieber/ajaffe/Emily/RNAseq-pipeline/Annotation/GENCODE/GRCh38_hg38/gencode.v25.annotationGRCh38.gtf")
gen$ensemblID = ss(gen$gene_id, "\\.")
genExon = gen[gen$type == "exon"]
sum(width(unique(genExon)) > 100000)
#### cleaning gtf ####
gtfUnique = unique(gtf)
oo = findOverlaps(gtfUnique, gtf,type="equal")
gtfUnique$transcript_id = CharacterList(
	split(gtf$transcript_id[subjectHits(oo)],queryHits(oo)))

## check overlaps to gencode directly
oo2 = findOverlaps(gtfUnique, gen, type="equal")

gtfAlone = gtfUnique[-queryHits(oo2)]
oo3 = findOverlaps(gtfAlone, gen)