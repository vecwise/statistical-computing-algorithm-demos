# Demo 03: Tail Estimation with Importance Sampling

## Problem
Show how importance sampling can stabilize tail-related estimation compared with direct simulation.

## Model
The code draws from an exponential distribution and focuses on the tail region $x > 10$.

- Baseline sample: $X \sim \mathrm{Exp}(1)$, then keep samples with $X > 10$.
- Proposal sample: $X \sim \mathrm{Exp}(0.1)$, then keep samples with $X > 10$.

A weighted estimator is formed as:

$$
\hat\mu_{\mathrm{IS}} = \frac{1}{n}\sum_{i=1}^n h(X_i) w(X_i),
$$

where $w(x) = f(x)/g(x)$ is the likelihood ratio between target and proposal tail-conditional densities (as implemented in `main.R`).

## Workflow
1. Compute a direct tail-based estimate from $\mathrm{Exp}(1)$ samples.
2. Sample from a heavier-tailed proposal.
3. Apply likelihood-ratio weighting.
4. Compare summary statistics and histogram shape.

## Results
<p align="center">
  <img src="preview.png" alt="Preview" width="70%" />
</p>

- `main.R` prints weighted estimate, standard deviation, and a histogram.
- You can compare stability between direct and IS-based estimation.

## Reproduce
- Script: `main.R`
