---
title: "Baecher Research"
type: landing
date: 2025-01-25
draft: false

sections:
  - block: hero
    content:
      title: Baecher research
      text: spatial ecology and conservation
      test-align: right
      primary_action:
        text: Download CV
        url: https://drive.google.com/uc?export=download&id=1zADCDlIiJlx1vXKQ6NdMLwTZm7E6sS29
        #icon: sparkles
      secondary_action:
        text: See publications
        url: https://www.alexbaecher.com/publication/
      announcement:
        text: "🚨 New preprint: Baecher et al. Science of the Total Environment"
        link:
          text: Read more
          url: https://ecoevorxiv.org/repository/view/9228/
      advanced:
        css_style: "text-align: left;"
    design:
      background:
        image:
          # Name of image in `assets/media/`.
          filename: log_alt.jpg
          # Apply image filters?
          filters:
            # Darken the image? Range 0-1 where 1 is transparent and 0 is opaque.
            brightness: 0.6
          #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
          size: cover
          # Image focal point. Options include `left`, `center` (default), or `right`.
          position: center
          # Use a fun parallax-like fixed background effect on desktop? true/false
          parallax: true
          # Text color (true=light, false=dark, or remove for the dynamic theme color).
          text_color_light: true

  - block: resume-biography
    content:
      # The user's folder name in `content/authors/`
      username: admin
      # Show a call-to-action button under your biography? (optional)
      # To link to a file, upload it to your `static/uploads/` folder
      #button:
        #text: Download Résumé
        #url: https://drive.google.com/file/d/1zADCDlIiJlx1vXKQ6NdMLwTZm7E6sS29/view?usp=sharing
    design:
      #banner:
        # Upload a cover image to `assets/media/` folder and reference its filename here (optional)
        #filename: 'log_cropped.jpg'
      biography:
        # Customize the CSS style of your biography text (optional)
        style: ''

  - block: experience
    content:
      username: admin
    design:
      # Hugo date format
      date_format: 'January 2006'
      # Education or Experience section first?
      is_education_first: false

  - block: markdown
    content:
      title: "Education"
      text: |
        **Ph.D., Interdisciplinary Ecology** | University of Florida (2024)
        
        **M.Sc., Biology** | Eastern Kentucky University (2017)
        
        **B.Sc., Biology** | University of Arkansas (2014)

  - block: collection
    content:
      title: "Research Projects" 
      count: 5
      filters:
        folders:
          - project
    design:
      view: card
      columns: 2

  - block: collection
    content:
      title: "Recent Publications (since 2024)"
      count: 5
      archive:
        enable: true
        text: "See all publications"
        link: publication/
      filters:
        folders:
          - publication
    design:
      view: citation
      columns: 1

  - block: collection
    content:
      title: "Recent Talks"
      count: 5
      archive:
        enable: true
        text: "See all talks"
        link: post/
      filters:
        folders:
          - talk
    design:
      view: card
      columns: 2

  - block: collection
    content:
      title: "📊 Coding Tutorials & Blog Posts"
      subtitle: "Data science tutorials and R programming guides"
      text: ""
      count: 6
      archive:
        enable: true
        text: "See all tutorials →"
        link: "post/"
      filters:
        folders:
          - post
    design:
      view: card
      columns: 2
      spacing:
        padding: ["20px", "0", "20px", "0"]
---