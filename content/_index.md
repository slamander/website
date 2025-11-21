---
title: "Qμest"
type: landing
date: 2025-01-25
draft: false

sections:
  - block: hero
    content:
      title: "Baecher research"
      #text: '<span class="text-xl">*Quantitative Ecology in Space and Time*</span>'
      subtitle: "Qμe[st]"
      text: | 
        <span class="text-xxl">**Qμe[st]:**</span>
        <span class="text-xl">**Qμ**antitative **E**cology in **S**pace and **T**ime</span>      ‎‎ 
        <br>
        <br>        ‎ 
        <img src='media/badge_kentucki.png?v=F' alt='Plethodon kentucki' class='w-32 h-auto mx-auto' style='width: 300px; height: auto;'>
        
      primary_action:
        text: Download CV
        url: https://drive.google.com/uc?export=download&id=1e5f2qbiZPzhd-X-9LTDRnaQINNVB2qTd
      secondary_action:
        text: See publications
        url: https://www.alexbaecher.com/publication/
      announcement:
        text: "🚨 **New publication!!!**:"
        link:
          text: "Baecher et al. (2025) Science of the Total Environment"
          url: https://drive.google.com/uc?export=download&id=18iC6ef6CvYbGusfIGgnw7IqjyQgmNUsc
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
        #url: https://drive.google.com/uc?export=download&id=1ehav_oiSY73HkeEZY9M-MKhj7OCCQbhz
    design:
        #filename: 'log_cropped.jpg'
      biography:
        style: ''

  - block: markdown
    content:
      title: "Education"
      text: |
        **Ph.D., Interdisciplinary Ecology** | University of Florida (2024)
         - *Fellowship:* Doctoral Preeminence Research Fellowship
         - [Scheffers lab](https://www.schefferslab.com/) (Dept. Wildlife Ecology and Conservation) 

        **M.Sc., Biology** | Eastern Kentucky University (2017)
         - *Teaching Assistant*: Human Anatomy
         - [Richter lab](https://richterlab.weebly.com/) (Dept. Biology) 

        **B.Sc., Biology** | University of Arkansas (2014)
         - *Research Assistant*
         - [Willson lab](https://www.willsonlab.com/) (Dept. Biology) 


  - block: experience
    content:
      username: admin
    design:
      date_format: 'January 2006'

  - block: collection
    content:
      title: "Research" 
      count: 5
      archive:
        enable: true
        text: "See all projects →"
        link: project/
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
        text: "See all publications →"
        link: publication/
      filters:
        folders:
          - publication
    design:
      view: citation
      columns: 2

  - block: collection
    content:
      title: "Select talks"
      count: 3
      archive:
        enable: true
        text: "See all talks →"
        link: talk/
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
      count: 2
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

        Whether in a classroom or lab, teaching must be student-centered, holistic, and equitable. By  fostering a supportive, engaging environment and recognizing all of students’ needs  (educational, emotional, and biological), I empower students to demonstrate mastery or seek additional support as needed—an approach known to increase success and enhance well-being.

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <h3>Teaching Philosophy: </h3>
            <p> 
        Evidence-based strategies: 

         - inquiry-based learning through real-world problem-solving

         - hands-on, experiential activities (in the classroom, lab, or field)

         - active learning exercises (e.g., case studies and debates)

         </p>
        </div>
          <div>
            <h3>Mentoring Philosophy:</h3>
            <p>

         Key practices:

         - align students’ academic progress with personal goals and well-being

         - foster independent problem-solving by providing space to explore and reflect

         - encourage outside collaboration and/or mentorship

         </p>
        </div>
        </div>

         ## Student Outcomes
        My students have gone on to pursue careers in academia, state/federal agencies, and the private sector:
        - **Career progression:** 7 students pursued or completed MS (5) and PhD (2) programs and credit my mentorship in shaping their career trajectory
        - **Academic output:** 15 conference presentations, 2 undergraduate theses, and 4 peer-reviewed publications

        ## Recent courses

        ### **Environmental Science** | University of Florida
        *Senior-level course | 2022 -- 2024*
        <img src="/media/EVS_3000L_pic_collage.png" alt="EVS 3000L collage" style="width: 1000px; height: auto;">
        
        A course covering population ecology, habitat management, and conservation strategies for wildlife species. Students learn to apply quantitative methods to real conservation problems.
        
        - **Topics**: Land management, Climate science, social-ecological systems, environmental justice, sustainability, invasive species
        - **Methods**: R programming, GIS analysis, field techniques, technical writing, science communication
        - **Enrollment**: 12 students
        
        [Syllabus (PDF)](https://drive.google.com/file/d/1oqrRQFm-8x6X6gH7MzmizIdZpZrwe3jG/view?usp=sharing) | Teaching R: [pt 1](https://www.alexbaecher.com/post/r-intro/) & [pt 2](https://www.alexbaecher.com/post/r-intro-pt2/)

        ### **Landscape Connectivity Modeling** | Professional workshop
        *Intensive workshop | Spring 2024*

        Hands-on workshop teaching cutting-edge methods for modeling animal movement and landscape connectivity using circuit theory and spatial absorbing Markov chains.
        
        - **Software**: R, Circuitscape, SAMC package
        - **Participants**: 40 researchers from 15 institutions
        - **Focus**: Theory, implementation, and interpretation
        
        [Workshop Materials](https://github.com/your-repo) | [Video Lectures](#) | [Practice Datasets](#)

        ## Select Guest Lectures & Workshops

        - **Salamander Conservation in the Southeastern USA** - University of Florida (Spring 2020)
        - **Connectivity for Species Redistribution** - University of Florida (Spring 2020) 
        - **Expert Elicitation for Invasive Species Management** - University of Florida (2023)
        - **SAMC Connectivity Modeling** - Species on the Move Conference (2023)

        ## Resources: 
        See my **R sandbox** for a 2-part tutorial on R coding:
          - [**Part 1:**](https://www.alexbaecher.com/post/r-intro/)
            - Using functions
            - Help functions
            - Vectors
            - Sequences
            - Data frames
          - [**Part 2:**](https://www.alexbaecher.com/post/r-intro-pt2/)
            - read data from a csv file
            - manipulate a data set
            - join multiple data sets
            - plot data
            - animate figures
            - create for loops

    design:
      columns: '1'
      spacing:
        padding: ["40px", "0", "40px", "0"]
      background:
        color: ''
        text_color_light: false
---
