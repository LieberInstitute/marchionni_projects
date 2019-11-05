# marchionni_projects
[![DOI](https://zenodo.org/badge/82967875.svg)](https://zenodo.org/badge/latestdoi/82967875)

This repository contains the code for the [LIBD](https://www.libd.org/) collaboration with [Luigi Marchionni](http://luigimarchionni.org/)'s group at Johns Hopkins University (JHU) and RIKEN with data from [FANTOM](http://fantom.gsc.riken.jp/) and [recount2](https://doi.org/10.1038/nbt.3838). The results from this project are already been used by [FANTOM6](http://fantom.gsc.riken.jp/6/).


## Contents

In detail, this repository contains the code for running [`recount.bwtool`](https://github.com/LieberInstitute/recount.bwtool) on a set of FANTOM6-derived annotations. In particular, the work by Imada, Sanchez, et al, bioRxiv, 2019 DOI [10.1101/659490](https://doi.org/10.1101/659490) focused on disjoint elements across each strand that you can find at [djnUnstrand](/djnUnstrand). For each of strand (and the combined version) we ran `recount.bwtool` using scripts such as [`djnPos_rse.sh`](https://github.com/LieberInstitute/marchionni_projects/blob/master/djnUnstrand/DjnPos/djnPos_rse.sh). The output was then processed by scripts located in the [eddieimada/fcr2](https://github.com/eddieimada/fcr2) repository.


If you use this data, please cite Imada, Sanchez, et al, bioRxiv, 2019,  DOI [10.1101/659490](https://doi.org/10.1101/659490). Here's a BibTex entry you can use:

```
@article {Imada659490,
	author = {Imada, Eddie-Luidy and Sanchez, Diego Fernando and Collado-Torres, Leonardo and Wilks, Christopher and Matam, Tejasvi and Dinalankara, Wikum and Stupnikov, Aleksey and Lobo-Pereira, Francisco and Yip, Chi-Wai and Yasuzawa, Kayoko and Kondo, Naoto and Itoh, Masayoshi and Suzuki, Harukazu and Kasukawa, Takeya and Hon, Chung-Chau and de Hoon, Michiel JL and Shin, Jay W and Carninci, Piero and , and Jaffe, Andrew E and Leek, Jeffrey T and Favorov, Alexander and Franco, Gloria R and Langmead, Ben and Marchionni, Luigi},
	title = {Recounting the FANTOM Cage Associated Transcriptome},
	elocation-id = {659490},
	year = {2019},
	doi = {10.1101/659490},
	publisher = {Cold Spring Harbor Laboratory},
	URL = {https://www.biorxiv.org/content/early/2019/07/08/659490},
	eprint = {https://www.biorxiv.org/content/early/2019/07/08/659490.full.pdf},
	journal = {bioRxiv}
}
```

## Internal

JHPCE location: `/dcl01/ajaffe/data/lab/marchionni_projects`
