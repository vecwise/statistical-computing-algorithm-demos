# Demo 09: ARMA and GARCH Simulation

## Problem
Model mean dynamics and volatility dynamics jointly in a time series using ARMA-style mean structure and GARCH variance structure.

## Model
Data-generating process in the script:

$$
r_t = 0.01 + 0.03r_{t-1} - 0.03r_{t-2} + a_t,
$$

$$
a_t = \sigma_t \varepsilon_t,
\quad \varepsilon_t \sim \mathcal{N}(0,1),
$$

$$
\sigma_t^2 = 0.01 + 0.12a_{t-1}^2 + 0.09\sigma_{t-1}^2.
$$

## Workflow
1. Simulate return series $r_t$.
2. Inspect ACF of $r_t$, $r_t^2$, and $|r_t|$.
3. Use EACF for ARMA order guidance.
4. Fit GARCH(1,1) and produce forecasts.

## Results
<p align="center">
  <img src="preview.png" alt="Preview" width="70%" />
</p>

- Simulation path, diagnostics, and fitted outputs are in `report.html`.
- The output illustrates volatility clustering and conditional variance dynamics.

## Reproduce
- Source report: `report.Rmd`
- Rendered report: `report.html`
