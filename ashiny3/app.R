library(shiny)

# Define UI for miles per gallon app ----
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Miles Per Gallon"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(
  
        # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:", 
                c("Cylinders" = "cyl",
                  "Transmission" = "am",
                  "Gears" = "gear")),

      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE)
  
  ),
  
  # Main panel for displaying outputs ----
  mainPanel()
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
}

shinyApp(ui, server)
