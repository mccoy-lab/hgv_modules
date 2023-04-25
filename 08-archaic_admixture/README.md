### Files to download to Posit Cloud:

* The data for this module is downloaded live in class with `admixr`'s `download_data` function. A backup version of the data is on the project [OneDrive](https://livejohnshopkins.sharepoint.com/:f:/s/mccoy_lab/EnYTot749PJMlHm1_WS6OSQB07oaFleCCvzzwCHzW4d2Iw?e=cqgX2B).


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