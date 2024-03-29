#' @title Calculates Jaccard and Euclidean error rates.
#'
#' @description Calculates the Jaccard and Euclidean error rates for the dataset. Jaccard's error does not take shared absences of bands as being biologically meaningful. JE = (f10 + f01)/(f10 + f01 + f11) and EE = (f10 + f01)/(f10 + f01 + f11 + f00). At each locus, f01 and f10 indicates a case where a 0 was present in one replicate, and a 1 in the other. f11 indicates the shared presence of a band in both replicates, and f00 indicates a shared absence. For example, if a replicate pair comprises Rep1 = 00101 and Rep2 = 01100, JE = (1+1)/(1+1+1) = 2/3 = 0.67, EE = (1+1)/(1+1+1+2) = 2/5 = 0.4.
#'
#' @param x Consolidated binary matrix.
#'
#' @return JE (Jaccard Error), EE (Euclidean Error), and standard deviations.
#'
#' @examples data(BinMatInput_reps)
#' mat = BinMatInput_reps
#' cons = consolidate(mat)
#' errors(cons)
#'
#' @export

errors = function(x){

  mismatch_err = matrix(nrow=nrow(x), ncol = 1)
  jacc_err = matrix(nrow=nrow(x), ncol = 1)


  for(i in 1:nrow(x)) {
    # find the number of 1s, Os and question marks
    ones = length(which(x[i,] == 1))
    zeroes = length(which(x[i,] == 0))
    questions = length(which(x[i,] == "?"))
    sum_bands = ones + questions

    mismatch_err[i,] = (questions/(questions + ones + zeroes))
    jacc_err[i,] = (questions/(questions + ones))

  }

  error_table = data.frame("Errors" = matrix(ncol = 2, nrow = 4))
  error_table[1,1] = "Average Euclidean Error:"
  error_table[1,2] = round(base::mean(mismatch_err[,1]),4)
  error_table[2,1] = "Euclidean error St. dev:"
  error_table[2,2] = round(stats::sd(mismatch_err[,1]),4)
  error_table[3,1] = "Average Jaccard:"
  error_table[3,2] = round(base::mean(jacc_err[,1]),4)
  error_table[4,1] = "Jaccard error St.dev:"
  error_table[4,2] = round(stats::sd(jacc_err[,1]),4)

  colnames(error_table) = c("Metric", "Value")

return(error_table)

}
