
# Load required package
if (!require("rsconnect")) {
  install.packages("rsconnect", repos = "https://cloud.r-project.org/"")
  library(rsconnect)
}

# Disable deployment record writing
Sys.setenv(RSCONNECT_DEPLOYMENT_RECORD_DISABLE = "true")


# Set account info
rsconnect::setAccountInfo(
  name = "psmlabs",
  token = "8FAB74BDBB46C9CA05D75B7102711773",
  secret = "9a6AwJZn3QacJOlVCdzWv6Ptj34mOsuIRE3OuNDI"
)


# Deploy the app
rsconnect::deployApp(
  appDir = ".",         
  appName = "demand_forecasty",   
  appTitle = "DF", 
  account = "psmlabs"
  forceupdate = TRUE
)
