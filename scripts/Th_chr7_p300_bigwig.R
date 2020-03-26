library(rtracklayer)
library(TxDb.Mmusculus.UCSC.mm9.knownGene)

# Th17 data
gr_Th17 <- import("GSM1480824_p300WTh17.bw")
a<-gr_Th17[seqnames(gr_Th17) == "chr7"]
export(a, con = 'Th17_chr7.bw', format = 'bigWig')

#bigwig file containing only chr7 from from bedgraph Th2 
gr_Th2<- import.bedGraph("GSM994516_p300WTTh2NRS.bedgraph.gz")
gr_Th2.chr7<-gr_Th2[seqnames(gr_Th2) == "chr7"]
txdb <- TxDb.Mmusculus.UCSC.mm9.knownGene
seqinfo(gr_Th2.chr7) <- seqinfo(txdb)[seqnames(seqinfo(gr_Th2.chr7))]
export(gr_Th2.chr7, con = 'Th2_chr7.bw', format = 'bigWig')
