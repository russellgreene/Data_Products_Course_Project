#
# Author: Russell Greene
# Date: October, 2016
# Course: Data Products Coursera
#
# This is the Server code for the Motor Trend Car Road Tests Regression Tool
#

# load require libraries
library(shiny)
data(mtcars)

# Define server logic required to run the regression
shinyServer(function(input, output) {
  
  # A reactive function which assembles the regression formula based on the checkBox inputs
  dataInput <- reactive({
    formula = c()
    if (input$am) {
      formula <- c(formula, "am")
    }
    if (input$cyl) {
      formula <- c(formula, "cyl")  
    }
    if (input$disp) {
      formula <- c(formula, "disp")  
    }
    if (input$hp) {
      formula <- c(formula, "hp")  
    }
    if (input$drat) {
      formula <- c(formula, "drat")  
    }
    if (input$qsec) {
      formula <- c(formula, "qsec")  
    }
    if (input$vs) {
      formula <- c(formula, "vs")  
    }
    if (input$gear) {
      formula <- c(formula, "gear")  
    }
    if (input$carb) {
      formula <- c(formula, "carb")  
    }
    if (input$wt) {
      formula <- c(formula, "wt")  
    }
    
    # function validates the input and displays an error message if no variables are selected
    # This prevents any errors downstream from a malformed regression expression
    validate(
      need(input$am || input$cyl ||  input$disp
           || input$hp || input$drat || input$qsec 
           || input$vs || input$gear || input$carb 
           || input$wt == TRUE, "Need to select at least one variable")
    )
    
    # If the code has made it this far I know that I have at least one term
    # This code builds the regression formula from a string vector of terms
    formulaTerms <- paste(formula, collapse="+")
    finalFormula <- c('mpg ~ ', formulaTerms)
    
    # Runs the actual regression code which is then returned automatically by the function
    fit <- lm(finalFormula, data = mtcars)
  })
  
  # Function to render the residual plot
  output$distPlot <- renderPlot({ 
    plot(mtcars$mpg, resid(dataInput()), ylab="Residuals", 
         xlab="MPG", main="MPG Multi-Factor Residuals")
    abline(0, 0)
  })
  
  # Function to render the R squared results
  output$R2 <- renderText({  
    HTMLout <- HTML(paste0("R", tags$sup(2), " = ", 
                           round(summary(dataInput())$adj.r.squared, digits=2)))
    HTML(paste0(tags$h3((HTMLout))))
  })
  
  # Function to render the text output of the regression coefficients
  output$Summary <- renderPrint({
    coef(summary(dataInput()))
  })
  
  # Function to render the text output of the regressor confidence intervals
  output$ConfInt <- renderPrint({
    round(confint(dataInput()), digits=2)
  })
})

