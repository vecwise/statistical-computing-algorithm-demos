# Variance Reduction in M/M/1 Queue

Pure simulation demo (no external dataset).

This demo estimates the total time spent by the first 10 customers in an M/M/1 queue:

- Arrival rate: `lambda = 2` per minute
- Service time: Exponential with `E[S_i] = 1` minute
- Target quantity: `theta = E[sum_{i=1}^{10} T_i]`
- `T_i` denotes customer `i`'s time in system

## Techniques Compared

1. Naive Monte Carlo estimator
2. Antithetic variable estimator
3. Control variate using `sum S_i`
4. Control variate using `sum S_i - sum I_i`
5. Conditional expectation using queue state `N_i`

## Files
- `report.Rmd`: Full simulation and estimator comparison
- `report.html`: Rendered report with results
