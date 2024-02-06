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
              "ggrepel")

lapply(packages, library, character.only=TRUE)
