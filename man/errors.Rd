% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/errors.R
\name{errors}
\alias{errors}
\title{Calculates Jaccard and Euclidean error rates.}
\usage{
errors(x)
}
\arguments{
\item{x}{Consolidated binary matrix.}
}
\value{
JE (Jaccard Error), EE (Euclidean Error), and standard deviations.
}
\description{
Calculates the Jaccard and Euclidean error rates for the dataset. Jaccard's error does not take shared absences of bands as being biologically meaningful. JE = (f10 + f01)/(f10 + f01 + f11) and EE = (f10 + f01)/(f10 + f01 + f11 + f00). At each locus, f01 and f10 indicates a case where a 0 was present in one replicate, and a 1 in the other. f11 indicates the shared presence of a band in both replicates, and f00 indicates a shared absence. For example, if a replicate pair comprises Rep1 = 00101 and Rep2 = 01100, JE = (1+1)/(1+1+1) = 2/3 = 0.67, EE = (1+1)/(1+1+1+2) = 2/5 = 0.4.
}
\examples{
data(BinMatInput_reps)
mat = BinMatInput_reps
cons = consolidate(mat)
errors(cons)

}
