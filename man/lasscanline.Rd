% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lasindentify.r
\name{lasscanline}
\alias{lasscanline}
\title{Retrieve individual scanline}
\usage{
lasscanline(.las)
}
\arguments{
\item{.las}{A LAS object}
}
\value{
Return nothing. The original object is modified in place by reference.
}
\description{
Retrieve each individual scanline by attributing to each point a number. When
data are sampled according to a saw-tooth pattern (oscillating mirror) a scanline
is one line, or row of data. The function relies on the GPS field time to
order the data. Then, the 'ScanDirectionFlag' field (when available) is used to
retrieve each scanline  A column '\code{scanline}' is added in the slot \code{@data}
}
