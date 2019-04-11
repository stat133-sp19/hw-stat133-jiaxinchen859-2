library(shiny)
library(ggplot2)

# Define UI for application that draws a plot for the timeline charts of each savings modality,
# and display the data frame with the yearly balance in each savings modality.

ui <- fluidPage(
    
    # application title
    titlePanel("Savings Simulations"),
    
    # Sidebar with a slider input for Initial Amount, Annual Contribution, Return Rate, 
    # Growth Rate, Years, and Facet.
    fluidRow(
        
        column(4, 
               sliderInput(
                   inputId = "initial",
                   pre = "$",
                   label = "Initial Amount",
                   min = 0,
                   max = 100000,
                   value = 1000,
                   step = 500),
               
               br(),
               
               sliderInput(
                   inputId = "contrib",
                   pre = "$",
                   label = "Annual Contribution",
                   min = 0,
                   max = 50000,
                   value = 2000,
                   step = 500)
               
        ),
        
        column(4, 
               sliderInput(
                   inputId = "rate",
                   label = "Return Rate (in %)",
                   min = 0,
                   max = 20,
                   value = 5,
                   step = 0.1),
               
               br(),
               
               sliderInput(
                   inputId = "growth",
                   label = "Growth Rate (in %)",
                   min = 0,
                   max = 20,
                   value = 2,
                   step = 0.1)
               
        ),
        
        column(4, 
               sliderInput(
                   inputId = "years", 
                   label = "Years",
                   min = 0,
                   max = 50,
                   value = 20,
                   step = 1),
               
               br(),
               
               selectInput(
                   inputId = "facet",
                   label = "Facet?",
                   choices = c("No", "Yes"),
                   selected = "No")
        ),
        
    
        
        
        # Main panel for displaying outputsz: a plot for timeline and a balance table.
        mainPanel(
            h4("Timeline"),
            plotOutput('distPlot'),
            
            h4("Balance"),
            verbatimTextOutput("view")
        )
        
    )  
    
    
)


# Define server logic required to draw a plot for timeline and make a balance table

server <- function(input, output) {
    
    
    dat = reactive({
        
        amount = input$initial
        rate = input$rate / 100
        years = input$years
        contrib = input$contrib
        growth = input$growth / 100
        
        # Mode 1
        future_value = function(amount, rate, years) {
            amount * (1 + rate )^years
        }
        
        # Mode 2
        annuity = function(contrib, rate, years) {
            contrib * (((1 + rate)^years - 1) / rate) 
        }
        
        # Mode 3
        growing_annuity = function(contrib, rate, growth, years) {
            contrib * (((1 + rate)^years - (1 + growth)^years) / (rate - growth))
        }
        
        year = 0:input$years
        FV = rep(0, length(year))
        FVA = rep(0, length(year))
        FVGA = rep(0, length(year))
        no_contrib = rep(0, length(year))
        fixed_contrib = rep(0, length(year))
        growing_contrib = rep(0, length(year))
        
        for (i in 0:input$years) {
            
            FV[i+1] = future_value(amount, rate, years = i)
            no_contrib[i+1] = FV[i+1]
            
            FVA[i+1] = annuity(contrib, rate, years = i)
            fixed_contrib[i+1] = FV[i+1] + FVA[i+1]
            
            FVGA[i+1] = growing_annuity(contrib, rate, growth, years = i)
            growing_contrib[i+1] = FV[i+1] + FVGA[i+1]
        }
        
        dat = data.frame(year = 0:input$years,
                         no_contrib = no_contrib,
                         fixed_contrib = fixed_contrib,
                         growing_contrib = growing_contrib)
        
        return(dat)
        
    })
    
    dat1 = reactive({
        
        amount = input$initial  
        rate = input$rate / 100
        years = input$years
        contrib = input$contrib
        growth = input$growth / 100
        
        # Mode 1
        future_value = function(amount, rate, years) {
            amount * (1 + rate )^years
        }
        
        # Mode 2
        annuity = function(contrib, rate, years) {
            contrib * (((1 + rate)^years - 1) / rate) 
        }
        
        # Mode 3
        growing_annuity = function(contrib, rate, growth, years) {
            contrib * (((1 + rate)^years - (1 + growth)^years) / (rate - growth))
        }
        
        year = 0:input$years
        FV = rep(0, length(year))
        FVA = rep(0, length(year))
        FVGA = rep(0, length(year))
        no_contrib = rep(0, length(year))
        fixed_contrib = rep(0, length(year))
        growing_contrib = rep(0, length(year))
        
        for (i in 0:input$years) {
            
            FV[i+1] = future_value(amount, rate, years = i)
            no_contrib[i+1] = FV[i+1]
            
            FVA[i+1] = annuity(contrib, rate, years = i)
            fixed_contrib[i+1] = FV[i+1] + FVA[i+1]
            
            FVGA[i+1] = growing_annuity(contrib, rate, growth, years = i)
            growing_contrib[i+1] = FV[i+1] + FVGA[i+1]
        }
        
        
        mode1 = data.frame(year = 0:input$years,
                           balance = no_contrib)
        saving_type = "no_contrib"
        mode1 = cbind(saving_type, mode1)
        
        mode2 = data.frame(year = 0:input$years,
                           balance = fixed_contrib)
        saving_type = "fixed_contrib"
        mode2 = cbind(saving_type, mode2)
        
        mode3 = data.frame(year = 0:input$years,
                           balance = growing_contrib)
        saving_type = "growing_contrib"
        mode3 = cbind(saving_type, mode3)
        
        dat1 = data.frame(rbind(mode1, mode2, mode3))
        
        return(dat1)
        
    })
    
    output$distPlot = renderPlot({
        
        if (input$facet == 'No') {
            cols = c("no_contrib" = "red", "fixed_contrib" = "green",
             "growing_contrib" = "blue")
             ggplot(data = dat(), aes(x = year)) +
                 geom_line(aes(y = no_contrib, colour = "no_contrib"), size = 1) +
                 geom_point(aes(y = no_contrib, colour = "no_contrib"), size = 1) +
                 geom_line(aes(y = fixed_contrib, colour = "fixed_contrib"), size = 1) + 
                 geom_point(aes(y = fixed_contrib, colour = "fixed_contrib"), size = 1) +
                 geom_line(aes(y = growing_contrib, colour = "growing_contrib"), size  = 1) +
                 geom_point(aes(y = growing_contrib, colour = "growing_contrib"), size = 1) +
                 scale_colour_manual(name = "variable", values = cols) +
                 labs(x = 'year', y = 'value', title = "Three modes of investing") 
        } else if (input$facet == "Yes") {
            cols = c("no_contrib" = "#F52C4A94", "fixed_contrib" = "#2EEB2AA1",
                     "growing_contrib" = "#2B6AF0A1")
            ggplot(data = dat1(), aes(x = year, y = balance))+
                geom_line(aes(col = factor(saving_type)), size = 1) +
                geom_point(aes(col = factor(saving_type)), size = 1) +
                geom_area(aes(fill = factor(saving_type))) +
                labs(x = 'year', y ='value', title = "Three modes of investing") +
                scale_fill_manual("variable", values = cols) +
                scale_colour_manual("variable", values = cols) +
                facet_wrap(~ saving_type) +
                theme_bw()
        }
    
    })
    
    output$view = renderPrint({
        
        dat = dat()
        
        return(dat)
        
    })
    
    
    
}


# Run the application 
shinyApp(ui = ui, server = server)

