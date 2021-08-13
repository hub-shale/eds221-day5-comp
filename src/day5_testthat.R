# testthat function testing

# install.packages("testthat")
# install.packages("devtools")
# install.packages("remotes")

library(testthat)
library(devtools)
library(remotes)


# create function that takes numeric df, finds col means, max col mean, min col mean, 
# then returns max/min means as a vector

# apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)


#' Range of Means
#'
#' @param df A data frame 
#'
#' @return The maximum and minimum means for columns in df
#' @export
#'
#' @examples
range_means = function(df) {
  col_means = apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)
  df_m_min = min(col_means)
  df_m_max = max(col_means)
  out_means = c(df_m_min, df_m_max)
  return(out_means)
}

# manual test
range_means(mtcars)

# testthat

expect_length(range_means(mtcars), 2)
# no output = pass the test
# expect_length(range_means(mtcars), 3)
# output/error = failed the test

expect_true(range_means(mtcars)[1] < range_means(mtcars)[2])

# this is odd... (parens erroron above check) expect_true(range_means(mtcars[1] < range_means(mtcars)[2]))

expect_type(range_means(mtcars), "double")
# note that class = numeric, but type is more specific (so _type = "numeric" will fail)


