# Demo 10: Brownian First-Passage Probability

## 教學問題
估計標準布朗運動在區間 \([0,1]\) 內跌破門檻 \(c\) 的機率，並展示時間離散化對估計的影響。

## 數學模型
目標量：

\[
p(c)=\mathbb{P}\left(\min_{0\le t\le1} W_t < c\right),\quad c<0
\]

模擬上把 \([0,1]\) 切成 \(m\) 份，增量為

\[
\Delta W_k \sim \mathcal N\left(0,\frac{1}{m}\right),\quad
W_{k/m}=\sum_{i=1}^k\Delta W_i
\]

估計量：

\[
\hat p_m(c)=\frac{1}{N}\sum_{j=1}^N
\mathbf{1}\left\{\min_k W^{(j)}_{k/m}<c\right\}
\]

## 解題流程
1. 固定門檻（程式示範 `thereshold = -3`）。
2. 比較不同切分數（如 100 與 10000）下的 crossing estimate。
3. 觀察 \(m\) 增加時，離散偏差如何改變。

## 結果與圖表

![Preview](preview.png)

- 路徑圖與機率估計輸出請看：`report.html`
- 可直接比較粗網格與細網格結果差異。

## 如何重現
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
