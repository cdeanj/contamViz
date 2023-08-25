#' Prune contaminants from a phyloseq object
#'
#' @param physeq A phyloseq object
#' @param x A data.frame of classification information output from the isContaminant function in the decontam package.
#'
#' @return A trimmed phyloseq object with contaminants removed
#' @export
#'
#' @examples
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' contam_results <- decontam::isContaminant(physeq, method = 'frequency', conc="quant_reading")
#' physeq.filt <- prune_contaminants(contam_results, physeq)
prune_contaminants <- function(x, physeq) {
  if(nrow(x) == 0) { stop("Data frame is empty") }

  otus <- rownames(x[x$contaminant == FALSE,])

  return(prune_taxa(otus, physeq))
}
