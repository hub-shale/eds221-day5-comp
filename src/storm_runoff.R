# Task 1 

library(tidyverse)
library(here)

source(here("src", "storm_runoff.R"))

#' Runoff Prediction Function
#'
#' @param imp_frac fraction of watershed impervious to infiltration
#' @param wshed_area total watershed area (acres)
#'
#' @return expected runoff volume
#' @export
#'
#' @examples
predict_runoff = function(imp_frac, wshed_area) {
  rv_coeff = .05 + .9 * imp_frac
  run_vol = 3630 * 1 * rv_coeff * wshed_area
  return(run_vol)
}
