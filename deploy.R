## This is example of deploying programmatically 



# Refer to: https://docs.rstudio.com/connect/admin/appendix/deployment-guide/ 
# and also: https://rstudiopbc.atlassian.net/wiki/spaces/SUP/pages/36212280/Troubleshooting+deployments+with+rsconnect 
# For useful background on including html files with static publishing see: https://support.rstudio.com/hc/en-us/articles/360001157793-Static-Content-on-RStudio-Connect 

# To programmatically publish content to RStudio Connect, use the functions deployDoc, deployApp, deployAPI, and deploySite from the rsconnect package. Each of these functions will require a user account and a connected server. To setup an account on a server use addConnectServer and connectUser. To view currently configured accounts use accounts. For more details visit the rsconnect reference pages.
# You can also do this through the IDE. This documentation is great: https://docs.rstudio.com/how-to-guides/rsc/publish-rmd/ 


# During app deployment you can see the app bundle number, save this. Alternatively you can access this from Connect under `Information` as the `Content ID`. 
# The app bundle is: 12929 


# This will attempt to deploy to the defined appId. If the content types don't match (for example, overwriting a shiny app with a static rmarkdown), then it will throw an error. User will be prompted for whether or not they want to overwrite the existing content in the Console window. 

library(rsconnect)

rsconnect::writeManifest()

rsconnect::deployApp(
  appDir = getwd(),
  appId = "12929",
  server = "colorado.rstudio.com",
  forceUpdate = TRUE
)


