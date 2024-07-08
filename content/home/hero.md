+++
# Hero widget.
widget = "hero"  
headless = true 
active = true  
weight = 1  # Order that this section will appear.

title = "Baecher Research"

  # Hero image (optional). Enter filename of an image in the `static/media/` folder.
hero_media = "badge_kentucki.png"

    [design.background]
    
  # Background color.
  # color = "#2962ff"
  
  # Background image.
 image = "log_extended.png"  # Name of image in `static/media/`.
 padding = ["200px", "0px", "200px", "0px"]
   image_darken = 0.1  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.
 image_size = "cover"  #  Options are `cover` (default), `contain`, or `actual` size.
 image_position = "center"  # Options include `left`, `center` (default), or `right`.
 image_parallax = false  # Use a fun parallax-like fixed background effect? true/false
  
  # Text color (true=light or false=dark).
  text_color_light = true
  
    [cta]
  url = "files/cv.pdf"
  label = "Curriculum Vitae (07-08-2024)"
  icon_pack = "fas"
  icon = "download"

+++

