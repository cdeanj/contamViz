% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pull_contaminants.R
\name{pull_contaminants}
\alias{pull_contaminants}
\title{Pulls contaminants from a phyloseq object}
\usage{
pull_contaminants(x, physeq)
}
\arguments{
\item{x}{A data.frame of classification information output from the isContaminant function in the decontam package.}

\item{physeq}{A phyloseq object}
}
\value{
A trimmed phyloseq object of contaminants
}
\description{
Pulls contaminants from a phyloseq object.
}
\examples{
physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
contam_results <- decontam::isContaminant(physeq, method = 'frequency', conc="quant_reading")
physeq.contam <- pull_contaminants(contam_results, physeq)
}
