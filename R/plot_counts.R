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
#'
#' physeq <- readRDS(system.file("extdata", "MUClite.rds", package="decontam"))
#' plot_counts(physeq, "Seq1", 'Habitat')
plot_counts <- function(physeq, otu, group) {
  physeq.filt <- prune_taxa(otu, physeq)
  physeq.melt <- psmelt(physeq.filt)

  p <- ggplot(physeq.melt, aes(x = !!as.name(group), y = Abundance)) +
    geom_point() +
    theme_bw()

  return(p)
}
