
---
title: Spatiotemporal statistics

date: "2024-02-15"

external_link: []

image:
  caption: Mesh for a spatial point-process model using Bayesian INLA SPDE algorithm
  focal_point: Smart

links:
- icon: file-alt
  icon_pack: fas
  name: Baecher et al. STOTEN
  url: https://ecoevorxiv.org/repository/view/9228/

slides: Spatial-modeling

summary: Developing spatial and spatiotemporal models using stochastic partial differential equations

tags:
- INLA
- Bayesian statistics 
- stochasticity
- landscape ecology
- R
- spatial Ecology
- modeling

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""
---

**Spatiotemporal modeling**
Basic generalized linear mixed effects models can account for spatial (and spatiotemporal) autocorrelation using latent Gaussian random fields (GRFs). However, GRFs are computationally intense due to costly covariance functions. Stochastic Partial Differential Equations (SPDE) can be used to minimize the scale of this problem by approximating GRFs with Gaussian Markcov random fields (GMRFs) with a Matern covariance function (Lindgrin et al., 2011; Krainski et al. 2018). This solution has been adopted by the Integrated Nested Laplace Approximation (INLA) software, and has later been implimented in Template Model Builder (TMB) software (Thorson et al., 2015).  