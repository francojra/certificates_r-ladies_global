
# Instalar pacote --------------------------------------------------------------------------------------------------------------------------

# install.packages("devtools")
devtools::install_github("forwards/certificate")

library(certificate)

# Nomes dos participantes ------------------------------------------------------------------------------------------------------------------

attendees <- c("Marnie Dickinson", "Dr. Marlin Wilderman")

# Informações sobre o curso ----------------------------------------------------------------------------------------------------------------

workshop <- "Package development workshop"
date <- as.Date("2018-01-01")
location <- "University of Lorraine"

# Conteúdos do currículo -------------------------------------------------------------------------------------------------------------------

curriculum <- system.file("rmarkdown", "templates",
                          "workshop_certificate", "resources",
                          "default_workshop_contents.md", 
                          package = "certificate")
readLines(curriculum)
#> [1] "- Making code into an R package"    ""                                  
#> [3] "- Collaborative coding with GitHub" ""                                  
#> [5] "- Writing a vignette or an article" ""                                  
#> [7] "- Building a package webpage"       ""                                  
#> [9] "- Submitting a package to CRAN"

# Informações sobre a organização ----------------------------------------------------------------------------------------------------------

certifier <- "Zaire Crooks"
credentials <- "Forwards teaching team member"
organization <- "Forwards, the R Foundation taskforce for women and other
under-represented groups"
organization_url <- "forwards.github.io/"

# Gerar certificado ------------------------------------------------------------------------------------------------------------------------


