
shiny::fluidPage(
    theme = shinythemes::shinytheme("darkly"),
    shiny::navbarPage(
        title = "Pooya Shirazi",
        shiny::tabPanel(
            title = "Upload Files",
            shiny::sidebarPanel(
                shiny::selectInput(
                    inputId = "selectClass",
                    label = "Select Your Class:",
                    choices = list(
                        # "Computer Programming Class" = "CompProgClass",
                        "Practical Irrigation Class" = "PracIrriClass"
                    )
                ),
                shiny::selectInput(
                    inputId = "selectGroup",
                    label = "Select Your Group:",
                    choices = character(0)
                ),
                shiny::dateInput(
                    inputId = 'selectdate',
                    label = 'Select Your Class Time',
                    value = Sys.Date()
                ),
                shiny::selectInput(
                    inputId = "selectTeam",
                    label = "Select Your Team:",
                    choices = list(
                        "Team A" = "A",
                        "Team B" = "B",
                        "Team C" = "C",
                        "Team D" = "D",
                        "Team E" = "E"
                    )
                ),
                shiny::textInput(
                    inputId = "studentNum",
                    label = "Please Input Your FUM Student Number:"
                ),
                shiny::fileInput(
                    inputId = "fileUpload",
                    label = "Please Upload Your File:",
                    accept = c(".zip", ".rar"),
                    placeholder = "Your File must Be 'zip' or 'rar' Archive Format"
                ),
                shiny::actionButton(
                    inputId = "upload",
                    label = "Upload"
                )
            ),
            shiny::mainPanel(

            )
        )
    )
)
