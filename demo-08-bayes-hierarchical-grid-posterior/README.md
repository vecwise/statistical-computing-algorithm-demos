# Demo 08: Bayesian Hierarchical Model via Grid Approximation

## 教學問題
展示階層式 Bayes 的 shrinkage 效果：群組參數如何被共同超參數拉回整體趨勢。

## 數學模型
兩層結構（簡化表示）：

\[
y_j\mid \theta_j \sim \mathcal N(\theta_j,\sigma_j^2),\quad
\theta_j\mid \mu,\tau \sim \mathcal N(\mu,\tau^2)
\]

重點是對超參數（如 \(\tau\)、或 \((\alpha,\beta)\)）做網格化，計算

\[
p(\text{hyper}\mid y)\propto p(y\mid \text{hyper})p(\text{hyper})
\]

再整合得到各群組 \(\theta_j\) 的後驗摘要。

## 解題流程
1. 建立 hyperparameter grid 並計算邊際後驗。
2. 由條件後驗計算每個 \(\theta_j\) 的均值、標準差、區間。
3. 畫出 shrinkage 與不確定性傳遞圖。

## 結果與圖表

![Preview](preview.png)

- 後驗圖（含 contour/raster）與群組參數區間圖請看：`report.html`
- 可直接觀察不同 \(\tau\) 下 shrinkage 強度變化。

## 如何重現
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
