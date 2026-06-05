---
title: Qμest Lab
type: landing
date: 2026-03-25
draft: false

sections:

  - block: hero
    content:
      title: | 
        <p align="center"> 
        <img src='media/emory_shield_stylized.png?v=F' width="400">
        </p>
      # announcement:
      #   text: "🚨**Recruiting students and postdoc for Fall 2026!!!**🚨"
      primary_action:
        text: "🚨**Recruiting for Fall 2026!!!**🚨"
        url: /join/
      # secondary_action:
      #   text: See our publications
      #   url: /publication/
    design:
      size: none
      background:
        image:
          filename: log_alt.jpg
          filters:
            brightness: 0.5
          position: center
          parallax: true
          text_color_light: false

  - block: markdown
    content:
      title: Welcome to Qμest lab
      text: |

        <p align="center"> 
        <img src="/media/icon.png?v=F" alt="Quest at Emory shield" width="300">
        </p>

        The Qμest lab is led by [**Dr. J Alex Baecher**](/team/admin/) ([⬇️ *vita*](/files/cv_latex.pdf) or [✉️](mailto:jbaecher@gmail.com)) and found in Emory's Dept. of Environmental Science ([**ENVS**](https://envs.emory.edu/index.html)). We are an applied ecological research group, broadly interested in the processes that determine the distribution of biodiversity in space and time. Our work integrates field studies, laboratory experiments, big data, cutting-edge modeling techniques, and high-performance computing to address questions related to conservation, invasions, disease, and global change. 

      design:
      columns: '1'
      spacing:
        padding: ["0px", "0", "0px", "0"]
      background:
        color: ''
        text_color_light: false 

  - block: markdown
    content:
      title: Opportunities
      text: | 
        **🚨We are currently recruiting!🚨**  
        - Fall 2026: [2-3 undergraduate researchers](/team/undergraduates/)   
        - Fall 2026: [1 postdoctoral research associate](/team/postdoc/)   
        - Spring 2027: [1 PhD student](/team/phd-student/)  

        <p align="center"> 
        <img src="https://www.appily.com/sites/default/files/styles/max_1200/public/images/hero/college/139658_hero.jpg?itok=Kj3V_7i6" alt="Emory's Atlanta Campus" width="500">
        </p>
        
        **Interested?** Take a look at some of our [research projects](/project/) and [publications](/publications/) (seen below). To inquire about opportunities, reach out to Alex [✉️](mailto:jbaecher@gmail.com).
      design:
      columns: '1'
      spacing:
        padding: ["0px", "0", "0px", "0"]
      background:
        color: ''
        text_color_light: false 
     

  - block: collection
    content:
      title: "Current projects" 
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

  - block: collection
    content:
      title: "Publications (since 2024)"
      count: 7
      archive:
        enable: true
        text: "See all publications →"
        link: publication/
      filters:
        folders:
          - publication
    design:
      view: citation
      columns: 1

  - block: collection
    content:
      title: "R sandbox: 📊 Coding Tutorials"
      subtitle: "Data science tutorials and R programming guides"
      count: 3
      archive:
        enable: true
        text: "See all tutorials →"
        link: "post/"
      filters:
        folders:
          - post
    design:
      view: card
      columns: 1

---