% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tree_hulls.r
\name{tree_hulls}
\alias{tree_hulls}
\title{Compute the hull of each tree.}
\usage{
tree_hulls(las, type = c("convex", "concave", "bbox"), concavity = 3,
  length_threshold = 0, field = "treeID")
}
\arguments{
\item{las}{An object of class \code{LAS}.}

\item{type}{character. Hull type. Can be 'convex', 'concave' or 'bbox'.}

\item{concavity}{numeric. If \code{type = "concave"}, a relative measure of concavity. 1 results
in a relatively detailed shape, Infinity results in a convex hull.}

\item{length_threshold}{numeric. If \code{type = "concave"}, when a segment length is below this
threshold, no further detail is added. Higher values result in simpler shapes.}

\item{field}{character. The field where the ID of each tree is stored. In lidR, default is
"treeID".}
}
\value{
A \code{SpatialPolygonsDataFrame}. If a tree has less than 4 points it is not considered.
}
\description{
Compute the hull of each segmented tree. The hull can be convex, concave or a bounding box (see
details and references).
}
\details{
The concave hull method under the hood is described in Park & Oh (2012). The function relies on
the \link[concaveman:concaveman]{concaveman} function which itself is a wrapper around
\href{https://github.com/mapbox/concaveman}{Vladimir Agafonking's implementation}.
}
\examples{
LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las = readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")

lastrees_li2(las, speed_up = 7)

convex_hulls = tree_hulls(las)
sp::plot(convex_hulls)

bbox_hulls = tree_hulls(las, "bbox")
sp::plot(bbox_hulls)

\dontrun{
concave_hulls = tree_hulls(las, "concave")
sp::plot(concave_hulls)
}
}
\references{
Park, J. S., & Oh, S. J. (2012). A new concave hull algorithm and concaveness measure
for n-dimensional datasets. Journal of Information science and engineering, 28(3), 587-600.
}
