
# A new chapter

If you haven't yet read the getting started Wiki pages; [start there](https://www.ottrproject.org/getting_started.html).

To see the rendered version of this chapter and the rest of the template, see here: https://jhudatascience.org/OTTR_Template/.

Every chapter needs to start out with this chunk of code:




## Learning Objectives

Every chapter also needs Learning objectives that will look like this:  

This chapter will cover:  

- {You can use https://tips.uark.edu/using-blooms-taxonomy/ to define some learning objectives here}
- {Another learning objective}

## Libraries

For this chapter, we'll need the following packages attached:

*Remember to add [any additional packages you need to your course's own docker image](https://github.com/jhudsl/OTTR_Template/wiki/Using-Docker#starting-a-new-docker-image).


```r
library(magrittr)
```

## Topic of Section

You can write all your text in sections like this, using `##` to indicate a new header. you can use additional pound symbols to create lower levels of headers.

See [here](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf) for additional general information about how you can format text within R Markdown files. In addition, see [here](https://pandoc.org/MANUAL.html#pandocs-markdown) for more in depth and advanced options.

### Subtopic

Here's a subheading (using three pound symbols) and some text in this subsection!

## Code examples

You can demonstrate code like this:


```r
output_dir <- file.path("resources", "code_output")
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}
```

And make plots too:


```r
hist_plot <- hist(iris$Sepal.Length)
```

![](resources/images/02-chapter_of_course_files/figure-docx/unnamed-chunk-4-1.png)<!-- -->

You can also save these plots to file:


```r
png(file.path(output_dir, "test_plot.png"))
hist_plot
```

```
## $breaks
## [1] 4.0 4.5 5.0 5.5 6.0 6.5 7.0 7.5 8.0
## 
## $counts
## [1]  5 27 27 30 31 18  6  6
## 
## $density
## [1] 0.06666667 0.36000000 0.36000000 0.40000000 0.41333333 0.24000000 0.08000000
## [8] 0.08000000
## 
## $mids
## [1] 4.25 4.75 5.25 5.75 6.25 6.75 7.25 7.75
## 
## $xname
## [1] "iris$Sepal.Length"
## 
## $equidist
## [1] TRUE
## 
## attr(,"class")
## [1] "histogram"
```

```r
dev.off()
```

```
## png 
##   2
```

## Image example

How to include a Google slide. It's simplest to use the `ottrpal` package:


![](resources/images/02-chapter_of_course_files/figure-docx//1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ_gcc4fbee202_0_141.png){width=100%}

But if you have the slide or some other image locally downloaded you can also use HTML like this:

<img src="resources/images/02-chapter_of_course_files/figure-html//1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ_gcc4fbee202_0_141.png" title="Major point!! example image" alt="Major point!! example image" style="display: block; margin: auto;" />

## Video examples
You may also want to embed videos in your course. If alternatively, you just want to include a link you can do so like this:

Check out this [link to a video](https://www.youtube.com/embed/VOCYL-FNbr0) using markdown syntax.

### Using `knitr`

To embed videos in your course, you can use `knitr::include_url()` like this:
Note that you should use `echo=FALSE` in the code chunk because we don't want the code part of this to show up. If you are unfamiliar with [how R Markdown code chunks work, read this](https://rmarkdown.rstudio.com/lesson-3.html).



```
## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

<iframe src="https://www.youtube.com/embed/VOCYL-FNbr0" width="100%" height="400px"></iframe>

### Using HTML

<iframe src="https://www.youtube.com/embed/VOCYL-FNbr0" width="672" height="400px"></iframe>

## File examples

You can again use simple markdown syntax to just include a link to a file like so:

[A file](https://www.bgsu.edu/content/dam/BGSU/center-for-faculty-excellence/docs/TLGuides/TLGuide-Learning-Objectives.pdf).

Alternatively you can embed files like PDFs.

### Using `knitr`

<iframe src="https://drive.google.com/file/d/1mm72K4V7fqpgAfWkr6b7HTZrc3f-T6AV/preview" width="100%" height="400px"></iframe>

### Using HTML

<iframe src="https://drive.google.com/file/d/1mm72K4V7fqpgAfWkr6b7HTZrc3f-T6AV/preview" width="672" height="800px"></iframe>

## Website Examples

Yet again you can use a link to a website like so:

[A Website](https://yihui.org)

You might want to have users open a website in a new tab by default, especially if they need to reference both the course and a resource at once.

[A Website](https://yihui.org){target="_blank"}

Or, you can embed some websites.

### Using `knitr`

This works:

<iframe src="https://yihui.org" width="100%" height="400px"></iframe>


### Using HTML

<iframe src="https://yihui.org" width="672" height="400px"></iframe>


If you'd like the URL to show up in a new tab you can do this:

```
<a href="https://www.linkedin.com" target="_blank">LinkedIn</a>
```

## Citation examples

We can put citations at the end of a sentence like this [@rmarkdown2021].
Or multiple citations [@rmarkdown2021, @Xie2018].

but they need a ; separator [@rmarkdown2021; @Xie2018].

In text, we can put citations like this @rmarkdown2021.

## Stylized boxes

Occasionally, you might find it useful to emphasize a particular piece of information. To help you do so, we have provided css code and images (no need for you to worry about that!) to create the following stylized boxes.

You can use these boxes in your course with either of two options: using HTML code or Pandoc syntax.

### Using `rmarkdown` container syntax

The `rmarkdown` package allows for a different syntax to be converted to the HTML that you just saw and also allows for conversion to LaTeX. See the [Bookdown](https://bookdown.org/yihui/rmarkdown-cookbook/custom-blocks.html) documentation for more information [@Xie2020]. Note that Bookdown uses Pandoc.


```
::: {.notice}
Note using rmarkdown syntax.

:::
```

::: {.notice}
Note using rmarkdown syntax.

:::

As an example you might do something like this:

::: {.notice}
Please click on the subsection headers in the left hand
navigation bar (e.g., 2.1, 4.3) a second time to expand the
table of contents and enable the `scroll_highlight` feature
([see more](introduction.html#scroll-highlight))
:::


### Using HTML

To add a warning box like the following use:

```
<div class = "notice">
Followed by the text you want inside
</div>
```

This will create the following:

<div class = "notice">

Followed by the text you want inside

</div>

Here is a `<div class = "warning">` box:

<div class = "warning">

Note text

</div>

Here is a `<div class = "github">` box:

<div class = "github">

GitHub text

</div>


Here is a `<div class = "dictionary">` box:

<div class = "dictionary">

dictionary text

</div>


Here is a `<div class = "reflection">` box:

<div class = "reflection">

reflection text

</div>



## Dropdown summaries

<details><summary> You can hide additional information in a dropdown menu </summary>
Here's more words that are hidden.
</details>

## Print out session info

You should print out session info when you have code for [reproducibility purposes](https://jhudatascience.org/Reproducibility_in_Cancer_Informatics/managing-package-versions.html).


```r
devtools::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 4.0.2 (2020-06-22)
##  os       Ubuntu 20.04.3 LTS          
##  system   x86_64, linux-gnu           
##  ui       X11                         
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       Etc/UTC                     
##  date     2022-11-15                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version    date       lib source                            
##  assertthat    0.2.1      2019-03-21 [1] RSPM (R 4.0.3)                    
##  bookdown      0.24       2022-02-15 [1] Github (rstudio/bookdown@88bc4ea) 
##  callr         3.4.4      2020-09-07 [1] RSPM (R 4.0.2)                    
##  cli           2.0.2      2020-02-28 [1] RSPM (R 4.0.0)                    
##  crayon        1.3.4      2017-09-16 [1] RSPM (R 4.0.0)                    
##  curl          4.3        2019-12-02 [1] RSPM (R 4.0.3)                    
##  desc          1.2.0      2018-05-01 [1] RSPM (R 4.0.3)                    
##  devtools      2.3.2      2020-09-18 [1] RSPM (R 4.0.3)                    
##  digest        0.6.25     2020-02-23 [1] RSPM (R 4.0.0)                    
##  ellipsis      0.3.1      2020-05-15 [1] RSPM (R 4.0.3)                    
##  evaluate      0.14       2019-05-28 [1] RSPM (R 4.0.3)                    
##  fansi         0.4.1      2020-01-08 [1] RSPM (R 4.0.0)                    
##  fs            1.5.0      2020-07-31 [1] RSPM (R 4.0.3)                    
##  glue          1.6.1      2022-01-22 [1] CRAN (R 4.0.2)                    
##  highr         0.8        2019-03-20 [1] RSPM (R 4.0.3)                    
##  hms           0.5.3      2020-01-08 [1] RSPM (R 4.0.0)                    
##  htmltools     0.5.0      2020-06-16 [1] RSPM (R 4.0.1)                    
##  httr          1.4.2      2020-07-20 [1] RSPM (R 4.0.3)                    
##  knitr         1.33       2022-02-15 [1] Github (yihui/knitr@a1052d1)      
##  lifecycle     1.0.0      2021-02-15 [1] CRAN (R 4.0.2)                    
##  magrittr    * 2.0.2      2022-01-26 [1] CRAN (R 4.0.2)                    
##  memoise       1.1.0      2017-04-21 [1] RSPM (R 4.0.0)                    
##  ottrpal       0.1.2      2022-02-15 [1] Github (jhudsl/ottrpal@1018848)   
##  pillar        1.4.6      2020-07-10 [1] RSPM (R 4.0.2)                    
##  pkgbuild      1.1.0      2020-07-13 [1] RSPM (R 4.0.2)                    
##  pkgconfig     2.0.3      2019-09-22 [1] RSPM (R 4.0.3)                    
##  pkgload       1.1.0      2020-05-29 [1] RSPM (R 4.0.3)                    
##  prettyunits   1.1.1      2020-01-24 [1] RSPM (R 4.0.3)                    
##  processx      3.4.4      2020-09-03 [1] RSPM (R 4.0.2)                    
##  ps            1.3.4      2020-08-11 [1] RSPM (R 4.0.2)                    
##  purrr         0.3.4      2020-04-17 [1] RSPM (R 4.0.3)                    
##  R6            2.4.1      2019-11-12 [1] RSPM (R 4.0.0)                    
##  readr         1.4.0      2020-10-05 [1] RSPM (R 4.0.2)                    
##  remotes       2.2.0      2020-07-21 [1] RSPM (R 4.0.3)                    
##  rlang         0.4.10     2022-02-15 [1] Github (r-lib/rlang@f0c9be5)      
##  rmarkdown     2.10       2022-02-15 [1] Github (rstudio/rmarkdown@02d3c25)
##  rprojroot     2.0.2      2020-11-15 [1] CRAN (R 4.0.2)                    
##  sessioninfo   1.1.1      2018-11-05 [1] RSPM (R 4.0.3)                    
##  stringi       1.5.3      2020-09-09 [1] RSPM (R 4.0.3)                    
##  stringr       1.4.0      2019-02-10 [1] RSPM (R 4.0.3)                    
##  testthat      3.0.1      2022-02-15 [1] Github (R-lib/testthat@e99155a)   
##  tibble        3.0.3      2020-07-10 [1] RSPM (R 4.0.2)                    
##  usethis       2.1.5.9000 2022-02-15 [1] Github (r-lib/usethis@57b109a)    
##  vctrs         0.3.4      2020-08-29 [1] RSPM (R 4.0.2)                    
##  webshot       0.5.2      2019-11-22 [1] RSPM (R 4.0.3)                    
##  withr         2.3.0      2020-09-22 [1] RSPM (R 4.0.2)                    
##  xfun          0.26       2022-02-15 [1] Github (yihui/xfun@74c2a66)       
##  yaml          2.2.1      2020-02-01 [1] RSPM (R 4.0.3)                    
## 
## [1] /usr/local/lib/R/site-library
## [2] /usr/local/lib/R/library
```

[many links]: https://github.com/jhudsl/OTTR_Template
