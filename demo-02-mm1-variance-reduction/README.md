# Demo 02: Variance Reduction in an M/M/1 Queue

## Problem
For the same queueing target, compare multiple variance-reduction methods under equal simulation budget.

## Model
- Interarrival times: $A_i \sim \mathrm{Exp}(\lambda)$ with $\lambda = 2$.
- Service times: $S_i \sim \mathrm{Exp}(\mu)$ with $\mu = 1$.
- Target statistic in code:

$$
\theta = \mathbb{E}\!\left[\sum_{i=1}^{10} T_i\right],
$$

where $T_i$ is the system time of customer $i$.

The report also uses:

$$
\mathbb{E}[T_i \mid N_i] = \frac{N_i + 1}{\mu} = N_i + 1,
$$

with $N_i$ the number of customers ahead in queue for customer $i$.

## Workflow
1. Build a naive Monte Carlo baseline.
2. Implement antithetic variables.
3. Implement two control-variates.
4. Implement conditional-expectation estimator $\sum_i \mathbb{E}[T_i\mid N_i]$.
5. Compare by variance ratio:

$$
\text{Variance Ratio} =
\frac{\mathrm{Var}(\hat\theta_{\text{method}})}{\mathrm{Var}(\hat\theta_{\text{naive}})}.
$$

## Results
<p align="center">
  <img src="preview.png" alt="Preview" width="70%" />
</p>

- In the provided run, all four methods reduce variance substantially (around 75% vs naive).
- See `report.html` for numeric comparison.

## Reproduce
- Source report: `report.Rmd`
- Rendered report: `report.html`
