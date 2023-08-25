#' Pulls contaminants from a phyloseq object
#'
#' @description
#' Pulls contaminants from a phyloseq object.
#'
#' @param x A data.frame of classification information output from the isContaminant function in the decontam package.
#' @param physeq A phyloseq object
#'
#' @return A trimmed phyloseq object of contaminants
#' @export
#'
#' @examples
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' contam_results <- decontam::isContaminant(physeq, method = 'frequency', conc="quant_reading")
#' physeq.contam <- pull_contaminants(contam_results, physeq)
pull_contaminants <- function(x, physeq) {
  if(nrow(x) == 0) { stop("Data frame is empty") }

  otus <- rownames(x[x$contaminant == TRUE,])

  return(prune_taxa(otus, physeq))
}
