## This is example of deploying programmatically 



# Refer to: https://docs.rstudio.com/connect/admin/appendix/deployment-guide/ 
# and also: https://rstudiopbc.atlassian.net/wiki/spaces/SUP/pages/36212280/Troubleshooting+deployments+with+rsconnect 
# For useful background on including html files with static publishing see: https://support.rstudio.com/hc/en-us/articles/360001157793-Static-Content-on-RStudio-Connect 

# To programmatically publish content to RStudio Connect, use the functions deployDoc, deployApp, deployAPI, and deploySite from the rsconnect package. Each of these functions will require a user account and a connected server. To setup an account on a server use addConnectServer and connectUser. To view currently configured accounts use accounts. For more details visit the rsconnect reference pages.
# You can also do this through the IDE. This documentation is great: https://docs.rstudio.com/how-to-guides/rsc/publish-rmd/ 


# During app deployment you can see the app bundle number, save this. Alternatively you can access this from Connect under `Information` as the `Content ID`. 
# The app bundle is: 12929 

# This will "auto-detect" if it has been deployed before, meaning that it depends on having the manifest.json file and rsconnect directory with the correct information

#################################### FIRST
library(rsconnect)

rsconnect::writeManifest()

rsconnect::deployApp(
  appDir = getwd(),
  #appFiles = NULL,
  account = "lisa.anders",
  server = "colorado.rstudio.com"
)

#################################### SECOND
# This will attempt to deploy to the defined appId. If the content types don't match (for example, overwriting a shiny app with a static rmarkdown), then it will throw an error. User will be prompted for whether or not they want to overwrite the existing content in the Console window. 

library(rsconnect)

rsconnect::writeManifest()

rsconnect::deployApp(
  appDir = getwd(),
  appId = "12929",
  #account = "lisa.anders",
  server = "colorado.rstudio.com",
  forceUpdate = TRUE
)


#################################### THIRD
# We can also run this without needing user inputs by forcing the content to be overwritten without prompting with forceUpdate = TRUE and by authenticating to the server using an API rather than through the GUI. 

# addServer("https://colorado.rstudio.com/rsc/__api__", "myserver")
addConnectServer("https://colorado.rstudio.com/rsc/", "myserver")

# Connecting account via API key
rsconnect::connectApiUser(
  account = "lisa.anders",
  server = "myserver",
  apiKey = Sys.getenv("CONNECT_API_KEY"),
  forceUpdate = TRUE
)

message("Please wait, publishing")

rsconnect::deployApp(
  appDir = getwd(),
  appId = "12929",
  forceUpdate = TRUE
)

#################################### FOURTH
# Instead of publishing we can trigger re-renders and other programmatic options with the [connectapi package](https://github.com/rstudio/connectapi)

library(connectapi)
client <- connectapi::connect(
  host = 'https://colorado.rstudio.com/rsc/',
  api_key = Sys.getenv("CONNECT_API_KEY")
)

# Refer to: https://rstudio.github.io/connectwidgets/




