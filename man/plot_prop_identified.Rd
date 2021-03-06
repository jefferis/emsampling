% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sampling_curves.R
\name{plot_prop_identified}
\alias{plot_prop_identified}
\title{Plot proportion of targets identified versus connections tested}
\usage{
plot_prop_identified(x, conn_threshold = 1, sample = FALSE, ...)
}
\arguments{
\item{x}{A \code{samplingcurve} object}

\item{conn_threshold}{A (vector of) absolute connection thresholds (i.e.
integral number of partners). A threshold of 1 (the default) implies
partners with 1 or more connections (i.e. all partners).}

\item{sample}{Whether to randomise the sampling order}

\item{...}{Arguments passed on to \code{samplingcurve}
\describe{
  \item{partners}{A vector or partner neuron identifiers (typically numeric
such as CATMAID skeleton ids)}
  \item{N}{optional parameters describing the total number of connections and
the total number of partners (if known).}
  \item{m}{optional parameters describing the total number of connections and
the total number of partners (if known).}
}}
}
\description{
Plot proportion of targets identified versus connections tested
}
\examples{
scuniform=samplingcurve(rep(1:20,10))
# no randomisation, which reveals the non-random order of connections in the
# scuinform object
plot_prop_identified(scuniform)
# randomising partner order
plot_prop_identified(scuniform, sample=TRUE)
plot_prop_identified(scuniform, conn_threshold=1:3, sample=TRUE)
}
