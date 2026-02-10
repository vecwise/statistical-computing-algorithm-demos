# Demo 01: M/M/1 Cutoff Queue with Bootstrap

## 教學問題
在有「入場門檻」的 M/M/1 排隊系統中，估計每位成功入列顧客的平均系統逗留時間，並量化估計不確定性。

## 數學模型
- 到達過程：\(N(t)\) 為 Poisson process，速率 \(\lambda = 4.0\)
- 服務時間：\(S_i \sim \text{Exp}(\mu)\)，\(\mu = 4.2\)
- 截止時間：只接受 \(t \le T=8\) 的新到達
- Cutoff 規則：只有當系統人數不超過門檻才允許加入

目標參數：

\[
\theta = \mathbb{E}[W],\quad W=\text{(完成服務時間)}-\text{(到達時間)}
\]

Bootstrap MSE：

\[
\widehat{\mathrm{MSE}}(\hat\theta)=\mathrm{Var}(\hat\theta^{\ast}_1,\ldots,\hat\theta^{\ast}_B)
\]

## 解題流程
1. 用離散事件模擬產生到達、排隊與離開時間。
2. 計算所有被服務顧客的 \(W_i\)，得到 \(\hat\theta=\frac{1}{n}\sum_i W_i\)。
3. 對 \(\{W_i\}\) 做 bootstrap 重抽樣估計 MSE。

## 結果與圖表

![Preview](preview.png)

- 重點輸出：\(\hat\theta\) 與 bootstrap 變異（MSE 近似）。
- 圖表與程式結果請看：`report.html`

## 如何重現
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
