# Statistical Computing Algorithm Demos

A compact, code-first collection of **simulation and computational statistics demos** in R.
Each folder is designed to be easy to run, easy to inspect, and focused on one practical idea.

## Why This Repo
- Hands-on algorithms, not just theory.
- Clear mapping: **math model -> code -> output figures**.
- Great for quick study, teaching demos, and interview/project refreshers.

## Demo Lineup

| Demo | Topic | What You Will See |
|---|---|---|
| [demo-01-mm1-cutoff-bootstrap](./demo-01-mm1-cutoff-bootstrap/) | Queue simulation + bootstrap | M/M/1 cutoff queue simulation and uncertainty estimation for mean waiting/system time. |
| [demo-02-mm1-variance-reduction](./demo-02-mm1-variance-reduction/) | Variance reduction | Naive MC vs antithetic, control variates, and conditional expectation in the same queue target. |
| [demo-03-rare-event-importance-sampling](./demo-03-rare-event-importance-sampling/) | Rare-event estimation | Tail estimation with importance sampling and likelihood-ratio weighting. |
| [demo-04-nhpp-gaussian-copula](./demo-04-nhpp-gaussian-copula/) | Point process + dependence modeling | NHPP thinning simulation and Gaussian-copula construction with exponential marginals. |
| [demo-05-constrained-uniform-mcmc](./demo-05-constrained-uniform-mcmc/) | Constrained sampling | MCMC-style sampling under hard pairwise-distance constraints in $(0,1)^9$. |
| [demo-06-random-variate-generation](./demo-06-random-variate-generation/) | Random generation methods | Inverse transform, acceptance-rejection, and composition methods side by side. |
| [demo-07-bayes-poisson-trend-grid](./demo-07-bayes-poisson-trend-grid/) | Bayesian grid posterior | Conjugate Bayes summaries + grid-based posterior/predictive inference for a Poisson trend model. |
| [demo-08-bayes-hierarchical-grid-posterior](./demo-08-bayes-hierarchical-grid-posterior/) | Hierarchical Bayes | Grid approximation and shrinkage behavior in hierarchical models. |
| [demo-09-ts-arma-garch-simulation](./demo-09-ts-arma-garch-simulation/) | Time-series volatility | ARMA-style mean dynamics with GARCH(1,1) volatility and diagnostics. |
| [demo-10-ts-brownian-passage-prob](./demo-10-ts-brownian-passage-prob/) | Stochastic process simulation | Brownian first-passage probability and discretization effects. |

## Quick Start
1. Open any demo folder.
2. Read its `README.md` for the model and workflow.
3. Run `main.R` or knit `report.Rmd` (if provided).
4. Compare figures/results in `report.html` or script output.

## Suggested Paths
- If you like Monte Carlo basics: start with **Demo 06 -> Demo 03 -> Demo 02**.
- If you like Bayesian methods: start with **Demo 07 -> Demo 08**.
- If you like stochastic processes/time series: start with **Demo 04 -> Demo 10 -> Demo 09**.

## Repository Style
- Most demos are self-contained and do not require external uploaded datasets.
- The focus is algorithmic clarity over framework complexity.
