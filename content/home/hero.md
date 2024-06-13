+++
# Hero widget.
widget = "hero"  
headless = true 
active = true  
weight = 1  # Order that this section will appear.

title = "Baecher Research"

# Hero image (optional). Enter filename of an image in the `static/media/` folder.
hero_media = "black_white_glutinosus_trans.png"

    [design.background]
    
  # Background color.
  color = "#2962ff"
  
  # Background image.
 # image = "cover_wide.jpg"  # Name of image in `static/media/`.
 # padding = ["500px", "500px", "500px", "500px"]
  image_darken = 0.2  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.
 # image_size = "contain"  #  Options are `cover` (default), `contain`, or `actual` size.
 # image_position = "center"  # Options include `left`, `center` (default), or `right`.
 # image_parallax = true  # Use a fun parallax-like fixed background effect? true/false
  
  # Text color (true=light or false=dark).
  text_color_light = true
  
    [cta]
  url = "files/cv.pdf"
  label = "Curriculum Vitae (06-13-2024)"
  icon_pack = "fas"
  icon = "download"
  
    [cta_alt]
  # url = "https://sourcethemes.com/academic/"
  url = "#contact"
  label = "Contact me"

+++

