# Demo 09: ARMA and GARCH Simulation

## 教學問題
對時間序列同時建模「平均動態」與「波動動態」，示範 ARMA + GARCH 的完整流程。

## 數學模型
程式中的資料生成機制：

\[
r_t = 0.01 + 0.03r_{t-1} - 0.03r_{t-2} + a_t
\]

\[
a_t = \sigma_t\varepsilon_t,\quad \varepsilon_t\sim\mathcal N(0,1)
\]

\[
\sigma_t^2 = 0.01 + 0.12a_{t-1}^2 + 0.09\sigma_{t-1}^2
\]

## 解題流程
1. 模擬報酬序列 \(r_t\)。
2. 看 \(r_t\)、\(r_t^2\)、\(|r_t|\) 的 ACF 診斷。
3. 先用 EACF 判斷 ARMA 階數，再擬合 GARCH(1,1)。
4. 產生未來波動/報酬預測。

## 結果與圖表

![Preview](preview.png)

- 模擬路徑、ACF 診斷與 GARCH 擬合輸出請看：`report.html`
- 可觀察 volatility clustering 與條件變異動態。

## 如何重現
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
