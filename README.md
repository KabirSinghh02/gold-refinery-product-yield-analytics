# 🪙 Gold Refinery Product & Yield Analytics Dashboard

An end-to-end operational analytics and supply chain monitoring solution built using **Power BI**, **SQL**, and **DAX** to identify yield loss drivers, supplier inefficiencies, and sourcing bottlenecks in gold refinery operations.

---

## 📌 Business Overview & Objective
Gold refining operations require precise tracking of material yields, sourcing lead times, and supplier quality consistency. Small percentage losses in refining translate into significant financial yield impacts.

### Key Objectives:
- Track and measure total financial yield loss across global suppliers.
- Evaluate supply chain logistics and transit durations across sourcing countries.
- Provide actionable root-cause insights for executive decision-making.

---

## 📊 Key Insights & Metrics
- **Total Financial Impact:** Operational yield loss evaluated at **₹568.35M**.
- **Top Inefficient Suppliers:** Highest loss contributions observed from *Al-Ghaith Bullion* (12.4 KG) and *Dubai Bullion* (12.3 KG).
- **Logistics Transit Analysis:**
  - **Fastest Route:** UAE (Average transit time of **2.46 Days**).
  - **Bottleneck Route:** Peru (Longest transit duration averaging **6.42 Days**).

---

## 🛠️ Tech Stack & Tools Used
- **Business Intelligence:** Power BI Desktop
- **Database & Querying:** SQL
- **Data Modeling & Calculations:** DAX (Data Analysis Expressions)
- **Theme & UI:** Custom Dark Maroon Executive Theme

---

## 📐 Sample DAX Calculation

```dax
Dynamic_Supplier_Insight = 
VAR TopLossSupplier = TOPN(1, VALUES(RefineryData[Supplier_Name]), [Total_Yield_Loss_KG], DESC)
VAR TopLossValue = MAXX(TopLossSupplier, [Total_Yield_Loss_KG])
RETURN
"The highest operational yield loss is currently observed from " & 
SELECTEDVALUE(RefineryData[Supplier_Name], "multiple suppliers") & 
", contributing to " & FORMAT(TopLossValue, "0.0") & " KG in losses."
