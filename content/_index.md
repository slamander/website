---
title: "Baecher Research"
type: landing
date: 2025-01-25
draft: false

sections:
  - block: hero
    content:
      title: "Baecher research: Qμe[st]"
      #title: Baecher research
      text: '<span class="text-xl">*Quantitative Ecology in Space and Time*</span>'
      #text: "<img src='media/badge_kentucki.png' alt='description' class='inline h-20 w-20'>                  "
      primary_action:
        text: Download CV
        url: https://drive.google.com/uc?export=download&id=1zADCDlIiJlx1vXKQ6NdMLwTZm7E6sS29
        #icon: sparkles
      secondary_action:
        text: See publications
        url: https://www.alexbaecher.com/publication/
      announcement:
        text: "🚨 **New preprint**:"
        link:
          text: "Baecher et al. (2025) Science of the Total Environment"
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
        **Ph.D., Interdisciplinary Ecology** | University of Florida (2024)

        **M.Sc., Biology** | Eastern Kentucky University (2017)

        **B.Sc., Biology** | University of Arkansas (2014)

  - block: experience
    content:
      username: admin
    design:
      date_format: 'January 2006'

  - block: collection
    content:
      title: "Research" 
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
      count: 6
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

  - block: markdown
    content:
      title: "Teaching & Mentoring"
      text: |

        I believe education must be student-centered, holistic, and equitable. By fostering a supportive, engaging environment and recognizing all of students’ needs  (educational, emotional, and biological), I empower students to demonstrate mastery or seek additional support as needed—an approach known to increase success and enhance well-being.

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <h3>Teaching Philosophy: </h3>
            <p> 
         - encourange real-world problem solving through inquiry-based learning

         - provide hands-on, experiential activities

         - create active learning exercises (e.g., case studies)

         </p>
        </div>
          <div>
            <h3>Mentoring Philosophy:</h3>
            <p>
         - align progress with personal goals and well-being

         - provide space to explore, make mistakes, and reflect

         - encourage external collaboration

         </p>
        </div>
        </div>

         ## Student outcomes
        My students have gone on to pursue careers in:
        - **Career progression:** 7 students now in MS (5) and PhD (2) programs and credit my mentorship in shaping their career trajectory
        - **Academic output:** 11 conference presentations, 1 undergraduate thesis, and 4 peer-reviewed publications

        ## Recent courses taught

        - **Environmental Science** | University of Florida (2022-2024)*
                
          - **Topics**: Environmental monitoring, data collection, modeling, technical speaking and writing
          - **Methods**: R programming, GIS analysis, field techniques
          - **Enrollment**: 12 students
        
            [Course Materials](#) | [Syllabus (PDF)](#) | [R Tutorials](#)

          ![Env Science 2023](/media/EVS_3000L_pic_collage.png)


        ## Select Guest Lectures & Workshops

        - **Salamander Conservation in the Southeastern USA** - University of Florida (Spring 2020)
        - **Grassland Herpetofauna Restoration Ecology** - University of Florida (Spring 2020) 
        - **Landscape Connectivity Principles** - University of Florida (Spring 2020)
        - **Expert Elicitation for Invasive Species Management** - IALE Conference (2023)
        - **SAMC Connectivity Modeling** - Species on the Move Conference (2023)

---