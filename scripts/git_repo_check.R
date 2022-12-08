#!/usr/bin/env Rscript

# Written by Candace Savonen Sept 2021

if (!("optparse" %in% installed.packages())){
  install.packages("optparse")
}

library(optparse)

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
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)

repo <- opt$repo
git_pat <- opt$git_pat

if (!is.character(repo)) {
  repo <- as.character(repo)
}

check_git_repo <- function(repo, git_pat = NULL, silent = TRUE, return_repo = FALSE) {
  # Given a repository name, check with git ls-remote whether the repository
  # exists and return a TRUE/FALSE

  # Inputs:
  # repo: the name of the repository, e.g. jhudsl/OTTR_Template
  # git_pat: A personal access token from GitHub. Only necessary if the repository being
  #          checked is a private repository.
  # silent: TRUE/FALSE of whether the warning from the git ls-remote command
  #         should be echoed back if it does fail.
  # return_repo: TRUE/FALSE of whether or not the output from git ls-remote
  #              should be saved to a file (if the repo exists)

  # Returns:
  # A TRUE/FALSE whether or not the repository exists.
  # Optionally the output from git ls-remote if return_repo = TRUE.

  message(paste("Checking for remote git repository:", repo))

  # If silent = TRUE don't print out the warning message from the 'try'
  report <- ifelse(silent, suppressWarnings, message)

  if (!is.null(git_pat)) {
    # If git_pat is supplied, use it
    test_repo <- report(
      try(system(paste0("git ls-remote https://", git_pat, "@github.com/", repo),
        intern = TRUE, ignore.stderr = TRUE
      ))
    )
  } else {

    # Try to git ls-remote the repo given
    test_repo <- report(
      try(system(paste0("git ls-remote https://github.com/", repo),
        intern = TRUE, ignore.stderr = TRUE
      ))
    )
  }
  # If 128 is returned as a status attribute it means it failed
  exists <- ifelse(is.null(attr(test_repo, "status")), TRUE, FALSE)

  if (return_repo && exists) {
    # Make file name
    output_file <- paste0("git_ls_remote_", gsub("/", "_", repo))

    # Tell the user the file was saved
    message(paste("Saving output from git ls-remote to file:", output_file))

    # Write to file
    writeLines(exists, file.path(output_file))
  }

  return(exists)
}

# Change repo name to its Leanpub equivalent:
repo <- gsub("_Template", "", repo)
repo <- paste0(repo, "_Quizzes")

# Print out the result
write(check_git_repo(repo, git_pat = git_pat), stdout())
