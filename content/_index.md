---
title: "Quest Lab"
type: landing
date: 2026-03-25
draft: false

sections:

  - block: hero
    content:
      title: | 
        <img src='media/quest_lab_emory.png?v=F'>
      text: The Baecher lab at Emory's Dept. of Environmental Science
        
      primary_action:
        text: See our projects
        url: /project/
      secondary_action:
        text: See our publications
        url: /publication/
      announcement:
        text: "🚨 **Recruiting for Fall 2026!!!** 🚨: Postdoc in Quantitative Ecology and Data Science"
        link:
          text: ""
          url: /people/
    design:
      background:
        image:
          filename: log_alt.jpg
          filters:
            brightness: 0.5
          size: cover
          position: center
          parallax: true
          text_color_light: false

  - block: markdown
    content:
      title: Welcome to the Quest lab
      text: |

        <img src="/media/emory_shield.png" alt="Quest at Emory shield">

        We are an applied quantitative ecology laboratory, broadly interested in the processes that determine the distribution of biodiversity in space and time. Our research integrates field studies, laboratory experiments, big data, cutting-edge modeling techniques, and high-performance computing to address fundamental questions related to species conservation, biological invasions, and climate-induced species range shifts, and disease transmission. 
        
        **🚨Quest Lab is recruiting🚨**  
        - Fall 2026: [2-3 undergraduate researchers](/people/)   
        - Fall 2026: [1 postdoctoral research associate](/people/)   
        - Spring 2027: [1 PhD student](/people/)   
        
        **Interested?** Take a look at some of our research projects and publications below. To inquire about opportunities, reach out to [Dr. J Alex Baecher](mailto:jbaecher@gmail.com).

        Download Dr. Baecher's [**CV**⬇](https://drive.google.com/uc?export=download&id=1-xLrp1uO7jwEhQcJn3OhvmD7Xa7ssZi0) (updated 4/10/2026) 


      design:
      columns: '2'
      spacing:
        padding: ["0px", "0", "0px", "0"]
      background:
        color: ''
        text_color_light: false 
     

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
      columns: 2

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
      columns: 2

---