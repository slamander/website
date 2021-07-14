---
title: "Empirical Dynamic Models for Forecasting"
subtitle: "A tutorial on forcasting with stationary and non-stationary time series"
author: J. Alex Baecher
date: July 31, 2016
output: md_document
slug: EDM script
tags: ["Empirical Dynamic Models", "Machine Learning", "Forecasting", "Time Series"]
categories: ["r tutorials"]
---

Introduction to EDMs for Forecasting Non-stationary data
--------------------------------------------------------

EDMs are a data-driven solution for uncovering hidden dynamic behavior
in natural systems, which are often complex and dynamic (referred to as
“non-stationarity” or “non-linearity”). This non-linearity means that
the sign and magnitude of relationships within a system change with
time, and therefore linear statistical approaches fail to properly
represent such changes. Rather than assuming that the system is governed
by any set of equations (i.e. unlike meteorological systems), EDMs
reconstruct the dynamics of the system from time series data (hence
“data-driven”) and provide a mechanistic understanding of the system.
Under EDMs, the dynamics of a system are encoded in the temporal
ordering of the time series, and the behavior of such a system can be
explained by relating various states of a system using time lags
(i.e. estimating the mathematical relationship of one variable at time
X(t), to the same variable at other times: X(t+1) and X(t+2). By
relating states of a system using such lags, causal relationships
between variables in the original system may be uncovered–providing a
number of ecologically relevant applications, including forecasting.

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/edm.gif" title=" " >}}


To reiterate, EDMs are driven by non-linear dynamics in a system (the
relationship of a variable, or state, at various time lags vary in sign
and magnitude). Taken’s theorem–the basis of EDM–states that an original
system’s dynamics can be reconstructed by exploiting the mathematical
relationships between historical records of a single variable. These
relationships can be mapped 1-to-1 using the Lorens Attractor (also
known as the Butterfly attractor).

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/edm2.png" title=" " >}}
Tutorial on forecasting with stationary and non-stationary time series

### Load libraries

    library(astsa)
    library(rEDM)
    library(tidyverse)
    library(forecast)
    library(ggpubr)

### Set time series parameters, where time = hrs and the temporal range is 4 days

    set.seed(1)

    time = 1:96

# Stationary time series

### Simulate autocorrelated timeseries data with stationarity (linear data, with cyclical autocorrelation) using `arima.sim`

#### Arima, or AutoRegressive Integrated Moving Average, models necessarily assume linearity, because they rely on a linear relationship to predict values from one time step to another.

    stationary_y_arima <- arima.sim(n = length(time), list(ar = c(0.9, -0.8), ma = c(-0.41, 0.2)),
                                    sd = sqrt(0.1))

    df_ts <- data.frame(x = time, y = stationary_y_arima)

    autoplot(stationary_y_arima) + ylab("Stationary Time Series")


{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-3-1.png" title=" " >}}

### Visualize autocorrelation structures using the Parial Autocorrelation Function Estimation feature in the `forecast` package (function `acf()`)

    acf(stationary_y_arima)

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-4-1.png" title=" " >}}

    pacf(stationary_y_arima)

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-4-2.png" title=" " >}}

### Partition data into training and predicting subsets:

    train <- 1:(length(time)/2)             # indices for the first 2/3 of the time series

# Arima models for forecasting:

### Run a standard Arima model, with no lag dependencies

#### This model is mathematically identical to a intercept only linear model:

$$\\Large y\_t = c + e\_t$$

#### Where, the intercept is equal to the mean of the response variable:

$$\\Large c = \\frac{1}{n} \\sum\_{i=1}^{n} y\_{i}$$

    a <- Arima(stationary_y_arima[train])

    #plot the fitted values from Arima model
    autoplot(fitted(a), col = "blue") + geom_path(data = df_ts, aes(x = x, y = y)) + ylab("Stationary Time Series")


{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-6-1.png" title=" " >}}

### Perform forecast of prediction data using a no-lag Arima model

    autoplot(forecast(a, h = 48)) + geom_path(data = df_ts, aes(x = x, y = y)) + ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-7-1.png" title=" " >}}

### Autoregressive model, with one time dependency–an hourly lag term:

$$\\Large y\_{t} = c + b\_{1}y\_{t-1} + e\_{t}$$

Where, $\\Large b\_1$ is a coefficient of lag

    a1 <- Arima(stationary_y_arima[train], c(1,0,0))

    #plot the fitted values from Arima model
    autoplot(fitted(a1), col = "blue") + geom_path(data = df_ts, aes(x = x, y = y)) + ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-8-1.png" title=" " >}}

    #plot the forecasted values from Arima model
    autoplot(forecast(a1, h = 48)) + geom_path(data = df_ts, aes(x = x, y = y)) + ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-8-2.png" title=" " >}}

### Autoregressive model, with two hourly lags:

$$\\Large y\_{t} = c + b\_{1}y\_{t-1} + b\_{2}y\_{t-1} + e\_{t}$$

    a2 <- Arima(stationary_y_arima[train], c(1,0,0))

    #plot the fitted values from Arima model
    autoplot(fitted(a2), col = "blue") + geom_path(data = df_ts, aes(x = x, y = y)) + ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-9-1.png" title=" " >}}

    #plot the forecasted values from Arima model
    autoplot(forecast(a2, h = 48)) + geom_path(data = df_ts, aes(x = x, y = y)) + ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-9-2.png" title=" " >}}

#### Autoregressive models, with up to 5 hourly lags:

$$\\Large y\_t = c + b\_1y\_{t-1} + \[...\] + b\_{j}y\_{2-j} + e\_t$$

    a3 <- Arima(stationary_y_arima[train], c(3,0,0))
    a4 <- Arima(stationary_y_arima[train], c(4,0,0))
    a5 <- Arima(stationary_y_arima[train], c(5,0,0))

    a1_gg <- autoplot(forecast(a3, h = 48)) + ggtitle("Arima Model Forecast: 3 hourly lags") +
      geom_path(data = df_ts, aes(x = x, y = y)) + 
      geom_path(aes(x = time[train], y = fitted(a3)[train]), col = "blue") + 
       ylab(" ")

    a2_gg <- autoplot(forecast(a4, h = 48)) + ggtitle("Arima Model Forecast: 4 hourly lags") +
      geom_path(data = df_ts, aes(x = x, y = y)) + 
      geom_path(aes(x = time[train], y = fitted(a4)[train]), col = "blue") + 
       ylab("Stationary Time Series")

    a3_gg <- autoplot(forecast(a5, h = 48)) + ggtitle("Arima Model Forecast: 5 hourly lags") +
      geom_path(data = df_ts, aes(x = x, y = y)) + 
      geom_path(aes(x = time[train], y = fitted(a5)[train]), col = "blue") + 
       ylab(" ")

    ggarrange(a1_gg, a2_gg, a3_gg, ncol = 1)

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-10-1.png" title=" " >}}

### Now, we can move into models with different cycle structures. For this, we will consider half day lags (12 hr periods)

#### Autoregressive models, with an hourly- and half-day-time dependency:

$$\\Large y\_t = c + b\_1y\_{t-1} + b\_2y\_{t-12} + e\_t$$

    a41 <- Arima(stationary_y_arima[train], c(4,0,0), c(1,0,0))

    autoplot(forecast(a41, h = 48)) + ggtitle("Arima Model Forecast: 4 hourly cycle lag") +
      geom_path(data = df_ts, aes(x = x, y = y)) + 
      geom_path(aes(x = time[train], y = fitted(a41)[train]), col = "blue") +
      ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-11-1.png" title=" " >}}

### Now, we will let the Arima algorithm choose the time lag parameters, using `auto.arima`:

    aa <- auto.arima(stationary_y_arima[train])
    summary(aa)

    ## Series: stationary_y_arima[train] 
    ## ARIMA(3,0,0) with zero mean 
    ## 
    ## Coefficients:
    ##          ar1      ar2      ar3
    ##       0.4728  -0.1068  -0.5655
    ## s.e.  0.1272   0.1513   0.1384
    ## 
    ## sigma^2 estimated as 0.08692:  log likelihood=-9.02
    ## AIC=26.04   AICc=26.97   BIC=33.52
    ## 
    ## Training set error measures:
    ##                      ME      RMSE       MAE      MPE     MAPE      MASE
    ## Training set 0.02152847 0.2854554 0.2289932 187.4472 335.9332 0.6855497
    ##                     ACF1
    ## Training set -0.06089878

    # Auto-arima chose a 3-hour lag structure, with no half-day effects

    autoplot(forecast(aa, h = 48)) + geom_path(data = df_ts, aes(x = x, y = y)) + 
      ylab("Stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-12-1.png" title=" " >}}

# Non-stationary time series

### Now we will simulate non-linear (a.k.a. non-stationary) data, where relationships change through time, using `diffinv`:

    ## non-stationary data
    set.seed(44)
    nonstationary_y <- diffinv(rnorm(length(time))) %>% ts()

    autoplot(nonstationary_y) + ylab("Non-stationary Time Series")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-13-1.png" title=" " >}}

### Let’s see what the auto Arima algorithm estimates with non-stationary data:

    aa_ns <- auto.arima(nonstationary_y[train])

    summary(aa_ns)

    ## Series: nonstationary_y[train] 
    ## ARIMA(0,1,0) 
    ## 
    ## sigma^2 estimated as 1.137:  log likelihood=-69.71
    ## AIC=141.42   AICc=141.51   BIC=143.27
    ## 
    ## Training set error measures:
    ##                      ME     RMSE       MAE       MPE     MAPE      MASE
    ## Training set 0.01182676 1.055224 0.7741009 0.9130602 36.00029 0.9791667
    ##                    ACF1
    ## Training set 0.08409507

### Now, visualize forecast of a linear model with non-linear data!

    df_ts_st <- data.frame(x = time, y = nonstationary_y[1:96])

    aa_ns <- autoplot(forecast(aa_ns, h = 48)) + 
      geom_path(data = df_ts_st, aes(x = x, y = y)) + 
      ylab("Non-stationary Time Series"); aa_ns

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-15-1.png" title=" " >}}

### Not a very good prediction… Let’s try empirical dynamic models!

# Empirical Dynamic Models for forecasting:

### We will use the `simplex` function to determine how many dimensions (time lags) are needed to effectively develope a data-driven mechanistic formulation of the time series

    # set data for historical record (library) and prediction
    lib <- c(1, 48)
    pred <- c(49, 96)

    simplex_output <- simplex(nonstationary_y, lib, pred)
    str(simplex_output)

    ## 'data.frame':    10 obs. of  16 variables:
    ##  $ E                  : int  1 2 3 4 5 6 7 8 9 10
    ##  $ tau                : num  1 1 1 1 1 1 1 1 1 1
    ##  $ tp                 : num  1 1 1 1 1 1 1 1 1 1
    ##  $ nn                 : num  2 3 4 5 6 7 8 9 10 11
    ##  $ num_pred           : num  47 46 45 44 43 42 41 40 39 38
    ##  $ rho                : num  0.768 0.796 0.682 0.716 0.515 ...
    ##  $ mae                : num  2.81 2.76 3.03 3.1 3.38 ...
    ##  $ rmse               : num  3.55 3.46 3.89 3.88 4.21 ...
    ##  $ perc               : num  0.979 0.978 1 1 1 ...
    ##  $ p_val              : num  7.73e-12 5.15e-13 3.37e-08 4.22e-09 1.56e-04 ...
    ##  $ const_pred_num_pred: num  47 46 45 44 43 42 41 40 39 38
    ##  $ const_pred_rho     : num  0.954 0.954 0.947 0.944 0.939 ...
    ##  $ const_pred_mae     : num  1.008 0.988 0.989 0.951 0.966 ...
    ##  $ const_pred_rmse    : num  1.23 1.21 1.22 1.17 1.18 ...
    ##  $ const_pred_perc    : num  0.979 0.978 0.978 1 1 ...
    ##  $ const_p_val        : num  8.26e-36 6.46e-35 1.10e-31 2.88e-30 3.02e-28 ...

### Let’s visualize the forecasting skill (rho)

    par(mar = c(4, 4, 1, 1), mgp = c(2.5, 1, 0))  # set margins for plotting
    plot(simplex_output$E, simplex_output$rho, type = "l", lwd = 5, col = "light blue", xlab = "Embedding Dimension (E)", 
         ylab = "Forecast Skill (rho)")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-17-1.png" title=" " >}}

    simplex_output <- simplex(nonstationary_y, lib, pred, E = 2, tp = 1:10)
    plot(simplex_output$tp, simplex_output$rho, type = "l", lwd = 5, col = "light blue", xlab = "Time to Prediction (tp)", 
         ylab = "Forecast Skill (rho)")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-17-2.png" title=" " >}}

### Run `simplex` to create EDM model for forecasting

    smap_output <- simplex(nonstationary_y, lib, pred, E = 2, stats_only = FALSE)

    predictions <- na.omit(smap_output$model_output[[1]])

    df_ts_st_pred <- data.frame(x = time[51:96], y = nonstationary_y[51:96], predictions)

    plot(df_ts_st$y~df_ts_st$x, type = "l")

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-18-1.png" title=" " >}}

    edm <- ggplot(data = df_ts_st_pred) + ggtitle("Forecasts from EDM") + xlab("Time") + ylab(" ") + 
      geom_ribbon(aes(x = x, y = y, ymin = y - 1.96*sqrt(pred_var), ymax = y +.96*sqrt(pred_var)), fill = "blue", alpha = 0.2) +
      geom_ribbon(aes(x = x, y = y, ymin = y-sqrt(pred_var), ymax = y+sqrt(pred_var)), fill = "blue", alpha = 0.4) + 
      geom_path(aes(x = x, y = y)) + 
      geom_path(data = df_ts_st, aes(x = x, y = y)) + 
      ylab("Non-stationary Time Series"); edm

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-18-2.png" title=" " >}}

    ggarrange(aa_ns + coord_cartesian(ylim = c(-20,8)) + ggtitle("Forecast with ARIMA"),
              edm + coord_cartesian(ylim = c(-20,8)) + ggtitle("Forecast with EDM")) + theme_bw()

{{< figure library="true" src="posts/edm_md_files/figure-markdown_strict/unnamed-chunk-18-3.png" title="Image 18.3" >}}

    ggsave("forecasts.jpeg", dpi = 300)

    ## Saving 7 x 5 in image
