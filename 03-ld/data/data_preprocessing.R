library(tidyverse)
library(vcfR)

#==================================#
# Create contiguous_snippet.vcf.gz #
#==================================#

# `kgp_2505.txt` contains all 2504 unrelated 1KGP samples,
# plus HG00104, because the 20181203 1KGP VCF doesn't include
# one sample (NA18498) for some reason and I needed it to add up to 2504

# wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000_genomes_project/release/20181203_biallelic_SNV/ALL.chr21.shapeit2_integrated_v1a.GRCh38.20181129.phased.vcf.gz
# bcftools view -O z -o tmp.vcf.gz -r chr21:15000000-20000000 ALL.chr21.shapeit2_integrated_v1a.GRCh38.20181129.phased.vcf.gz
# bcftools view -O z -o contiguous_snippet.vcf.gz -S kgp_2505.txt --force-samples tmp.vcf.gz

# contiguous_snippet.vcf.gz is now in the lab OneDrive

#=================================#
# Create haplotype tables for lab #
#=================================#

# read VCF file
vcf <- read.vcfR(file = "contiguous_snippet.vcf.gz")

# Extract data from the VCF in a "tidy" tabular format
# Set the allele frequency columns to numeric ("n") type
vcf_tidy <- vcfR2tidy(vcf, info_types = c(AF = "n",
                                          EAS_AF = "n",
                                          EUR_AF = "n",
                                          AFR_AF = "n",
                                          AMR_AF = "n",
                                          SAS_AF = "n"))

# `vcf_tidy` is composed of three separate "tibbles" called `$fix`, `$gt`, and `$meta`
# The `$fix` tibble contains allele frequencies in a column labeled "AF"
vcf_info <- vcf_tidy$fix

# subset to common variation using AF column
common_snps <- vcf_info %>%
  filter(AF > 0.05)

# extract genotype info for two common SNPs in LD
common1_pos <- common_snps[32,]$POS # example for class - moderate LD
common2_pos <- common_snps[33,]$POS
# common1_pos <- common_snps[11,]$POS # example for hw - not in LD
# common2_pos <- common_snps[13,]$POS
# common1_pos <- common_snps[829,]$POS # example for hw - perfect LD
# common2_pos <- common_snps[830,]$POS

# reformat common SNP 1 gts so that haplotypes are on separate lines
snp1 <- vcf_tidy$gt %>%
  # subset to genotypes for SNP1
  filter(POS == common1_pos) %>%
  # separate alleles column into hap 1 & 2 (it's phased)
  separate(col = gt_GT_alleles, into = c("hap_1", "hap_2")) %>%
  # make haplotypes into two separate lines
  pivot_longer(cols = starts_with("hap_"), names_to = "haplotype", values_to = "snp1_allele")

# reformat common SNP 2 gts so that haplotypes are on separate lines
snp2 <- vcf_tidy$gt %>%
  # subset to genotypes for SNP 2
  filter(POS == common2_pos) %>%
  # separate alleles column into hap 1 & 2 (it's phased)
  separate(col = gt_GT_alleles, into = c("hap_1", "hap_2")) %>%
  # make haplotypes into two separate lines
  pivot_longer(cols = starts_with("hap_"), names_to = "haplotype", values_to = "snp2_allele")

# then bind the columns together to see the two-locus haplotypes
snp_bind <- bind_cols(snp1, snp2) %>%
  select(`Indiv...3`, `haplotype...5`, snp1_allele, snp2_allele) %>%
  as.data.frame()
colnames(snp_bind) <- c("sample", "haplotype", "snp1_allele", "snp2_allele")

# write to table
write.table(snp_bind, "snp_haplotypes.txt",
            quote = FALSE, sep = "\t", row.names = FALSE)
# write.table(snp_bind, "snp_haplotypes_hw1.txt",
#             quote = FALSE, sep = "\t", row.names = FALSE)
# write.table(snp_bind, "snp_haplotypes_hw2.txt",
#             quote = FALSE, sep = "\t", row.names = FALSE)


#===================================================#
# Code to calculate LD between two SNPs of interest #
#===================================================#

tab <- table(snp_bind$snp1_allele, snp_bind$snp2_allele)
tab

total <- tab[1,1] + tab[1,2] + tab[2,1] + tab[2,2]
h <- tab[1,1] / total
p1 <- (tab[1,1] + tab[1,2])/total
q1 <- (tab[1,1] + tab[2,1])/total

D <- h - p1 * q1
D

Dprime <- D / max(abs(p1 * (1-p1)), abs(q1 * (1-q1)))
Dprime

r2 <- D^2 / (p1 * (1-p1) * q1 * (1-q1))
r2