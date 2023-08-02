#' Create certificates for all attendees
#'
#' @param attendees Names of attendees, character vector.
#' @param workshop Workshop title, character.
#' @param date Date of the workshop, as a date.
#' @param location Location of the workshop, character.
#' @param curriculum Path to the workshop curriculum (.md), character.
#' @param certifier Person certifying, character.
#' @param credentials Credentials of the certifying person, character.
#' @param organization Description of the organization running the workshops.
#' @param organization_url URL of the organization website, without https://.
#' @param dir Directory where to output the pdf certificates, character.
#' @param title Title for certificate.
#' @param action_text Action text between name and workshop title.
#' @param curriculum_title Header before curriculum content.
#' @param signature The path to an image to use as a signature.
#' @param signature_skip The space to skip between the signature image and the
#' signature line (units: cm).
#' @param logo The logo to use for the watermark, as a path to a logo
#' file or the name of a logo included in the package: either `"R"`
#' (default), or `"Forwards"`.
#' @param border_image Specify an image to use to create a border, as a path
#' to an image file. Defaults are used for the included logos: plain blue for
#' `logo = R` and a magma colour scale for `logo = "Forwards"`.
#' @param papersize Option for LaTeX article class specifying paper size, e.g.
#' `"a4paper"`, `"letterpaper"`.
#' @param keep_tex Logical argument passed to rmarkdown::render.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Fake names generated via charlatan::ch_name
#' attendees <- c("Marnie Dickinson", "Dr. Marlin Wilderman")
#' workshop <- "Package development workshop"
#' date <- as.Date("2018-01-01")
#' location <- "University of Lorraine"
#' curriculum <- system.file("rmarkdown", "templates",
#' "workshop_certificate", "resources",
#' "default_workshop_contents.md", package = "certificate")
#' certifier <- "Zaire Crooks"
#' credentials <- "Forwards teaching team member"
#' organization <- "Forwards, the R Foundation taskforce for women and other
#' under-represented groups"
#' organization_url <- "forwards.github.io/"
#' dir <- "certificates"
#' create_workshop_certificates(attendees, workshop, date, location,
#'                              curriculum, certifier, credentials,
#'                              organization, organization_url,
#'                              dir)
#' }
#' @importFrom tools file_ext
create_workshop_certificates <- function(attendees,
                                         workshop, date, location,
                                         curriculum, certifier, credentials,
                                         organization, organization_url,
                                         dir = "C:/Users/jeann/Documents/R-Ladies Natal/certificados_rladies_natal",
                                         title = "CERTIFICADO DE CONCLUSÃO",
                                         action_text = "participou do curso",
                                         curriculum_title = "Conteúdos do curso:",
                                         signature = NULL, signature_skip = -0.4,
                                         logo = "R", border_image = NULL,
                                         papersize = "landscape",
                                         keep_tex = FALSE){

    if (!dir.exists(dir)) {
        dir.create(dir)
    }

    temp_rmd <- copy_skeleton_english_file("skeleton_english.Rmd", dir)
    on.exit(file.remove(temp_rmd))

    temp_template <- copy_skeleton_english_file("template.tex", dir)
    on.exit(file.remove(temp_template), add = TRUE)

    if (!logo %in% c("R", "logo")) {
       temp_logo <- file.path(dir, "partly_transparent_logo.png")
       file.copy(logo, temp_logo)
    } else {
        logo_file <- switch(logo, "logo" = "partly_transparent_logo.png")
        temp_logo <- copy_asset_file(logo_file, "partly_transparent_logo.png",
                                     dir)
    }
    on.exit(file.remove(temp_logo), add = TRUE)

    if (!is.null(border_image)) {
        temp_border <- file.path(dir, "color7_border.pdf")
        file.copy(border_image, temp_border)
        on.exit(file.remove(temp_border), add = TRUE)
    } else if (logo == "logo") {
        temp_border <- copy_asset_file("color7_border.pdf", dir)
        on.exit(file.remove(temp_border), add = TRUE)
    } else temp_border <- NULL

    if (!is.null(signature)) {
        temp_signature <- file.path(dir,
                                    paste0("signature.", file_ext(signature)))
        file.copy(signature, temp_signature)
        on.exit(file.remove(temp_signature), add = TRUE)
    } else temp_signature <- NULL

    purrr::walk(attendees,
                create_workshop_certificate,
                title = title,
                action_text = action_text,
                workshop, date, location,
                curriculum_title = curriculum_title,
                curriculum,
                certifier, credentials,
                organization = organization,
                organization_url = organization_url,
                signature = temp_signature,
                signature_skip = signature_skip,
                border_image = temp_border,
                papersize, dir,
                keep_tex)
}

# https://tex.stackexchange.com/questions/346730/fancyhdr-package-not-working
#' @importFrom snakecase to_snake_case
create_workshop_certificate <- function(attendee,
                                        title = "CERTIFICADO DE CONCLUSÃO",
                                        action_text = "participou do curso",
                                        workshop, date, location,
                                        curriculum_title = "Conteúdos do curso:",
                                        curriculum,
                                        certifier, credentials,
                                        credentials2,
                                        organization = "R-Ladies é uma organização mundial que tem a missão de promover a diversidade de gêneros na comunidade do R",
                                        organization_url = "rladies.org/",
                                        signature = NULL,
                                        signature_skip = signature_skip,
                                        border_image = NULL,
                                        papersize = "landscape",
                                        dir = ".",
                                        keep_tex = FALSE){
    output_file_name <- to_snake_case(paste(workshop, date, attendee),
                                      sep_in = "[. ]")
    output_file <- paste0(output_file_name, ".pdf")
    rmarkdown::render(input = file.path(dir, "skeleton_english.Rmd"),
                      output_file = output_file,
                      output_dir = dir,
                      params = list(title = title,
                                    attendee = attendee,
                                    action_text = action_text,
                                    workshop = workshop,
                                    date = date,
                                    location = location,
                                    curriculum_title = curriculum_title,
                                    curriculum = curriculum,
                                    certifier = certifier,
                                    credentials = credentials,
                                    organization = organization,
                                    organization_url = organization_url,
                                    signature = signature,
                                    signature_skip = signature_skip,
                                    border_image = border_image,
                                    papersize = papersize),
                      output_options = list(keep_tex = keep_tex),
                      clean = TRUE)
}

copy_package_file <- function(old_file, old_dir, new_file, new_dir){
    new_path <- file.path(new_dir, new_file)
    file.copy(system.file(old_dir, old_file, package = "certificate"),
              new_path)
    new_path
}

copy_skeleton_english_file <- function(file, new_dir){
    copy_package_file(file,
                      file.path("rmarkdown", "templates",
                                "workshop_certificate", "skeleton_english"),
                      file, new_dir)
}

copy_asset_file <- function(file, new_file, new_dir){
    copy_package_file(file,
                      file.path("extdata", "assets"),
                      new_file, new_dir)
}

