---
title: Citizen Science for Monitoring Birds

date: "2025-08-01"

external_link: []

image:
  caption: Novel Bayesian Integrated Population Models
  focal_point: Smart
  
featured: true  

links:
# - icon: code
#   icon_pack: fa
#   name: Modeling tutorial
#   url: https://www.alexbaecher.com/post/connectivity-script/
# - icon: chalkboard
#   icon_pack: fa
#   name: Invasion modeling talk
#   url: https://www.alexbaecher.com/talk/iale_talk/
# - icon: chalkboard
#   icon_pack: fa
#   name: Global connectivity talk
#   url: https://www.alexbaecher.com/talk/sotm_talk/
# - icon: chalkboard
#   icon_pack: fa
#   name: Landscape connectivity lecture
#   url: https://www.alexbaecher.com/talk/ecol_cc/
# - icon: wrench
#   icon_pack: fa
#   name: SAMC workshop 1
#   url: https://www.alexbaecher.com/talk/samc_iale/
# - icon: wrench
#   icon_pack: fa
#   name: SAMC workshop 2
#   url: https://www.alexbaecher.com/talk/samc_sotm/
  
slides: Bird IPMs 

summary: Developing novel spatiotemporal population dynamic models to detect range shifts

tags:
- Integrated Population Models
- Biodiversity Redistribution
- Remote sensing
- modeling

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""
---

<img src="/media/birds_western.jpg" alt="Citizen science data for high priority migratory birds in the western US"/>

## 1. Overview

This document translates the NIMBLE implementation into a fully annotated mathematical model. The model has three components:

1.  **Process model** — a latent, spatially and temporally varying true abundance $N_{i,t}$ for each spatial cell $i = 1,\dots,n_{\text{cells}}$ and time step $t = 1,\dots,n_{\text{time}}$, governed by an occupancy gate, a spatial Gaussian Predictive Process (GPP) for both baseline abundance and growth rate, and a shared annual growth pulse.
2.  **Three observation submodels** — one per dataset (EBD, BBS, BCR), each with its own detection process linking the latent truth $N_{i,t}$ to the observed counts.
3.  **Priors and initial values** — used to complete the Bayesian specification and to start the MCMC chains in a numerically stable region.

Notation: lower-case Roman/Greek letters are scalars or vectors; bracketed subscripts index cells $i$, time steps $t$, knots $k$, observations $n$/$k$, routes $r$, observers $o$, localities $l$, distance bands $d$, and removal intervals $r$ (BCR-specific, reused below since it never overlaps with route $r$). $\mathrm{N}(\mu,\sigma)$ denotes a normal distribution parameterized by its **standard deviation** (matching NIMBLE's `sd=` convention), not variance.

## 2. Process Model: Latent Abundance Surface

### 2.1 Occupancy gate

Each spatial cell has a binary occupancy state:

$$z_i \sim \text{Bernoulli}(\zeta), \qquad \zeta \sim \text{Uniform}(0,1)$$

If $z_i = 0$, the cell is treated as structurally unoccupied and abundance collapses to a small numerical floor ($0.1$) rather than exactly zero, which keeps the Poisson rate strictly positive and avoids degenerate likelihood evaluations.

### 2.2 Initial abundance ($t=1$)

$$\lambda_{0,i} = \exp\!\big(\beta_{\lambda 0} + s_{\lambda,i}\big)$$

$$N_{i,1} \sim \text{Poisson}\!\Big(\lambda_{0,i}\, z_i + 0.1\,(1-z_i)\Big)$$

Here $\beta_{\lambda 0}$ is a global intercept on the log scale and $s_{\lambda,i}$ is the spatial deviation for cell $i$ described in Section 3. Occupied cells get a Poisson draw centered on the spatially-varying expected abundance; unoccupied cells get a near-zero floor.

### 2.3 Cell-specific long-run growth rate

$$\rho_i = \exp\!\big(\beta_\rho + s_{\rho,i}\big)$$

$\beta_\rho$ is the global log-growth intercept and $s_{\rho,i}$ is a second, independently estimated spatial field (Section 3) that captures spatially structured tendencies in population trend:

- \$s\_{\rho,i} \> 0 \Rightarrow \rho\_i \> \$ overall average growth → candidate **leading edge** (range expansion)
- \$s\_{\rho,i} \< 0 \Rightarrow \rho\_i \< \$ overall average growth → candidate **trailing edge** (range contraction)

### 2.4 Dynamics for $t = 2,\dots,n_{\text{time}}$

$$N_{i,t} \sim \text{Poisson}\!\Big(N_{i,t-1}\,\rho_i\,\exp(\eta_t)\, z_i + 0.1\,(1-z_i)\Big)$$

This is a **separable space–time growth model**: the realized growth multiplier at cell $i$, time $t$ is the product of

$$\underbrace{\rho_i}_{\text{cell-specific, time-invariant}} \times \underbrace{\exp(\eta_t)}_{\text{shared annual pulse, space-invariant}}$$

where $\eta_t$ is the year-level random effect described in Section 4. There is deliberately **no space-by-time interaction term** — a given year's "good" or "bad" conditions ($\eta_t$) are assumed to act multiplicatively in the same direction everywhere, while persistent spatial gradients in growth ($\rho_i$) are fixed across years. This is a strong simplifying assumption worth stating explicitly when presenting the model: it rules out scenarios where, say, the leading edge booms in a year that the core declines.

## 3. Spatial Fields: Gaussian Predictive Process (GPP)

Estimating an independent spatial random effect at every one of $n_{\text{cells}}$ grid cells is computationally prohibitive for MCMC. The model instead uses a **reduced-rank Gaussian Predictive Process**: latent effects are estimated at a small set of $K = n_{\text{knots}}$ representative "knot" locations, and the value at any cell is obtained by a distance-weighted (kernel) interpolation from the knots. This is done independently for two latent surfaces — abundance ($\lambda$) and growth ($\rho$) — which happen to share the same spatial range parameter.

### 3.1 Knot-level effects

$$w_{\lambda,k} \sim \text{N}\big(0,\ \sqrt{\sigma^2_\lambda}\big), \qquad
w_{\rho,k} \sim \text{N}\big(0,\ \sqrt{\sigma^2_\rho}\big), \qquad k = 1,\dots,K$$

$$\sigma^2_\lambda \sim \text{InvGamma}(2,1), \qquad \sigma^2_\rho \sim \text{InvGamma}(2,1)$$

These are i.i.d. across knots — all of the spatial smoothness comes from the kernel projection below, not from any correlation structure imposed directly on the $w$'s.

### 3.2 Kernel weights and shared range parameter

For every cell–knot pair, a weight decays exponentially with the pre-computed Euclidean (or geodesic) distance $d_{i,k}$:

$$\omega^{(\lambda)}_{i,k} = \omega^{(\rho)}_{i,k} = \exp\!\left(-\frac{d_{i,k}}{\phi_s}\right), \qquad \phi_s \sim \text{Uniform}(0,\,10^6)$$

The single shared range parameter $\phi_s$ encodes the assumption that **abundance and growth-rate covary at the same spatial scale** — i.e., whatever distance over which abundance is spatially autocorrelated is also the distance over which growth tendency is autocorrelated. Although the weight formulas are identical for $\lambda$ and $\rho$ (since $\phi_s$ is shared), they are tracked as separate quantities in the code for clarity and to allow future relaxation of this assumption (e.g., giving each field its own range parameter).

### 3.3 Normalized inverse-distance projection

The spatial deviation at each cell is a normalized, weighted average of the knot effects (inverse-distance weighting, IDW):

$$s_{\lambda,i} = \frac{\sum_{k=1}^{K} \omega^{(\lambda)}_{i,k}\, w_{\lambda,k}}{\sum_{k=1}^{K} \omega^{(\lambda)}_{i,k}},
\qquad
s_{\rho,i} = \frac{\sum_{k=1}^{K} \omega^{(\rho)}_{i,k}\, w_{\rho,k}}{\sum_{k=1}^{K} \omega^{(\rho)}_{i,k}}$$

Because this is defined for **every** cell $i = 1,\dots,n_{\text{cells}}$ — sampled and unsampled alike — predictions to range cells with no direct survey coverage emerge automatically as a byproduct of fitting the model; no separate prediction step is required.

## 4. Temporal Random Effects

Three independent year-level random walks (technically, independent zero-mean normal deviates per year, not a true random walk) absorb temporal structure that is *not* attributable to the spatial growth surface:

**Shared annual growth pulse** (process model; Section 2.4), defined for $t=2,\dots,n_{\text{time}}$ since $t=1$ is the initial condition:

$$\eta_t \sim \text{N}(0,\ \sigma_\eta), \qquad \sigma_\eta \sim \text{Gamma}(2,10)$$

**EBD annual detection effect** (absorbs eBird's well-documented growth in participation/effort over time, keeping it out of the abundance trend):

$$\delta^{\text{ebd}}_t \sim \text{N}(0,\ \sigma_{\delta,\text{ebd}}), \qquad \sigma_{\delta,\text{ebd}} \sim \text{Gamma}(2,10)$$

**BBS annual detection effect** (absorbs annual protocol/effort variation in BBS):

$$\delta^{\text{bbs}}_t \sim \text{N}(0,\ \sigma_{\delta,\text{bbs}}), \qquad \sigma_{\delta,\text{bbs}} \sim \text{Gamma}(2,10)$$

All three are defined for $t = 1,\dots,n_{\text{time}}$ except $\eta_t$, which starts at $t=2$. The $\text{Gamma}(2,10)$ prior on each standard deviation is weakly informative and keeps the year effects from running away to implausible magnitudes while still allowing real temporal signal to be detected.

## 5. Observation Submodel 1: Breeding Bird Survey (BBS)

BBS data consist of repeated stop-level counts along fixed roadside transects, repeated annually. Detection is allowed to vary by route, observer, position along the route (stop), whether the route is newly added, and year.

### 5.1 Random effects

$$\chi^{\text{route}}_r \sim \text{N}(0,\ \sigma_{\chi,\text{route}}), \quad r = 1,\dots,n_{\text{route}}$$

$$\chi^{\text{obs}}_o \sim \text{N}(0,\ \sigma_{\chi,\text{obs}}), \quad o = 1,\dots,n_{\text{obser}}^{\text{bbs}}$$

with $\sigma_{\chi,\text{route}}, \sigma_{\chi,\text{obs}} \sim \text{Gamma}(0.01, 0.01)$ — a diffuse, near-noninformative prior on each variance component.

### 5.2 Stop-position effect

Detectability is allowed to trend smoothly across the five stops within a route (`bbs_stops` rescaled to $[-2,2]$):

$$\sigma_{\chi}(s) = \exp\!\big(\chi^{(1)}_{\text{stop}} + \chi^{(2)}_{\text{stop}}\cdot \text{stop}_s\big), \qquad s = 1,\dots,n_{\text{stop}}$$

with priors $\chi^{(1)}_{\text{stop}} \sim \text{N}(0,10)$ and $\chi^{(2)}_{\text{stop}} \sim \text{N}(0,10)$ truncated to be non-negative ($\chi^{(2)}_{\text{stop}} \ge 0$). This is a **dispersion** parameter (it scales the standard deviation of a downstream normal, not a mean), so forcing it non-negative is a sensible identifiability constraint that prevents the implied stop-level variance from decreasing with stop number in an uninterpretable way... more precisely, it constrains the *direction* of the trend in dispersion across stops to be monotonic in a single, identifiable direction.

### 5.3 Linear predictor for mean log-detection rate

For each BBS observation $n = 1,\dots,n_{\text{obs}}^{\text{bbs}}$ (a route-by-year combination):

$$\mu^{\chi}_n = \chi_\mu + \chi^{\text{route}}_{r[n]} + \chi^{\text{obs}}_{o[n]} + \chi_{\text{new}}\cdot \text{new}_n + \delta^{\text{bbs}}_{t[n]}$$

with priors $\chi_\mu \sim \text{N}(0,10)$ (global intercept) and $\chi_{\text{new}} \sim \text{N}(0,10)$ (adjustment for newly-established BBS routes, which often show atypical early-year detection).

### 5.4 Stop-level detection rate and likelihood

$$\log \chi_{n,s} \sim \text{N}\big(\mu^{\chi}_n,\ \sigma_\chi(s)\big), \qquad \chi_{n,s} = \exp(\log \chi_{n,s})$$

$$y^{\text{bbs}}_{n,s} \sim \text{Poisson}\Big(N_{i[n],\,t[n]}\cdot \chi_{n,s}\Big)$$

Note the extra layer of randomness here: rather than treating $\chi_{n,s}$ as a deterministic function of the linear predictor, the model draws $\log \chi_{n,s}$ from a normal distribution *centered on* the linear predictor, with stop-specific dispersion $\sigma_\chi(s)$. This over-dispersion term absorbs stop-to-stop variability in detectability beyond what the fixed/random effects capture, and is itself estimated as a free parameter per observation–stop combination (`log_chi` is an $n_{\text{obs}}^{\text{bbs}} \times n_{\text{stop}}$ matrix of latent parameters).

## 6. Observation Submodel 2: eBird (EBD)

EBD is opportunistic, citizen-science data: stationary or traveling counts submitted voluntarily, with highly variable effort. The model uses a **zero-inflated Poisson** to separate "the species was present but the count reflects effort/detectability" from "the species was structurally absent from this particular checklist's conditions" (e.g., off-habitat point within a coarse grid cell).

### 6.1 Nested random effects (cell → locality)

$$\omega^{\text{cell}}_c \sim \text{N}(0,\ \sigma_{\omega,\text{cell}}), \quad c = 1,\dots,n_{\text{cells}}, \qquad \sigma_{\omega,\text{cell}} \sim \text{Gamma}(0.01,0.01)$$

$$\omega^{\text{locality}}_l \sim \text{N}\big(\omega^{\text{cell}}_{c[l]},\ \sigma_{\omega,\text{loc}}\big), \quad l = 1,\dots,n_{\text{localities}}, \qquad \sigma_{\omega,\text{loc}} \sim \text{Gamma}(0.01,0.01)$$

$$\omega^{\text{obs}}_o \sim \text{N}(0,\ \sigma_{\omega,\text{obs}}), \quad o = 1,\dots,n_{\text{obser}}^{\text{ebd}}, \qquad \sigma_{\omega,\text{obs}} \sim \text{Gamma}(0.01,0.01)$$

The locality effect is centered on its parent cell's effect rather than on zero — this is a genuine hierarchical (nested) structure, distinct from the independent route/observer effects in the BBS submodel. It reflects that eBird checklists at specific localities within a grid cell should detect similarly to the cell average, with locality-specific deviations layered on top.

### 6.2 Linear predictor for expected detection-scaled count

$$\omega_k = \exp\Big(
\omega^{(1)} + \omega^{(2)} \cdot \text{duration}_k + \omega^{(3)} \cdot \text{nobservers}_k
+ \omega^{\text{cell}}_{c[k]} + \omega^{\text{locality}}_{l[k]} + \omega^{\text{obs}}_{o[k]} + \delta^{\text{ebd}}_{t[k]}
\Big)$$

for each checklist $k = 1,\dots,n_{\text{obs}}^{\text{ebd}}$, with $\boldsymbol{\omega}^{(1:3)} \sim \text{N}(0,10)$ (intercept, duration effect, party-size effect).

### 6.3 Zero-inflation and likelihood

$$z^\omega_k \sim \text{Bernoulli}(\zeta_\omega), \qquad \zeta_\omega \sim \text{Uniform}(0,1)$$

$$y^{\text{ebd}}_k \sim \text{Poisson}\Big(N_{c[k],\,t[k]}\cdot \omega_k \cdot z^\omega_k + \delta_\omega\,(1-z^\omega_k)\Big), \qquad \delta_\omega \sim \text{Gamma}(0.01,0.01)$$

When $z^\omega_k = 1$ (the "structural presence" state), the expected count scales with true abundance $N$ and the detection multiplier $\omega_k$ as in a standard N-mixture model. When $z^\omega_k = 0$, the expected count collapses to a small residual rate $\delta_\omega$, representing checklists where the species was effectively unavailable for detection regardless of $N$. Note this is a **second, independent** zero-inflation/occupancy process from $z_i$ in the process model — $\zeta_\omega$ operates at the checklist level on detectability, while $\zeta$ in Section 2.1 operates at the cell level on true presence.

## 7. Observation Submodel 3: IMBCR (BCR) — Distance + Removal Sampling

BCR surveys combine **distance sampling** (birds detected within concentric distance bands) and **time-removal sampling** (birds detected within sequential time intervals), giving a two-dimensional detection process.

### 7.1 Distance-sampling component (half-normal detection function)

With $n_{\text{dist}}=2$ pre-defined distance bands (0–125 m, 125–250 m; bounds passed in as constants `bcr_low`/`bcr_high` to avoid an off-by-one indexing issue in NIMBLE) and truncation radius $w = 250$ m:

$$\text{intval}(d) = \sigma^2\left[\exp\!\left(-\frac{\text{low}_d^2}{2\sigma^2}\right) - \exp\!\left(-\frac{\text{high}_d^2}{2\sigma^2}\right)\right]$$

$$\psi_d = \frac{2\,\text{intval}(d)}{w^2}, \qquad \psi_{\text{sum}} = \sum_{d=1}^{n_{\text{dist}}}\psi_d, \qquad \psi_d^{\text{prop}} = \frac{\psi_d}{\psi_{\text{sum}}}$$

with $\sigma \sim \text{Uniform}(10,500)$, the half-normal scale parameter governing how quickly detectability decays with distance. (The model deliberately uses a $\text{Uniform}$ rather than a vague Gamma prior here, since a $\text{Gamma}(0.01,0.01)$ would place near-zero prior density around plausible values of $\sigma$ such as 60.) $\psi_{\text{sum}}$ is the overall probability that an individual within the truncation radius is detected *at all* (integrated over distance), and $\psi_d^{\text{prop}}$ is the *conditional* probability of being detected in band $d$ given detection at all.

### 7.2 Removal-sampling component (geometric distribution)

With $n_{\text{time}}^{\text{bcr}} = 6$ removal intervals:

$$\phi_r = (1-\theta)^{\,r-1}\,\theta, \qquad \phi_{\text{sum}} = \sum_{r=1}^{6}\phi_r, \qquad \phi_r^{\text{prop}} = \frac{\phi_r}{\phi_{\text{sum}}}$$

with $\theta \sim \text{Uniform}(0,1)$, the per-interval probability of first detection (a standard geometric/removal model: an individual not yet detected in intervals $1,\dots,r-1$ is detected in interval $r$ with probability $\theta$). $\phi_{\text{sum}}$ would be the cumulative probability of eventual detection across all 6 intervals; $\phi_r^{\text{prop}}$ renormalizes to a proper conditional distribution over intervals given eventual detection.

### 7.3 Joint cell probabilities

Assuming distance and removal-time are independent detection axes, the joint probability of observation in distance band $d$ and removal interval $r$, conditional on detection, is the product:

$$\pi_{(r-1)\cdot n_{\text{dist}} + d} = \psi_d^{\text{prop}} \cdot \phi_r^{\text{prop}}$$

(indexed in distance-major order to match the flattened `bcr_cnt` matrix in code).

### 7.4 Likelihood: binomial detection + multinomial allocation

For each BCR point count $k = 1,\dots,n_{\text{obs}}^{\text{bcr}}$:

$$S_k \sim \text{Binomial}\big(\psi_{\text{sum}},\ N_{i[k],\,t[k]}\big)$$

$$\big(y^{\text{bcr}}_{k,1},\dots,y^{\text{bcr}}_{k,12}\big) \sim \text{Multinomial}\big(\boldsymbol\pi,\ S_k\big)$$

This two-stage construction is the standard way to combine distance and removal/time-of-detection sampling: $S_k$ is the *total number of the* $N$ individuals present that were detected at all (governed purely by the distance-sampling detection probability $\psi_{\text{sum}}$), and the multinomial then allocates those $S_k$ detections across the $2 \times 6 = 12$ distance-by-time cells according to the joint detection profile $\boldsymbol\pi$. Note that $\phi_{\text{sum}}$ (cumulative removal-detection probability) is **not** used directly in the binomial step — the removal/time component is fully conditional on having already been detected (distance-wise) and enters only through the multinomial allocation, not as a second independent detection filter on $N$.

## 8. Summary of Parameters and Priors

| Parameter | Role | Prior |
|----|----|----|
| $\zeta$ | cell occupancy probability | $\text{Unif}(0,1)$ |
| $\beta_{\lambda0}$ | log-abundance intercept | $\text{N}(0,10)$ |
| $\beta_\rho$ | log-growth intercept | $\text{N}(0,10)$ |
| $\phi_s$ | shared spatial range | $\text{Unif}(0,10^6)$ |
| $\sigma^2_\lambda,\ \sigma^2_\rho$ | spatial field variances | $\text{InvGamma}(2,1)$ |
| $w_{\lambda,k},\ w_{\rho,k}$ | knot-level spatial effects | $\text{N}(0,\sqrt{\sigma^2_\cdot})$ |
| $\sigma_\eta$ | SD of annual growth pulse | $\text{Gamma}(2,10)$ |
| $\eta_t$ | annual growth pulse | $\text{N}(0,\sigma_\eta)$ |
| $\sigma_{\delta,\text{ebd}},\ \sigma_{\delta,\text{bbs}}$ | SD of annual detection effects | $\text{Gamma}(2,10)$ |
| $\delta^{\text{ebd}}_t,\ \delta^{\text{bbs}}_t$ | annual detection effects | $\text{N}(0,\sigma_{\delta,\cdot})$ |
| $\chi_\mu,\ \chi_{\text{new}}$ | BBS detection intercept, new-route effect | $\text{N}(0,10)$ |
| $\sigma_{\chi,\text{route}},\ \sigma_{\chi,\text{obs}}$ | BBS route/observer SDs | $\text{Gamma}(0.01,0.01)$ |
| $\chi^{(1)}_{\text{stop}},\ \chi^{(2)}_{\text{stop}}$ | stop-position dispersion coefficients | $\text{N}(0,10)$; $\chi^{(2)} \ge 0$ |
| $\omega^{(1:3)}$ | EBD detection intercept, duration, party-size effects | $\text{N}(0,10)$ |
| $\sigma_{\omega,\text{cell}},\sigma_{\omega,\text{loc}},\sigma_{\omega,\text{obs}}$ | EBD variance components | $\text{Gamma}(0.01,0.01)$ |
| $\zeta_\omega$ | EBD zero-inflation probability | $\text{Unif}(0,1)$ |
| $\delta_\omega$ | EBD residual rate when "absent" | $\text{Gamma}(0.01,0.01)$ |
| $\sigma$ | BCR half-normal distance scale | $\text{Unif}(10,500)$ |
| $\theta$ | BCR per-interval removal probability | $\text{Unif}(0,1)$ |

## 9. Initial Values: Rationale

### 9.1 Latent abundance $N_{i,t}$ and occupancy $z_i$

Initial values for $N$ are constructed empirically rather than drawn from the prior, which is standard practice for discrete/count latent states in MCMC — a poor starting value (especially one below the observed count) can cause an immediate likelihood violation (zero density) and prevent the sampler from ever moving.

The construction:

1.  For every cell $\times$ year combination, sum observed counts across all three datasets (eBird sightings, BBS stop totals, BCR multinomial totals).
2.  **Inflate the BCR contribution** by the estimated overall detection probability $\hat\psi_{\text{sum}} \approx 0.115$: $\text{BCR}_{\text{implied}} = \lceil \text{BCR}_{\text{raw}} / 0.115 \rceil + 5$, since BCR is the only one of the three datasets with an explicit, well-calibrated absolute detection-probability estimate, making it the most reliable basis for back-calculating a plausible true abundance.
3.  Take the cell/year total as $\max(\text{summed raw counts},\ \text{BCR-implied count})$.
4.  Add a buffer of $5$ and floor at $5$: $N_{i,1}^{\text{init}} = \max(\text{total}+5,\ 5)$.

This guarantees $N_{i,t}^{\text{init}} \ge$ every observed count at every cell/time combination (avoiding "negative binomial-type" violations where a Poisson/Binomial observation model is asked to explain more detections than the assumed population size), while still being a finite, well-scaled starting point rather than an arbitrarily huge value that would slow burn-in.

Occupancy is initialized deterministically from the same matrix:

$$z_i^{\text{init}} = \begin{cases} 0 & \text{if } \sum_t N_{i,t}^{\text{init}} = 0 \\ 1 & \text{otherwise} \end{cases}$$

### 9.2 Spatial fields

Knot-level effects start at the flat-field null: $w_{\lambda,k}^{\text{init}} = w_{\rho,k}^{\text{init}} = 0$ for all $k$, with $\sigma^2_{\lambda},\sigma^2_\rho$ both initialized at $0.5$. The shared range parameter $\phi_s$ is initialized at roughly one-third of the spatial domain's extent (a typical rule-of-thumb starting value for spatial range parameters, large enough to let the sampler explore both short- and long-range solutions without immediately collapsing to near-zero or near-infinite range).

### 9.3 Temporal and detection random effects

All year-level random effects ($\eta_t$, $\delta^{\text{ebd}}_t$, $\delta^{\text{bbs}}_t$) and their SD hyperparameters start at $0$ and $0.1$ respectively — a minimal-signal starting point that lets the data pull the chain toward whatever temporal structure is actually supported.

### 9.4 Observation-model initial values

- **BBS**: $\chi_\mu^{\text{init}} = -5$ (a small baseline detection rate on the log scale), route/observer random effects at $0$, stop-dispersion intercept/slope at $(-1, 0.1)$, and the full latent `log_chi` matrix initialized at $-5$ everywhere — a conservative, low-detection-rate starting surface that is then refined by the data.
- **EBD**: detection intercept $-6$ with small positive effort coefficients $(0.5, 0)$; zero-inflation indicators $\omega_{z,k}^{\text{init}}$ set deterministically from the data ($1$ if the observed count was $>0$, $0$ otherwise) — again a data-informed start that avoids contradicting the observed counts at $t=0$ of the chain.
- **BCR**: $\sigma^{\text{init}} = 60$ m (a biologically plausible half-normal scale for a passerine point count) and $\theta^{\text{init}} = 0.4$ (a moderate per-interval removal probability).