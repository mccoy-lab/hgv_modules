#!/usr/bin/env Rscript

# This script switches the repo entry for the yaml file to whatever is specified
# Written by Candace Savonen Jan 2022

if (!("optparse" %in% installed.packages())){
  install.packages("optparse")
}

library(optparse)

option_list <- list(
  optparse::make_option(
    c("--repo"),
    type = "character",
    default = "jhudsl/OTTR_Template_Test",
    help = "GitHub repository name, e.g. jhudsl/OTTR_Template_Test",
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Get test sync yaml path
sync_file_path <- file.path(root_dir, ".github", "test-sync.yml")

yaml_contents <- yaml::yaml.load_file(sync_file_path)

# Only keep first grouping
yaml_contents$group <- yaml_contents$group[[1]]

# Switch out repo
yaml_contents$group$repos <- opt$repo

yaml::write_yaml(yaml_contents, sync_file_path)
