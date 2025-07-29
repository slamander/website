---
title: "Baecher Research"
type: landing
date: 2025-01-25
draft: false

sections:
  - block: hero
    content:
      title: "Baecher research: QμΣst "
      #title: Baecher research
      text: '<span class="text-xl">*quantitative ecology in space and time*</span>'
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

        > "Whether in a classroom or lab, teaching must be student-centered, holistic, and equitable. By  fostering a supportive, engaging environment and recognizing all of students’ needs  (educational, emotional, and biological), I empower students to demonstrate mastery or seek additional support as needed—an approach known to increase success and enhance well-being ([Kaput 2018](https://www.educationevolving.org/resources/evidence-for-student-centered-learning))."

        ## Teaching Philosophy

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <h3>Teaching Philosophy: </h3>
            <p> 
        I employ the following evidence-based strategies: 

         - inquiry-based learning through real-world problem-solving

         - hands-on, experiential activities

         - active learning exercises (e.g., case studies and debates)

         </p>
        </div>
          <div>
            <h3>Mentoring Philosophy:</h3>
            <p>
         I prioritize three key practices:

         - regular check-ins to align students’ academic progress with their personal goals and well-being

         - fostering independent problem-solving by giving students space to explore, make mistakes, and reflect

         - encouraging external mentorship, whether within the lab (through peer or cascade mentoring) or from additional faculty mentors

         </p>
        </div>
        </div>

         ## Student Outcomes
        My students have gone on to pursue careers in:
        - **Career progression:** 7 students now in MS (5) and PhD (2) programs and credit my mentorship in shaping their career trajectory
        - **Academic output:** 11 conference presentations, 1 undergraduate thesis, and 4 peer-reviewed publications

        ## Courses taught

        ### **Environmental Science** | University of Florida
        *Senior-level course | 2022 -- 2024*
        
        A course covering population ecology, habitat management, and conservation strategies for wildlife species. Students learn to apply quantitative methods to real conservation problems.
        
        - **Topics**: Environmental monitoring, data collection, modeling, technical speaking and writing
        - **Methods**: R programming, GIS analysis, field techniques
        - **Enrollment**: 25 students
        
        [Course Materials](#) | [Syllabus (PDF)](#) | [R Tutorials](#)

        ### **Landscape Connectivity Modeling** | Graduate Workshop
        *Intensive 3-day workshop | Spring 2024*
        
        Hands-on workshop teaching cutting-edge methods for modeling animal movement and landscape connectivity using circuit theory and spatial absorbing Markov chains.
        
        - **Software**: R, Circuitscape, SAMC package
        - **Participants**: 40 researchers from 15 institutions
        - **Focus**: Theory, implementation, and interpretation
        
        [Workshop Materials](https://github.com/your-repo) | [Video Lectures](#) | [Practice Datasets](#)

        ## Select Guest Lectures & Workshops

        - **Salamander Conservation in the Southeastern USA** - University of Florida (Spring 2020)
        - **Grassland Herpetofauna Restoration Ecology** - University of Florida (Spring 2020) 
        - **Landscape Connectivity Principles** - University of Florida (Spring 2020)
        - **Expert Elicitation for Invasive Species Management** - IALE Conference (2023)
        - **SAMC Connectivity Modeling** - Species on the Move Conference (2023)

        *Interested in collaborating on teaching or need guest lectures? [Get in touch!](mailto:jbaecher@gmail.com)*
    design:
      columns: '1'
      spacing:
        padding: ["40px", "0", "40px", "0"]
      background:
        color: ''
        text_color_light: false
---