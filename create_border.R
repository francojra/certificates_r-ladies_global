library(grid)

cores <- c("#380436","#442342", "#660f53",
"#e06196", "#f5a4c5", "#382d72", "#5c509c",
"#360f2a", "#68324a", "#61447e")

pdf("inst/extdata/assets/color7_border.pdf", width = 1, height = 10)
grid.newpage()
grid.raster(cores)
dev.off()



