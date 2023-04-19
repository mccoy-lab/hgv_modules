library(tidyverse)
library(data.table)
library(rtracklayer)

#===============#
# Load datasets #
#===============#

# gene annotations from gencode
gencode <- data.table(readGFF("ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_27/gencode.v27.annotation.gtf.gz"))
genes <- gencode[type == "gene"][, c("seqid", "start", "end", "gene_id", "gene_name", "gene_type")] %>%
  # subset to protein-coding, non-mitochondrial genes
  .[gene_type == "protein_coding"] %>%
  .[seqid != "chrM"]

# gtex data - pre-subset by Rajiv to highly expressed genes and only some samples
gtex <- fread("gtex.txt.gz") %>%
  # subset to just protein-coding, non-chrM genes (to reduce data size)
  .[Name %in% genes$gene_id] %>%
  # change to long format
  pivot_longer(cols = starts_with("GTEX"),
               names_to = "Sample",
               values_to = "Counts") %>%
  as.data.table()

# metadata - sample ID and corresponding tissue type
sample_annotations <- fread("https://storage.googleapis.com/gtex_analysis_v8/annotations/GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt")

# metadata - individuals, ID, sex, age range, cause of death (hardy scale)
subject_phenotypes <- read_tsv("https://storage.googleapis.com/gtex_analysis_v8/annotations/GTEx_Analysis_v8_Annotations_SubjectPhenotypesDS.txt") %>%
  as.data.table() %>%
  # make sex into more readable format
  .[SEX == 1, Sex := "M"] %>%
  .[SEX == 2, Sex := "F"] %>%
  .[, -c("SEX")]


#=========================#
# Merge with tissue info  #
#=========================#

# merge tissue annotation into gtex table
gtex_tissue <- merge(gtex, sample_annotations[, c("SAMPID", "SMTSD")],
                     by.x = "Sample", by.y = "SAMPID")

# remove tissue ID from sample name and create a new sample name column
gtex_split <- gtex_tissue %>%
  .[, c("id1", "id2") := tstrsplit(Sample, "-", fixed = TRUE, keep = c(1,2))] %>%
  # sample name column that matches how phenotypes file is formatted
  .[, id := paste(id1, id2, sep = "-")] %>%
  .[, c("id", "SMTSD", "Name", "Description", "Counts")] %>%
  setnames(c("Sample", "Tissue", "Gene_ID", "Gene_Name", "Counts"))

# merge with phenotypes file
gtex_pheno <- merge(gtex_split, subject_phenotypes,
                by.x = "Sample", by.y = "SUBJID") %>%
  setnames(c("AGE", "DTHHRDY"), c("Age", "Death_Hardy")) %>%
  .[, c("Sample", "Age", "Sex", "Death_Hardy", "Tissue", "Gene_ID", "Gene_Name", "Counts")]

# subset to samples and tissues of interest
ids <- sample(unique(gtex_pheno$Sample), 200, replace = FALSE)
gtex_pheno <- gtex_pheno[Sample %in% ids] %>%
  .[Tissue == "Lung" | Tissue == "Liver"]

# write to new file
fwrite(gtex_pheno, "gtex_subset.txt", sep = "\t")
# bgzip to reduce size