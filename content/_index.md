---
title: Qμest Lab
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
        text: "🚨**Recruiting students and postdoc for Fall 2026!!!**🚨"
        link:
          text: "see open positions"
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
          text_color_light: true

  - block: markdown
    content:
      title: Welcome to the Qμest lab
      text: |

        <p align="center"> 
        <img src="/media/emory_shield.png" alt="Quest at Emory shield" width="500">
        </p>

        The Qμest lab is led by [**Dr. J Alex Baecher**](/team/admin/) ([⬇️ **CV**](/files/cv_latex.pdf)). We are an applied ecological research group, broadly interested in the processes that determine the distribution of biodiversity in space and time. Our work integrates field studies, laboratory experiments, big data, cutting-edge modeling techniques, and high-performance computing to address questions related to conservation, invasions, disease, and global change. 

      design:
      columns: '2'
      spacing:
        padding: ["0px", "0", "0px", "0"]
      background:
        color: ''
        text_color_light: false 

  - block: markdown
    content:
      title: Common lab themes
      text: | 
        | <p align="center"> <img src="https://images.phylopic.org/images/36fd55bb-9078-4b60-9b8b-2cd8f7484cf3/raster/1024x951.png?v=19125a7156d" width="100"> </p> | <p align="center"> <img src="https://png.pngtree.com/png-clipart/20230411/original/pngtree-cluster-computing-line-icon-png-image_9044688.png" width="150"> </p> | <p align="center"> <img src="https://thumbs.dreamstime.com/b/dna-helix-icon-bioinformatics-network-nodes-central-gear-hub-black-glyph-silhouette-white-genetics-data-analysis-440402449.jpg?w=768" width="150"> </p> |
        | :---: | :---: | :---: |
        | **Natural <br> History** | **Performance <br> Computing** | **Biodiversity <br> Informatics** |

        | <p align="center"> <img src="https://static.thenounproject.com/png/statistical-model-icon-6380994-512.png" width="150"> </p> | <p align="center"> <img src="https://static.thenounproject.com/png/1631026-200.png" width="125"> </p> | <p align="center"> <img src="https://img.magnific.com/free-vector/earth-with-leaf-cycle-black_78370-7973.jpg?semt=ais_hybrid&w=740&q=80" width="150"> </p> |
        | :---: | :---: | :---: |
        | **Ecological <br> Modeling** | **Spatial <br> Statistics** | **Biodiversity <br> Conservation** |
      design:
      columns: '2'
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
        
        **Interested?** Take a look at some of our [research projects](/project/) and [publications](/publications/) (seen below). To inquire about opportunities, reach out to Alex [✉️](mailto:jbaecher@gmail.com).
      design:
      columns: '2'
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