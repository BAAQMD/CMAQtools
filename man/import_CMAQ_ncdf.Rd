% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_CMAQ_ncdf.R
\name{import_CMAQ_ncdf}
\alias{import_CMAQ_ncdf}
\title{import_CMAQ_ncdf}
\usage{
import_CMAQ_ncdf(
  path,
  variables = NULL,
  cell_midpoints = TRUE,
  point = FALSE,
  nudge_x = -0.5,
  nudge_y = -0.5,
  units = FALSE,
  ...
)
}
\arguments{
\item{path}{(character) single NetCDF file}

\item{variables}{(character) like `c("PM25_TOT", "PM25_PRI", "PM25_SEC")`}

\item{cell_midpoints}{(logical) passed to [stars::st_set_dimensions()]}

\item{point}{(logical) passed to [stars::st_set_dimensions()]}

\item{nudge_x}{(numeric) final adjustment to coordinates}

\item{nudge_y}{(numeric) final adjustment to coordinates}
}
\description{
Import a NetCDF file containing CMAQ model output.
}
\details{
The result is a [stars::stars] object, with coordinates indexed by `CMAQ_col` and `CMAQ_row`.

The assumed projection is Lambert Conformal Conic (LCC), with parameters partially determined
by the globals contained in the NetCDF file.
}
\note{
The coordinates of the `stars` raster are "nudged" by half a unit (e.g., kilometer) in both the x and y dimensions.
}
