# Arrival Cutoff with Bootstrap Estimation

This project simulates a truncated single-server queue with the following settings:

- **Arrival process**: Poisson with rate $\lambda = 4.0$
- **Service process**: Exponential with rate $\mu = 4.2$
- **Cutoff rules**:
  - A customer is admitted only if **≤ 3 others** are already in the system
  - No arrivals are allowed after **time $T = 8$**

### 🎯 Goal

Estimate the expected time an admitted customer spends in the system:

$$
\theta = \mathbb{E}[\text{Time in system}]
$$

Additionally, apply the **bootstrap method** to estimate the **mean squared error (MSE)** of the estimator.

### 📁 Files

- `report.Rmd`: R Markdown with simulation and bootstrap logic
- `report.html`: Rendered report with analysis and plots
