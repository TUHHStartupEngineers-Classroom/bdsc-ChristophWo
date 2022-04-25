roll_prob <- function(x = 1:6,size = 1){
  probabilities_vector <- c(1/10, 1/10, 1/10, 1/10, 1/10, 1/2)
sample(x, size, replace = FALSE, prob = probabilities_vector)
}
