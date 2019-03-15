library(shiny)
library(ggplot2)


dataSet= read.csv("/Users/astuart/Coding/R/Shiny/shinyapp/count_bases_alignment.csv", header=TRUE)


# Define UI for miles per gallon application
ui<-pageWithSidebar(
  
  # Application title
  headerPanel("Count for Each Nucleotide Base or '-' at each column location in the Multiple Sequence Alignment "),
  
  sidebarPanel(
  	selectInput("v", "Variable:", list("A"="A", "T"="T", "C"="C","G"="G","dash"="D"))
  	#checkboxInput("outliers", "Show outliers", FALSE)
  ),
  mainPanel(
    
   
    htmlOutput("caption"),
    plotOutput("machineCount")
    
  )
)



# Define server logic required to plot various variables against mpg
server<-function(input, output) {
  d<-dataSet
  
  # Compute the forumla text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("Base ~", input$v)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
 
  # Generate a plot of the requested variable against mpg and only
  # include outliers if requested
  output$machineCount <- renderPlot({
    
    
    
    yvalues=1:nrow(d)
    
    plot(yvalues,d[,input$v],type='l',
            
            ylab="Count",
            xlab="Column Number in the Alignment")
  })
}



shinyApp(ui=ui,server=server)
