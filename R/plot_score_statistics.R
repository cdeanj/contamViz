plot_score_statistics <- function(x) {
  if(nrow(x) == 0) { stop("Data frame is empty") }
  hist(x$p)
}
