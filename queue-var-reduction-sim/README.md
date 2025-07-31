# Variance Reduction in M/M/1 Queue Simulation

This project explores variance reduction techniques in the estimation of the total time spent by the first 10 customers in a **M/M/1 queue**, where:

- **Arrival rate**: $\lambda = 2$ per minute (Poisson process)
- **Service time**: Exponential with $\mathbb{E}[S_i] = 1$ minute

We aim to estimate:

$$
\theta = \mathbb{E}\left[\sum_{i=1}^{10} T_i\right]
$$

where $T_i$ is the time customer $i$ spends in the system.

### 🧪 Techniques Compared

1. **Naive estimator**
2. **Antithetic variable** estimator
3. **Control variate** using $\sum S_i$
4. **Control variate** using $\sum S_i - \sum I_i$
5. **Conditional expectation** based on number in system $N_i$

### 📁 Files

- `report.Rmd`: R Markdown with all simulation methods
- `report.html`: Rendered report including comparison of estimators
