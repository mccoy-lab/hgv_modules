### Files to download to Posit Cloud:

* From Github or [this OneDrive folder](https://livejohnshopkins.sharepoint.com/:f:/s/mccoy_lab/EkwJFRhy1DZNt8Dg42caT6wBXzvq9p7DTskMmwk-nbaOow?e=3OpzbZ):
	* `promoters_hg19.bed`

* Most of the data for this module is downloaded live in class with `admixr`'s `download_data` function. A backup version of the data is on [OneDrive](https://livejohnshopkins.sharepoint.com/:f:/s/mccoy_lab/EkwJFRhy1DZNt8Dg42caT6wBXzvq9p7DTskMmwk-nbaOow?e=3OpzbZ).


### Software to install to Posit Cloud:

* [`AdmixTools`](https://github.com/DReichLab/AdmixTools)
* R packages
	* `admixr`


### Debugging notes

In order to run the `admixr` functions, I had to:

* Add path to the AdmixTools `bin` directory to my `~/.bash_profile`:
```
export PATH="/Users/syan/Documents/mccoy-lab/code/AdmixTools/bin:$PATH"
```

* Add `$PATH` to my `.Renviron` file, in accordance with [this Github issue](https://blick-roman.com/?_=%2Fbodkan%2Fadmixr%2Fissues%2F89%23TKIyQE7bxQ7cKfkQ9Ck6FWcn):
```
echo "PATH=$PATH" >> .Renviron
```