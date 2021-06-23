library(targets)
source("code.R")
tar_option_set(packages = c("tidyverse", "stringr", "sbtools", "whisker"))

list(
  tar_target(
    model_RMSEs_csv,
    download_data(out_filepath = "model_RMSEs.csv"),
    format = "file"
  ), 
  tar_target(
    eval_data,
    process_data(in_filepath = model_RMSEs_csv),
  ),
  tar_target(
    figure_1_png,
    make_plot(out_filepath = "figure_1.png", data = eval_data), 
    format = "file"
  )
)