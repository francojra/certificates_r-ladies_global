
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

dir <- "C:/Users/jeann/Documents/R-Ladies Natal"
create_workshop_certificates(attendees, workshop, date, location,
                             curriculum, certifier, credentials,
                             organization, organization_url,
                             dir)
#> 
#> 
#> processing file: skeleton.Rmd
#>   |                                                           |                                                   |   0%  |                                                           |...                                                |   6%                     |                                                           |......                                             |  12% [setup]             |                                                           |.........                                          |  18%                     |                                                           |............                                       |  24% [attendee]          |                                                           |...............                                    |  29%                     |                                                           |..................                                 |  35% [action_text]       |                                                           |.....................                              |  41%                     |                                                           |........................                           |  47% [workshop]          |                                                           |...........................                        |  53%                     |                                                           |..............................                     |  59% [location]          |                                                           |.................................                  |  65%                     |                                                           |....................................               |  71% [curriculum_title]  |                                                           |.......................................            |  76%                     |                                                           |..........................................         |  82% [curriculum]        |                                                           |.............................................      |  88%                     |                                                           |................................................   |  94% [signature]         |                                                           |...................................................| 100%                   
#> output file: skeleton.knit.md
#> /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/pandoc +RTS -K512m -RTS skeleton.knit.md --to latex --from markdown+autolink_bare_uris+tex_math_single_backslash --output /Users/stspao/Desktop/certificates/package_development_workshop_2018-01-01_marnie_dickinson.tex --lua-filter /Users/stspao/Library/R/arm64/4.3/library/rmarkdown/rmarkdown/lua/pagebreak.lua --lua-filter /Users/stspao/Library/R/arm64/4.3/library/rmarkdown/rmarkdown/lua/latex-div.lua --embed-resources --standalone --template template.tex --highlight-style tango --pdf-engine xelatex
#> 
#> Output created: /Users/stspao/Desktop/certificates/package_development_workshop_2018-01-01_marnie_dickinson.pdf
#> 
#> 
#> processing file: skeleton.Rmd
#>   |                                                           |                                                   |   0%  |                                                           |...                                                |   6%                     |                                                           |......                                             |  12% [setup]             |                                                           |.........                                          |  18%                     |                                                           |............                                       |  24% [attendee]          |                                                           |...............                                    |  29%                     |                                                           |..................                                 |  35% [action_text]       |                                                           |.....................                              |  41%                     |                                                           |........................                           |  47% [workshop]          |                                                           |...........................                        |  53%                     |                                                           |..............................                     |  59% [location]          |                                                           |.................................                  |  65%                     |                                                           |....................................               |  71% [curriculum_title]  |                                                           |.......................................            |  76%                     |                                                           |..........................................         |  82% [curriculum]        |                                                           |.............................................      |  88%                     |                                                           |................................................   |  94% [signature]         |                                                           |...................................................| 100%                   
#> output file: skeleton.knit.md
#> /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/pandoc +RTS -K512m -RTS skeleton.knit.md --to latex --from markdown+autolink_bare_uris+tex_math_single_backslash --output /Users/stspao/Desktop/certificates/package_development_workshop_2018-01-01_dr.marlin_wilderman.tex --lua-filter /Users/stspao/Library/R/arm64/4.3/library/rmarkdown/rmarkdown/lua/pagebreak.lua --lua-filter /Users/stspao/Library/R/arm64/4.3/library/rmarkdown/rmarkdown/lua/latex-div.lua --embed-resources --standalone --template template.tex --highlight-style tango --pdf-engine xelatex
#> 
#> Output created: /Users/stspao/Desktop/certificates/package_development_workshop_2018-01-01_dr.marlin_wilderman.pdf
