# M/M/1 Cutoff Queue with Bootstrap

Pure simulation demo (no external dataset).

This demo simulates a truncated single-server queue with:

- Arrival process: Poisson with rate `lambda = 4.0`
- Service process: Exponential with rate `mu = 4.2`
- Admission rule: admit a customer only if at most 3 others are already in system
- Time cutoff: stop admitting arrivals after time `T = 8`

## Objective

Estimate the expected time an admitted customer spends in system:

`theta = E[time in system]`

Then use bootstrap resampling to estimate the estimator's MSE.

## Files
- `report.Rmd`: Simulation and bootstrap workflow
- `report.html`: Rendered analysis report
