packages <- c("here",
              "tidyverse",
              "openxlsx",
              "leaflet",
              "sf",
              "shiny",
              "plotly",
              "markdown",
              "knitr",
              "scales",
              "viridis",
              "lubridate")

lapply(packages, library, character.only=TRUE)
