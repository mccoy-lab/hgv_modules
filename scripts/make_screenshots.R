#!/usr/bin/env Rscript
# Written by Candace Savonen Jan 2022

if (!('devtools' %in% installed.packages())) {
  # install.packages("remotes", repos = "http://cran.us.r-project.org")
}

if (!('optparse' %in% installed.packages())) {
  # install.packages("optparse", repos = "http://cran.us.r-project.org")
}

webshot::install_phantomjs()

library(optparse)
library(magrittr)

option_list <- list(
  optparse::make_option(
    c("--repo"),
    type = "character",
    default = NULL,
    help = "GitHub repository name, e.g. jhudsl/OTTR_Template",
  ),
  optparse::make_option(
    c("--git_pat"),
    type = "character",
    default = NULL,
    help = "GitHub personal access token",
  ),
  optparse::make_option(
    c("--output_dir"),
    type = "character",
    default = "resources/chapt_screen_images",
    help = "Output directory where the chapter's screen images should be stored",
  ),
  optparse::make_option(
    c("--base_url"),
    type = "character",
    default = NULL,
    help = "Output directory where the chapter's screen images should be stored",
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)

output_folder <- file.path(opt$output_dir)
if (!dir.exists(output_folder)) {
  dir.create(output_folder, recursive = TRUE)
}

if (is.null(opt$base_url)) {
  base_url <- cow::get_pages_url(repo_name = opt$repo, git_pat = opt$git_pat)
  base_url <- gsub("/$", "", base_url)
}

chapt_df <- ottrpal::get_chapters(base_url = file.path(base_url, "no_toc/"))

file_names <- lapply(chapt_df$url, function(url) {
  file_name <- gsub(".html", ".png", file.path(output_folder, basename(url)))
  # Get rid of special characters
  webshot::webshot(url, file_name)
  file_name <- gsub(":|?|!|\\'", "", file_name)
  message(paste("Screenshot saved:", file_name))
  return(file_name)
})

# Save file of chapter urls and file_names
chapt_df %>%
  dplyr::mutate(img_path = unlist(file_names)) %>%
  readr::write_tsv(file.path(output_folder, "chapter_urls.tsv"))

message(paste("Image Chapter key written to: ", file.path(output_folder, "chapter_urls.tsv")))
