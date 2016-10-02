#
# Author: Russell Greene
# Date: October, 2016
# Course: Data Products Coursera
#
# This is the UI code for the Motor Trend Car Road Tests Regression Tool
#

library(shiny)

# # Define UI for application that does regression analysis
shinyUI(fluidPage(

  # Application title
  titlePanel("Motor Trend Car Road Tests Regression Tool"),

  # Sidebar with a checkbox input for specific regressors
  sidebarLayout(
    sidebarPanel(
       "Please pick regressor(s): ",
       checkboxInput("am", "am", TRUE),
       checkboxInput("cyl", "cyl", FALSE),
       checkboxInput("disp", "disp", FALSE),
       checkboxInput("hp", "hp", FALSE),
       checkboxInput("drat", "drat", FALSE),
       checkboxInput("qsec", "qsec", FALSE),
       checkboxInput("vs", "vs", FALSE),
       checkboxInput("gear", "gear", FALSE),
       checkboxInput("carb", "carb", FALSE),
       checkboxInput("wt", "wt", FALSE)
    ),

    # Main panel shows the results of the (multi-variable) regression
    mainPanel(
      h2("Regression Results"),
      plotOutput("distPlot"),
      htmlOutput("R2"),
      h2("Regressor Parameters Values"),
      verbatimTextOutput("Summary"),
      h2("Regressor Confidence Intervals"),
      verbatimTextOutput("ConfInt")
    )
  )
))
