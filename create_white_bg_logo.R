# Load package and image

library("magrittr")
logo_path <- "logo-r.png"

# Add transparency and watercolor effect

logo <- magick::image_read(logo_path)

height <- magick::image_info(logo)$height

magick::image_blank(height, height, color = "white") %>%
magick::image_composite(logo, operator = "dissolve",
                          compose_args = "50%",
                          gravity = "center") %>%
magick::image_scale("500") %>%
magick::image_write("logo.png")

## Remove border

magick::image_border(logo, "none", "100x100") %>%
magick::image_write("partly_transparent_logo_borders.png")

