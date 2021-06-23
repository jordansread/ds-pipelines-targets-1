

fetch_data <- function(project_dir = '1_fetch/out'){
  # Get the data from ScienceBase
  mendota_file <- file.path(project_dir, 'model_RMSEs.csv')
  sbtools::item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  return(mendota_file)
}

