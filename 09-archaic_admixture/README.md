# Module Setup

## Data

Download from this Github directory:

* `promoters_hg19.bed`

Most of the data for this module is downloaded live with `admixr`'s `download_data` function. A backup copy is on [Google Drive](https://drive.google.com/file/d/1FL7qRcdlKn1CaLpp2ukIMAQfNqzgYdZO/view?usp=share_link).

## Software

Install these software packages:

* [`AdmixTools`](https://github.com/DReichLab/AdmixTools)
* R packages (install within R)
	* `tidyverse`
	* `admixr`

### Debugging notes

In order to run the `admixr` functions within R, I had to:

* Add path to the AdmixTools `bin` directory to my `~/.bash_profile`:
```
export PATH="/Users/syan/Documents/mccoy-lab/code/AdmixTools/bin:$PATH"
```

* Add `$PATH` to my `.Renviron` file, in accordance with [this Github issue](https://blick-roman.com/?_=%2Fbodkan%2Fadmixr%2Fissues%2F89%23TKIyQE7bxQ7cKfkQ9Ck6FWcn):
```
echo "PATH=$PATH" >> .Renviron
```