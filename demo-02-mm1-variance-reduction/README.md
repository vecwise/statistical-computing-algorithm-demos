# Demo 02: Variance Reduction in M/M/1 Queue

## 教學問題
在同一個 M/M/1 目標量下，比較不同變異縮減技巧，觀察同樣樣本數下誰最穩定。

## 數學模型
- 到達間隔 \(A_i \sim \text{Exp}(\lambda),\ \lambda=2\)
- 服務時間 \(S_i \sim \text{Exp}(1)\)
- 目標量（前 10 位顧客總逗留時間）：

\[
\theta = \mathbb{E}\left[\sum_{i=1}^{10} T_i\right]
\]

- 條件期望關係（報告使用）：

\[
\mathbb{E}[T_i\mid N_i]=(N_i+1)\,\mathbb{E}[S]=(N_i+1)
\]

## 解題流程
1. 先以 naive Monte Carlo 當基準變異 \(\mathrm{Var}_{\text{naive}}\)。
2. 依序實作 antithetic、兩種 control variate、以及條件期望法。
3. 用變異比比較：

\[
\text{Variance Ratio}=\frac{\mathrm{Var}(\hat\theta_{\text{method}})}{\mathrm{Var}_{\text{naive}}}
\]

## 結果與圖表

![Preview](preview.png)

- 報告總結：四種方法約可降低約 75% 估計變異。
- 比較圖與數值請看：`report.html`

## 如何重現
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
