## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,
  comment = "#>", fig.pos = "h",
  warning = FALSE, message = FALSE
)

## -----------------------------------------------------------------------------
library(rjdmarkdown)
library(RJDemetra)
sa_x13 <- x13(ipi_c_eu[, "FR"])
sa_ts <- tramoseats(ipi_c_eu[, "FR"])

## ---- results='asis', fig.cap = "S-I Ratio"-----------------------------------
print_preprocessing(sa_x13, format = "latex")
print_decomposition(sa_x13, format = "latex", caption = NULL)
print_diagnostics(sa_x13, format = "latex")

## ---- results='asis', fig.cap = c("Seasonal adjustment of the French industrial production index", "S-I Ratio")----
library(ggdemetra)
ggplot(data = ipi_c_eu_df, mapping = aes(x = date, y = FR)) +
    geom_line() +
    labs(title = NULL,
         x = NULL, y = NULL) +
    geom_sa(component = "y_f", linetype = 2,
            frequency = 12, method = "tramoseats") + 
    geom_sa(component = "sa", color = "red") +
    geom_sa(component = "sa_f", color = "red", linetype = 2)
print_preprocessing(sa_ts, format = "latex")
print_decomposition(sa_ts, format = "latex", caption = NULL)
print_diagnostics(sa_ts, format = "latex")

## ---- eval = FALSE------------------------------------------------------------
#  header-includes:
#     - \usepackage{booktabs}
#     - \usepackage{float}
#     - \floatplacement{figure}{H}

## ---- include = TRUE, eval = FALSE--------------------------------------------
#  knitr::opts_chunk$set(collapse = TRUE,
#    comment = "#>", fig.pos = "h",
#    warning = FALSE, message = FALSE
#  )

