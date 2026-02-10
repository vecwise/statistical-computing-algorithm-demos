# Demo 05: Constrained Uniform MCMC

## 教學問題
在 \((0,1)^9\) 中抽樣，但要滿足「任兩點距離至少 0.1」的硬限制。

## 數學模型
目標分配（等機率落在可行域）：

\[
\pi(x)\propto \mathbf{1}\left(\min_{i\neq j}|x_i-x_j|>0.1\right),\quad x\in(0,1)^9
\]

## 解題流程
1. 從一組可行初值 \(x^{(0)}\) 開始。
2. 每次隨機挑一個座標 \(I\)，提議 \(y\sim U(0,1)\)。
3. 若替換後仍滿足所有距離限制就接受，否則重抽（拒絕記錄在 `failtimes`）。
4. 重複多步，得到可行域樣本。

## 結果與圖表

![Preview](preview.png)

- 輸出包含：一組合法樣本、平均失敗次數（rejection/fail rate 指標）。
- 詳細展示請看：`report.html`

## 如何重現
- 腳本：`main.R`
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
