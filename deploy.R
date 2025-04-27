
# Load required package
if (!require("rsconnect")) {
  install.packages("rsconnect")
  library(rsconnect)
}

# Set account info
rsconnect::setAccountInfo(
  name = "psmlabs",
  token = "8FAB74BDBB46C9CA05D75B7102711773",
  secret = "9a6AwJZn3QacJOlVCdzWv6Ptj34mOsuIRE3OuNDI"
)

# Create necessary directory if it doesn't exist
deploy_dir <- file.path("rsconnect", "shinyapps.io", "demand_forecasty")
if (!dir.exists(deploy_dir)) {
  dir.create(deploy_dir, recursive = TRUE)
}

# Deploy the app
rsconnect::deployApp(
  appDir = ".",         
  appName = "demand_forecasty",   
  appTitle = "DF", 
  account = "psmlabs"
)
