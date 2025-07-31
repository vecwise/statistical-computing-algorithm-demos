# Queue Simulation Projects in R

This repository presents two simulation-based studies related to single-server queues, with a focus on stochastic modeling, statistical estimation, and variance reduction.

## 📁 Projects Overview

### [1. Arrival Cutoff with Bootstrap Estimation](./arrival-cutoff-bootstrap-sim/)
We simulate a queue with a **Poisson arrival process** (rate $\lambda = 4.0$) and **exponentially distributed service times** (rate $\mu = 4.2$). Admission is limited to at most 3 people in the system, and arrivals are cut off at $T = 8$. We estimate the **average system time per admitted customer** and use **bootstrap resampling** to assess the estimator's **mean squared error (MSE)**.

Mathematical Objective:

$$
\theta = \mathbb{E}[\text{Time in system per admitted customer}]
$$

---

### [2. Variance Reduction in M/M/1 Queue](./queue-var-reduction-sim/)
We simulate an M/M/1 queue with **inter-arrival rate $\lambda = 2$ per minute** and **service time with mean 1 minute**. The goal is to estimate:

$$
\theta = \mathbb{E}\left[\sum_{i=1}^{10} T_i\right]
$$

where $T_i$ is the time customer $i$ spends in the system. We compare:

- Naive estimator
- Antithetic variables
- Control variates (service/interarrival time)
- Conditional expectations

Each project includes source code and rendered output in HTML.

---
