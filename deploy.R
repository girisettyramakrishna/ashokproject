

# Load rsconnect package
library(rsconnect)

# Set your shinyapps.io account info
rsconnect::setAccountInfo(
  name = "psmlabs",
  token = "8FAB74BDBB46C9CA05D75B7102711773",
  secret = "9a6AwJZn3QacJOlVCdzWv6Ptj34mOsuIRE3OuNDI"
)

# Deploy the app
rsconnect::deployApp(
  appDir = ".",           # Current directory where your app is
  appName = "demand_forecasting", # Name for your app on shinyapps.io
  account = "psmlabs"
)


dir.create("rsconnect/shinyapps.io/psmlabs", recursive = TRUE, showWarnings = FALSE)


# Optionally, print a success message
cat("Deployment complete!")
