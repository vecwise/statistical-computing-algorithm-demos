# Demo 07: Bayesian Computation with Conjugacy and Grid Posterior

## Problem
Demonstrate Bayesian inference without MCMC in two parts:
1. Closed-form conjugate update.
2. Grid-based posterior approximation for a Poisson trend model.

## Model
### (A) Conjugate gamma posterior (first section of `main.R`)
The script computes posterior summaries and interval bounds from a gamma-form posterior:

$$
\theta \mid y \sim \mathrm{Gamma}(n+\alpha,\ \beta + \textstyle\sum_i y_i^2).
$$

### (B) Poisson log-linear trend (second section of `main.R`)

$$
y_t \sim \mathrm{Poisson}(\lambda_t),
\quad \lambda_t = \exp(\alpha + \beta x_t).
$$

Posterior on a grid (up to proportionality):

$$
p(\alpha,\beta\mid y) \propto
\prod_t \frac{e^{-\lambda_t}\lambda_t^{y_t}}{y_t!}.
$$

## Workflow
1. Compute grid-based unnormalized posterior on $(\alpha,\beta)$.
2. Sample $(\alpha,\beta)$ from normalized grid weights.
3. Build posterior predictive distribution by sampling:

$$
\tilde y \sim \mathrm{Poisson}(\tilde\lambda),
\quad \tilde\lambda = \exp(\alpha + \beta x_{\text{future}}).
$$

## Results
![Preview](preview.png)

- Main outputs include posterior contour/scatter and predictive histograms.
- Credible/predictive intervals are computed in the script.

## Reproduce
- Script: `main.R`
