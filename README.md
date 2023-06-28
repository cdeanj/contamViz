# Note: The development of this package is for my own learning and not intended to be taken seriously at this point [never created an R package before], so tread carefully.

# contamViz

<!-- badges: start -->
<!-- badges: end -->

The goal of contamViz is to help visualize the impact of sequence contamination in 16S rRNA marker-gene studies, following the use of decontam [Davis et al., 2018](https://microbiomejournal.biomedcentral.com/articles/10.1186/s40168-018-0605-2).  In many cases, you may want to simply remove the contaminants and move on, but in others, it can be worthwhile to explore sequence contamination in more detail.  This may be especially true if you sequenced multiple batches of samples with numerous types of negative controls in each batch (e.g., extraction controls, library controls or sampling controls).

## Installation

You can install the development version of contamViz from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cdeanj/contamViz")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(contamViz)
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' contam_results <- decontam::isContaminant(physeq, method = 'frequency', conc="quant_reading")
#' plot_score_statistics(contam_results)
```

