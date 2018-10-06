
library(package = "shiny")
library(package = "shinythemes")
library(package = "dplyr")
library(package = "rdrop2")

# Accessing Dropbox On Shiny And Remote Servers
token <- readRDS("droptoken.rds")
drop_acc(dtoken = token)
