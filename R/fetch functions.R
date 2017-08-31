
collect_data_multi <- function(url_ls = abs_urls) {

  url_ls %>%
    walk(
      ~ download.file(.x$url, glue("{getwd()}/{.x$file_name}.xls"))
    )

  url_ls %>%
    map(
      ~ read_xls(glue("{getwd()}/{.x$file_name}.xls"), sheet = 2)
    )

}

#' @export

collect_data <- function(input) {

  download.file(input$url, glue("{getwd()}/data/{input$file_name}.xls"))

  read_xls(glue("{getwd()}/data/{input$file_name}.xls"), sheet = 2)

}

