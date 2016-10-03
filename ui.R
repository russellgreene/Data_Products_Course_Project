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
       checkboxInput("am", "Transmission Type (am)", TRUE),
       checkboxInput("cyl", "Number of cyclinders (cyl)", FALSE),
       checkboxInput("disp", "Displaycement (disp)", FALSE),
       checkboxInput("hp", "Gross horsepower (hp)", FALSE),
       checkboxInput("drat", "Rear axle ratio (drat)", FALSE),
       checkboxInput("qsec", "1/4 mile time (qsec)", FALSE),
       checkboxInput("vs", "V/S (vs)", FALSE),
       checkboxInput("gear", "Number of forward gears (gear)", FALSE),
       checkboxInput("carb", "Number of carburetors (carb)", FALSE),
       checkboxInput("wt", "Weight in 1000lbs (wt)", FALSE),
       br(),br(),br(),br(),br(),br(),
       h4("Documentation:"),
       h6(paste("Please select at least one regressor.  The server code will ",
                "automatically run and the regression results will be displayed ",
                "on the right panel.  The residual graph is displayed on the top. ",
                "Below that the R squared value is given.  Then the individual ",
                "regression parameters are displayed.  Finally the confidence ", 
                "intervals for the parameters are displayed.", sep =""))
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
