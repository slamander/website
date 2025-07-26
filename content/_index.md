---
title: "Baecher Research"
type: landing
date: 2025-01-25
draft: false

sections:
  - block: markdown
    content:
      text: |
        <div class="custom-banner" style="
          background-image: url('/media/log_extended_resized.png');
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
          height: calc(100vw * 534 / 3008);
          max-height: 250px;
          min-height: 120px;
          position: relative;
          display: flex;
          align-items: center;
          overflow: hidden;
          margin: 0;
          padding: 0 2rem;
        ">
          <!-- Dark overlay for text readability -->
          <div style="
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
          "></div>
          
          <!-- Left side: Title and text -->
          <div style="
            flex: 1;
            z-index: 2;
            color: white;
            text-align: left;
          ">
            <h1 style="
              font-size: 2.5rem;
              font-weight: bold;
              margin: 0 0 0.5rem 0;
              line-height: 1.2;
            ">Baecher Research</h1>
            <p style="
              font-size: 1.2rem;
              margin: 0 0 1rem 0;
              opacity: 0.9;
            ">Spatial ecology and conservation research</p>
            <a href="https://drive.google.com/file/d/1zADCDlIiJlx1vXKQ6NdMLwTZm7E6sS29/view?usp=sharing" 
               style="
                 display: inline-flex;
                 align-items: center;
                 background: #007bff;
                 color: white;
                 padding: 0.75rem 1.5rem;
                 text-decoration: none;
                 border-radius: 0.5rem;
                 font-weight: 600;
                 transition: background-color 0.3s;
               "
               onmouseover="this.style.backgroundColor='#0056b3'"
               onmouseout="this.style.backgroundColor='#007bff'">
              <svg style="width: 1rem; height: 1rem; margin-right: 0.5rem;" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"></path>
              </svg>
              Download CV
            </a>
          </div>
          
          <!-- Right side: Badge -->
          <div style="
            z-index: 2;
            margin-left: 2rem;
          ">
            <img src="/media/badge_kentucki.png" 
                 alt="Badge" 
                 style="
                   height: 80px;
                   width: auto;
                   max-width: 150px;
                 ">
          </div>
        </div>
        
        <!-- Responsive CSS -->
        <style>
        @media (max-width: 768px) {
          .custom-banner {
            height: calc(100vw * 0.25) !important;
            max-height: 180px !important;
            padding: 0 1rem !important;
            flex-direction: column !important;
            justify-content: center !important;
            text-align: center !important;
          }
          
          .custom-banner h1 {
            font-size: 1.8rem !important;
            text-align: center !important;
          }
          
          .custom-banner p {
            font-size: 1rem !important;
            text-align: center !important;
          }
          
          .custom-banner > div:first-of-type {
            text-align: center !important;
            margin-bottom: 1rem !important;
          }
          
          .custom-banner > div:last-of-type {
            margin-left: 0 !important;
          }
          
          .custom-banner img {
            height: 50px !important;
          }
        }
        
        @media (max-width: 480px) {
          .custom-banner {
            height: calc(100vw * 0.3) !important;
            max-height: 140px !important;
          }
          
          .custom-banner h1 {
            font-size: 1.4rem !important;
          }
          
          .custom-banner p {
            font-size: 0.9rem !important;
          }
          
          .custom-banner img {
            height: 40px !important;
          }
        }
        </style>
    design:
      background:
        color: transparent
      spacing:
        padding: ["0px", "0px", "0px", "0px"]

  - block: markdown
    content:
      title: ""
      text: |
        <div class="flex flex-wrap gap-4 justify-center mt-4">
          <a href="mailto:jbaecher@gmail.com" class="inline-flex items-center px-3 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
              <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
            </svg>
            Email
          </a>
          
          <a href="https://twitter.com/AlexBaecher" class="inline-flex items-center px-3 py-2 bg-blue-400 text-white rounded hover:bg-blue-500">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 24 24">
              <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
            </svg>
            Twitter
          </a>
          
          <a href="https://scholar.google.com/citations?user=zl3lDnEAAAAJ&hl=en" class="inline-flex items-center px-3 py-2 bg-red-500 text-white rounded hover:bg-red-600">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 24 24">
              <path d="M5.242 13.769L0 9.5 12 0l12 9.5-5.242 4.269C17.548 11.249 14.978 9.5 12 9.5c-2.977 0-5.548 1.748-6.758 4.269zM12 10a7 7 0 100 14 7 7 0 000-14z"/>
            </svg>
            Google Scholar
          </a>
          
          <a href="https://github.com/slamander" class="inline-flex items-center px-3 py-2 bg-gray-800 text-white rounded hover:bg-gray-900">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
            </svg>
            GitHub
          </a>
        </div>
    design:
      columns: '1'
      spacing:
        padding: ["20px", "50px", "10px", "50px"]

  - block: markdown
    content:
      title: "About me"
      text: |
        **The good bits:**
        Native to the foothills of Arkansas' Ozark Mountains. My life consists of... my wife (Kristin), my daughter (Faye), my dog (Ollie), herping, hiking, swimming and canoeing, woodworking, and home DIY projects.

        **The serious bits:**
        I am a spacial ecologist, with interest in research at the interface between conservation, ecological theory, and mathematical modeling. I primarily work with reptiles and amphibians, but am interested in the processes determining the distribution of biodiversity more broadly.

        **Current Position:** Postdoctoral Research Fellow at Utah State University

  - block: markdown
    content:
      title: "Experience"
      text: |
        **Postdoctoral Research Fellow** | Utah State University (2025-present)  
        *Wolf-Clark & Stuber Labs @ USU/USGS coop*        
        
        **Postdoctoral Research Associate** | University of Florida (2024-present)  
        *Guralnick Lab @ Florida Natural History Museum & Campbell Lab @ UF/IFAS*
        
        **Doctoral Preeminence Research Fellow (Ph.D.)** | University of Florida (2019-2024)  
        *Scheffers Lab @ Dept. of Wildlife Ecology and Conservation*
        
        **Conservation and Research Technician** | Memphis Zoo (2018-2019)  
        *Dept. Conservation and Research*
        
        **Graduate Teaching Assistant (M.Sc.)** | Eastern Kentucky University (2015-2017)  
        *Richter lab @ Dept. Biology*
        
        **Research Technician (B.Sc.)** | University of Arkansas (2011-2014)  
        *UArk Dept. Biology*
    design:
      columns: '1'
      spacing:
        padding: ["10px", "0", "10px", "0"]

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