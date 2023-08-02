library("magrittr")
logo_path <- "logo.jpg"

# replace transparent background with white background
# note, this is probably not the best solution
logo <- magick::image_read(logo_path)
height <- magick::image_info(logo)$height
magick::image_blank(height, height, color = "white") %>%
  magick::image_composite(logo) %>%
  magick::image_write("white_bg_forwards.png")

bitmap <- logo[[1]]
bitmap[3,,] <- as.raw(as.integer(bitmap[3,,]) * 0.9)
newlogo <- magick::image_read(bitmap)
newlogo %>%
    magick::image_write("partly_transparent_forwards.png")

magick::image_border(newlogo, "none", "100x100") %>%
    magick::image_write("partly_transparent_forwards_borders.png")


