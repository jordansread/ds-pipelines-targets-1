library(targets)
source("1_fetch/src/fetch_utils.R")
source("2_process/src/munge_utils.R")
source("3_visualize/src/plot_utils.R")

tar_option_set(packages = c("stringr", "sbtools", "dplyr"))

list(
  tar_target(
    model_RMSEs_csv,
    fetch_data(project_dir = '1_fetch/out'),
    format = "file"
  ), 
  tar_target(
    eval_data,
    munge_datafile(file_in = model_RMSEs_csv),
  ),
  tar_target(
    figure_1_png,
    plot_results(fileout = "3_visualize/out/figure_1.png", eval_data = eval_data), 
    format = "file"
  )
)