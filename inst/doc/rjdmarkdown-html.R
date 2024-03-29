## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", out.width = "100%",
  fig.dim = c(8, 5), dpi = 300,
  warning = FALSE, message = FALSE
)

## -----------------------------------------------------------------------------
library(rjdmarkdown)
library(RJDemetra)
sa_x13 <- x13(ipi_c_eu[, "FR"])
sa_ts <- tramoseats(ipi_c_eu[, "FR"])

## ---- results='asis', fig.cap = "S-I Ratio"-----------------------------------
print_preprocessing(sa_x13)
print_decomposition(sa_x13, caption = NULL)
print_diagnostics(sa_x13)

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
print_preprocessing(sa_ts)
print_decomposition(sa_ts, caption = NULL)
print_diagnostics(sa_ts)

## ----eval=FALSE---------------------------------------------------------------
#  preprocessing_customized <- function(x){
#    library(ggdemetra)
#    y <- get_ts(x)
#    data_plot <- data.frame(date = time(y), y = y)
#    p <- ggplot(data = data_plot, mapping = aes(x = date, y = y)) +
#      geom_line() +
#      labs(title = NULL,
#           x = NULL, y = NULL) +
#      geom_sa(component = "y_f", linetype = 2,
#              frequency = 12, method = "tramoseats") +
#      geom_sa(component = "sa", color = "red") +
#      geom_sa(component = "sa_f", color = "red", linetype = 2)
#    plot(p)
#    cat("\n\n")
#    print_preprocessing(sa_ts)
#  }
#  decomposition_customized <- function(x){
#    print_decomposition(x, caption = NULL)
#  }
#  
#  output_file <- tempfile(fileext = ".Rmd")
#  
#  create_rmd(sa_ts, output_file, output_format = "html_document",
#             preprocessing_fun = preprocessing_customized,
#             decomposition_fun = decomposition_customized,
#             knitr_chunk_opts = list(
#               fig.pos = "h", results = "asis",
#               fig.cap =c("Seasonal adjustment of the French industrial production index",
#                          "S-I Ratio"),
#               warning = FALSE, message = FALSE, echo = FALSE)
#  )
#  # To open the file:
#  browseURL(sub(".Rmd",".html", output_file, fixed= TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  wk <- new_workspace()
#  new_multiprocessing(wk, "sa1")
#  add_sa_item(wk, "sa1", sa_x13, "X13")
#  add_sa_item(wk, "sa1", sa_ts, "TramoSeats")
#  # It's important to compute the workspace to be able to import the models
#  compute(wk)
#  
#  output_file <- tempfile(fileext = ".Rmd")
#  create_rmd(wk, output_file, output_format = "html_document",
#             output_options = list(toc = TRUE,
#                                   number_sections = TRUE))
#  # To open the file:
#  browseURL(sub(".Rmd",".html", output_file, fixed= TRUE))

## ---- include = TRUE, eval = FALSE--------------------------------------------
#  knitr::opts_chunk$set(
#    collapse = TRUE,
#    comment = "#>", out.width = "100%",
#    fig.dim = c(7, 5),
#    warning = FALSE, message = FALSE
#  )

