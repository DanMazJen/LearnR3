#' Import data from the DIME data set
#'
#' @param file_path The path to the .csv file
#'
#' @returns A data frame
#' @examples
#' here::here("data-raw/dime/sleep/101.csv") |>
#'   import_sleep()
import_dime <- function(file_path) {
  if (grepl("\\.csv$", tolower(file_path))) {
    csv_file <- file_path |>
      readr::read_csv(
        show_col_types = FALSE,
        name_repair = snakecase::to_snake_case,
        n_max = 100
      )
    return(csv_file)
  } else {
    stop("File is not a CSV file.")
  }
}


#' Title
#'
#' @param file_path The path to the data folder
#'
#' @returns One tibble with the data and path as ID
#'
#' @examples
#' import_csv_files("data-raw/dime/sleep/")
#'
import_csv_files <- function(file_path) {
  files <- here::here(file_path) |>
    fs::dir_ls(glob = "*.csv")

  data <- files |>
    purrr::map(import_dime) |>
    purrr::list_rbind(names_to = "file_path_id")

  return(data)
}
