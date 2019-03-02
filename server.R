
function(input, output, session) {
    
    shiny::observe(
        {
            x <- input$selectClass
            
            if (x == "CompProgClass")
            {
                choices = list(
                    "Water Engineering - Group 01" = "Group 01",
                    "Water Engineering - Group 11" = "Group 11",
                    "Water Engineering - Group 21" = "Group 21"
                )
            } else {
                choices = list(
                    "General Irrigation - Group 08" = "Group 08",
                    "General Irrigation - Group 18" = "Group 18"
                )
            }
            
            shiny::updateSelectInput(
                session = session,
                inputId = "selectGroup",
                label = "Select Your Group:",
                choices = choices
            )
        }
    )
    
    dropboxFolder <- shiny::reactive(
        {
            paste("Assignment", input$selectClass, input$selectGroup, sep = "/")
        }
    )

    shiny::observeEvent(
        input$upload,
        {
            file <- input$fileUpload
            
            oldName <- file$datapath
            
            newName <- paste(substr(x = oldName, start = 1, stop = nchar(oldName) - 5), 
                             input$selectdate, '-', input$selectTeam, ".zip", sep = "")
            
            file.rename(from = oldName, to = newName)
            
            if (is.null(file)) {
                return()
            }
            
            rdrop2::drop_upload(file = newName,
                                path = dropboxFolder(),
                                dtoken = token,
                                mode = "add")
            
            shiny::showNotification(ui = "Thanks, File Upload Successfully",
                                    action =  a(href = "javascript:location.reload();", "Reload page"))
        }
    )
}
