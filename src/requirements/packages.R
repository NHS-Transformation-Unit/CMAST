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
              "lubridate",
              "ggrepel",
              "tibbletime",
              "gridExtra",
              "kableExtra")

lapply(packages, library, character.only=TRUE)
