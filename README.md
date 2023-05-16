# Human Genome Variation Lab

[![Render Bookdown and Coursera](https://github.com/mccoy-lab/hgv_modules/actions/workflows/render-all.yml/badge.svg)](https://github.com/mccoy-lab/hgv_modules/actions/workflows/render-all.yml)

This course explores public datasets and computational tools used 
to analyze human genomic data, to better understand how patterns in these data can be 
used to test hypotheses about evolution and human phenotypes. In the course, students will:

- Explore the ways in which human genomic data is generated, encoded, summarized, and visualized.
- Develop an awareness of potential confounding factors in genomic data analysis and approaches by which they can be overcome.
- Establish familiarity working with summarized forms of genomic data in R.

These modules (and the accompanying [digital textbook](https://mccoy-lab.github.io/hgv_modules/index.html)) can be used as course materials or as resources for independent learning.

***

# Using the HGV Lab Materials

## As an Instructor

We run our course through [Posit Cloud](https://posit.cloud/) and recommend this approach if possible (although you have to pay for _____).

#### Creating the course workspace

For each semester of the course, create a new **workspace** on Posit Cloud. You can send students a contributor link to invite them to join as workspace members.

#### Uploading a module

1. Create a new **RStudio project**.
2. Within this Github repo, click on the directory for the module you want to upload.
3. Follow the instructions in the module README to upload the necessary data into your RStudio project.
4. Install any software or R packages specified in the module README.
5. Upload the **starter code (`XX-<module_name>_starter.Rmd`)** to the project.
	* The `XX-<module_name>.Rmd` file is for website rendering only.
6. Finally, use the `Access` tab (available by clicking the gear icon in the upper right) to make the project an **assignment**.

During class, students can click on the assignment to derive their own projects to code in, which will contain the same software, data, etc. as your original copy.

We recommend running through the code before teaching, and adjusting the RStudio project parameters if necessary (ex: allocating more memory or CPU if it's having trouble reading in large data files).

## For Independent Learning

If you want to learn this material independently, you can read through the [digital textbook](https://mccoy-lab.github.io/hgv_modules/index.html) and use the starter code for each module to follow along with coding sections.

You will need to download **RStudio**. For each module:

1. Create a module-specific directory.
2. Within this Github repo, click on the module you want to start.
3. Follow the instructions in the module README to upload the data and **starter code (`<module_name>_starter.Rmd`)** to your directory.
	* The `XX-<module_name>.Rmd` file is for website rendering only.
4. Install any software or R packages specified in the module README. (Some of these, like `tidyverse`, are used in multiple modules but only need to be installed once.)

Then you're all set to start!

***

# Other Resources

Raw data (+ pre-processing scripts), figure design files, and a second copy of the data for each module are available in [this Google Drive folder](https://drive.google.com/drive/u/0/folders/1vsK1meEmo8g2ElyjMi4l3EvFCnjjtueR).

***

# Questions?

If you have questions or encounter problems with the course materials, submit a GitHub issue or contact us at rajiv.mccoy[at]jhu.edu.

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />All materials in this course are licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a> unless noted otherwise.
