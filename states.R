library(shiny)
library(tidyverse)
library(plotly)

args <- commandArgs(trailingOnly=T);

port <- as.numeric(args[[1]]);

data <- read.csv("derived_data/headtohead.csv") %>% 
  mutate(newpop_oldvote = pop_2019/votes_2010) %>% 
  filter(votes_2010>1) %>% 
  mutate(state = fct_reorder(state, poppervote_2010))

# Define UI for app  ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Change in population per electoral vote from 2010 to 2020"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Dropdown menu for candidates ----
      selectInput(inputId = "candidate",
                  label = "Choose a candidate:", 
                  choices = c("Trump", "Biden"))
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Dumbell Plot ----
      plotlyOutput(outputId = "fig")
      
    )
  )
)

server <- function(input, output) {
  
output$fig <- renderPlotly(
    
    fig <- data %>% filter(winner == input$candidate) %>% 
      plot_ly(color = I("gray80")) %>% 
    add_segments(x = ~poppervote_2010, xend = ~newpop_oldvote, 
                                y = ~state, yend = ~state, 
                                showlegend = FALSE) %>% 
    add_markers(x = ~poppervote_2010, y = ~state, 
                               name = "2010", color = I("red")) %>% 
    add_markers(x = ~newpop_oldvote, y = ~state, 
                               name = "2020", color = I("blue")) %>% 
    layout(
      title = "Change in population per electoral vote 2010 to 2020",
      xaxis = list(title = "Population per electoral vote"),
      margin = list(l = 65)
    ))
      
    }

#Start the server
print(sprintf("Starting shiny on port %d", port));
shinyApp(ui = ui, server = server, options = list(port=port, host="0.0.0.0"))

