library(magick)
library(hexSticker)
library(ggplot2)
library(magrittr)

# create hexagon mask
ggplot() +
  geom_hexagon(size = 1.2, fill = "black", color = "black") +
  theme_sticker() +
  ggsave("./man/figures/mask.png")

# apply mask
# https://stackoverflow.com/questions/40066806/most-efficient-way-to-crop-image-to-circle-in-r
mask <- image_read("./man/figures/mask.png") %>% 
  image_scale("1575x1575")

image <- image_read("./man/figures/flag_yellow_high.jpg") %>%
  image_convert(format = "png") %>% 
  image_crop("1575x1575+394+20") #widthxheight+x+y
  
image <- image_composite(mask, image, "plus") %>%
  image_transparent("white", fuzz = 20L)

# add text
image %>% 
  image_annotate("article17", size = 180L, gravity = "center", 
                 color = "#FFCC00", style = "italic",
                 strokecolor = "#9E8508",
                  font = "sans") %>% 
  image_write(path = "./man/figures/eu_flag.png", format = "png")

# create hex sticker logo
sticker(subplot = "./man/figures/eu_flag.png", s_x = 1, s_y = 1, s_width = 1, s_height = 1, package = "",
        h_fill = "#003399", h_color = "#9E8508",
        filename = "man/figures/logo.png")

# format hex sticker
 image_read("./man/figures/logo.png") %>%
   image_fill("white", point = "+200+200", fuzz = 60) %>%
   image_fill("#003399", point = "+200+200") %>%
   image_write(path = "./man/figures/logo.png", format = "png")