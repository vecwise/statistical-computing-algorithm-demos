# Demo 06: Random Variate Generation Methods

## 教學問題
對多個目標分配，實作三大隨機變數產生法並比較效果：
Inverse Transform、Acceptance-Rejection、Composition。

## 數學模型
本 demo 主要示範下列目標密度/分配：

1. \(F(x)=\tfrac12(x+x^2),\ 0\le x\le1\)（可反函數抽樣）
2. \(f(x)=e^{-x}+2e^{-2x}-3e^{-3x}\)（適合 AR）
3. \(f(x)=\tfrac14+2x^3+\tfrac54x^4,\ 0\le x\le1\)（可 AR 或 mixture/composition）

## 解題流程
1. 反函數法：令 \(U\sim U(0,1)\)，取 \(X=F^{-1}(U)\)。
2. AR 法：找 proposal \(g\) 與常數 \(M\)，用

\[
\text{accept if } U\le \frac{f(Y)}{Mg(Y)},\ Y\sim g
\]

3. Composition 法：先依 mixture 權重抽成分，再抽條件樣本。

## 結果與圖表

![Preview](preview.png)

- `main.R` 與 `report.Rmd` 會產生多組 histogram，比對是否貼近目標分配。
- 可直接觀察不同方法的效率與實作複雜度。

## 如何重現
- 腳本：`main.R`
- 補充報告：`report.Rmd`
