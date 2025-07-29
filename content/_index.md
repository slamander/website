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
        text: "🚨 **New preprint** (July 2024):"
        link:
          text: "Baecher et al. Science of the Total Environment"
          url: https://ecoevorxiv.org/repository/view/9228/
      advanced:
        css_style: "text-align: left;"
    design:
      background:
        image:
          filename: log_alt.jpg
          filters:
            brightness: 0.5
          size: cover
          position: center
          parallax: true
          text_color_light: true

  - block: resume-biography
    content:
      username: admin
      # To link to a file, upload it to your `static/uploads/` folder
      #button:
        #url: https://drive.google.com/file/d/1zADCDlIiJlx1vXKQ6NdMLwTZm7E6sS29/view?usp=sharing
    design:
        #filename: 'log_cropped.jpg'
      biography:
        style: ''

  - block: markdown
    content:
      title: "Education"
      text: |
        <div class="row">
          <div class="col-md-12">
            <div class="timeline">
              <div class="timeline-item">
                <div class="timeline-info">
                  <span>2024</span>
                </div>
                <div class="timeline-marker"></div>
                <div class="timeline-content">
                  <h4>Ph.D., Interdisciplinary Ecology</h4>
                  <p><strong>University of Florida</strong></p>
                  <p>Dissertation focused on spatial ecology and conservation</p>
                </div>
              </div>
              <div class="timeline-item">
                <div class="timeline-info">
                  <span>2017</span>
                </div>
                <div class="timeline-marker"></div>
                <div class="timeline-content">
                  <h4>M.Sc., Biology</h4>
                  <p><strong>Eastern Kentucky University</strong></p>
                  <p>Master's research in biology</p>
                </div>
              </div>
              <div class="timeline-item">
                <div class="timeline-info">
                  <span>2014</span>
                </div>
                <div class="timeline-marker"></div>
                <div class="timeline-content">
                  <h4>B.Sc., Biology</h4>
                  <p><strong>University of Arkansas</strong></p>
                  <p>Bachelor's degree in Biology</p>
                </div>
              </div>
            </div>
          </div>
        </div>
    design:
      columns: 1

  - block: experience
    content:
      username: admin
    design:
      date_format: 'January 2006'
      is_education_first: true

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
      title: "Publications (since 2024)"
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
      columns: 2

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
      title: "R sandbox: 📊 Coding Tutorials"
      subtitle: "Data science tutorials and R programming guides"
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
---