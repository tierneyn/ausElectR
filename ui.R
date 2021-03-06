library(shiny)
library(leaflet)

load("parties.rda")

shinyUI(fluidPage(
  
  tags$style(HTML("
                  @import url('https://fonts.googleapis.com/css?family=Poppins');
                  
                  body {
                  
                  font-family: 'Poppins', 'Lucida Grande', Verdana, Lucida, Helvetica, Arial, Calibri, sans-serif;
                  color: rgb(0,0,0);
                  background-color: #d2d2d2;
                  }
                  ")),
  
  titlePanel("Australia Election 2016 Votes by PollingPlace"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("party", "Select a party to add to the map",
                  choices = c("", parties$party), selected = "", 
                  size = , selectize = FALSE),
      actionButton("clear1", "Clear all parties"),
      p(),
      sliderInput("sc", "Scale size of circles (also redraws map to show only the last added party)",
                  min = 0.5, max = 5, value = 1, step = 0.1),
      h2("Instructions"),
      p("Choose a political party from the drop down box to see what proportion
        of the party vote they got at individual voting places.  Click on the 
        circles to get the actual percentage.  Choose another party to superimpose their
        circles on the first party, and so on.  Zoom in and out on the map with the scroll 
        wheel of a mouse, or grab it to move to another part of the country.  Rescale
        the circles with the slider provided if you want."),
      
      p("It's useful to pick two parties to compare the sizes of their circles. 
Because choosing a party adds another layer to the map, you can choose the order 
in which parties' circles are superimposed on eachother."),
      p("When you zoom in and out on the map, the circles resize for readability."),
      plotOutput("leg", height = "100px"),
      h2("About"),
      HTML("<p>Created by Fang Zhou with R and Shiny.  R users can download the 
           cleaned and tidy data from <a href = 'https://github.com/ropenscilabs/ausElectR'>https://github.com/ropenscilabs/ausElectR</a>.  
           Original source is <a href = 'http://www.electionresults.govt.aus/'>
           http://www.electionresults.govt.aus/</a>")
      ),
    
    
    mainPanel(
      leafletOutput("MyMap", height = 800)
    )
      )
    ))
