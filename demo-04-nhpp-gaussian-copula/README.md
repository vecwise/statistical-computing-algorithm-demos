# Demo 04: NHPP Thinning and Gaussian Copula

## 教學問題
同時示範兩個常見模擬問題：
1. 非齊次 Poisson process（NHPP）如何模擬事件時間。
2. 如何建立「邊際分配固定、但變數有相依」的隨機向量。

## 數學模型
### (A) NHPP thinning
強度函數：

\[
\lambda(t)=3+\frac{4}{1+t},\quad t\in[0,10]
\]

選上界 \(\bar\lambda=7\)，先產生候選到達，再以接受率

\[
\frac{\lambda(t)}{\bar\lambda}
\]

決定是否保留事件。

### (B) Gaussian copula + Exponential marginals
- 先抽 \(Z\sim N(0,I)\)，再用 Cholesky 令 \(W=A^\top Z\) 取得相關結構。
- 轉成 uniform：\(U_j=\Phi(W_j)\)
- 套 inverse CDF：\(X_j=F_j^{-1}(U_j)\)，此處 \(X_j\) 為不同 rate 的 exponential。

## 解題流程
1. 用 thinning 產生 NHPP 事件時點。
2. 用 Gaussian copula 產生相關的 \((X_1,X_2,X_3)\)。
3. 用圖與樣本共變異數檢查結果。

## 結果與圖表

![Preview](preview.png)

- NHPP 事件時序圖、copula 樣本結果請看：`report.html`
- 腳本也可直接執行快速檢查：`main.R`

## 如何重現
- 腳本：`main.R`
- 原始報告：`report.Rmd`
- 成品報告：`report.html`
