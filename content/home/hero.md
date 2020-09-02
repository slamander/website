+++
# Hero widget.
widget = "hero"  
headless = true 
active = true  
weight = 1  # Order that this section will appear.

title = "Baecher Research"

# Hero image (optional). Enter filename of an image in the `static/media/` folder.
 hero_media = "border_connectivity.gif"

[design.background]

  # Background color.
  #color = "#2962ff"
  color = "#000000
  

  # Background image.
  # image = "headers/jrcs.jpg"  # Name of image in `static/media/`.
  # padding = ["25px", "0", "200px", "0"]
   image_darken = 0.5  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.
  # image_size = "cover"  #  Options are `cover` (default), `contain`, or `actual` size.
  # image_position = "center"  # Options include `left`, `center` (default), or `right`.
  # image_parallax = true  # Use a fun parallax-like fixed background effect? true/false
  
  # Text color (true=light or false=dark).
  text_color_light = true
  
   [cta]
   url = "files/cv.pdf"
   label = "Get my CV"
   icon_pack = "fas"
   icon = "download"


 [cta_alt]
   # url = "https://sourcethemes.com/academic/"
   url = "#contact"
   label = "Contact me"

+++

