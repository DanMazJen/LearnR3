#' Import data from the DIME data set
#'
#' @param file_path The path to the .csv file
#'
#' @returns A data frame
#' @examples
#' here::here("data-raw/dime/sleep/101.csv") |>
#'   import_sleep()
import_dime <- function(file_path) {
  csv_file <- file_path |>
    readr::read_csv(
      show_col_types = FALSE,
      name_repair = snakecase::to_snake_case,
      n_max = 100
    )
  return(csv_file)
}

here::here("data-raw/dime/sleep/101.csv") |>
  import_dime()
