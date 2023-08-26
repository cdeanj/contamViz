#' Plots counts of sequence feature
#'
#' @param physeq A phyloseq object
#' @param otu Name of the otu/asv to be visualized
#' @param group Grouping variable to stratify results by
#'
#' @return An object of type ggplot2
#' @export
#'
#' @examples
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' plot_counts(physeq, otu = "Seq1", group = 'Habitat')
plot_counts <- function(physeq, otu, group) {
  if(!otu %in% colnames(otu_table(physeq)) & !otu %in% rownames(otu_table(physeq))) {
    stop('OTU is not present in phyloseq object')
  }

  physeq.filt <- prune_taxa(otu, physeq)
  physeq.melt <- psmelt(physeq.filt)

  p <- ggplot(physeq.melt, aes(x = !!as.name(group), y = Abundance)) +
    geom_point() +
    theme_bw()

  return(p)
}
