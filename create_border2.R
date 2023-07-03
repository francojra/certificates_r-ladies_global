library(grid)

cores <- c("#01243a","#442342", "#660f53",
"#e06196", "#f5a4c5", "#382d72", "#5c509c", "#a080e1", "#b7c2c6",
"#e5ccf4", "#360f2a", "#68324a", "#61447e", "#a484c7", "#c0b1f4")

pdf("inst/extdata/assets/color7_border.pdf", width = 6, height = 20)
grid.newpage()
grid.raster(cores)
dev.off()

library(viridis)

# use pdf as needs to be scaleable and able to be included in PDF documents
pdf("inst/extdata/assets/color8_border.pdf", width = 1, height = 10)
grid.newpage()
grid.raster(rev(plasma(10)))
dev.off()
