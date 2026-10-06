# 🏭 Gold Refinery Operational Analytics & Yield Loss Dashboard

## 📌 Executive Project Summary
An end-to-end operational intelligence project focused on evaluating gold refinery supply chain logistics, vendor yield losses, batch purity variances, and overall financial impact. 

This project combines SQL database querying and an interactive 3-page Power BI dashboard engineered with a dark maroon
dark-mode theme to provide operational insights for refinery executive decision-making.

---

## 🛠️ Data Pipeline & Architecture

### 1. Data Cleaning & Modeling
* Structured dore gold shipment records, batch IDs, expected purity percentages, actual extraction weights, and country-wise transit logistics.
* Established standardized measures for calculating **Gross Dore Weight vs. Actual Gold Extracted** to highlight refinery variance.

### 2. Database Engineering & SQL Analysis (MySQL)
* Uploaded raw refinery logs into the `mdo_gold_refinery` table.
* Executed advanced DML/DQL queries for operational auditing:
  * **Yield Loss & Financial Impact:** Calculated vendor-wise yield loss in KG and converted total operational loss into INR (`₹568.35M`).
  * **Transit Metrics:** Computed average, minimum, and maximum turnaround days across port-to-refinery supply chain routes.
  * **Monthly Trend Aggregation:** Grouped extraction outputs by month using `SUBSTRING()` date operations.
  * 
## 📊 Dashboard Structure & Analytics Breakdown

The Power BI Dashboard is structured across 3 comprehensive report pages:

### 1️⃣ Page 1: Executive Overview
* **Financial Loss KPI Card:** Prominently highlights total refinery financial loss (**568.35M INR**).
* **Yield Loss by Supplier:** Ranked horizontal bar chart identifying top loss-contributing vendors (**Al-Ghaith Bullion at 12.4 KG** and **Dubai Bullion at 12.3 KG**).
* **Monthly Extraction Trend:** Line chart depicting monthly production volatility ranging between **50 KG and 180 KG**.

### 2️⃣ Page 2: Operational Analytics
* **Detailed Batch Log Table:** Granular tracking of `Batch_ID`, `Date`, `Supplier_Name`, `Gross_Dore_Weight_KG`, and `Actual_Gold_Extracted_KG`.
* **Supply Chain Transit Performance:** Bar chart showing average transit days by sourcing country (**Peru at 6.42 Days** vs. **UAE at 2.46 Days**).
* **Batch-Wise Expected Purity %:** Scatter plot tracking purity variance (fluctuating between **75% and 94%**).

### 3️⃣ Page 3: Key Business Insights & Strategic Recommendations
* **Vendor Inefficiency Drivers:** Highlights core loss drivers and recommends renegotiating vendor contracts based on post-extraction weight rather than gross weight.
* **Logistics Optimization:** Recommends shifting urgent procurement allocations to fast-transit regions like the UAE.
* **Line Stability Actions:** Advises level-loading refinery chemical batch inputs to control processing cost volatility.

---

## 🔑 Key Operational Takeaways
* **Primary Loss Drivers:** Over 24 KG of gold yield loss stems directly from two primary vendors (*Al-Ghaith Bullion* & *Dubai Bullion*).
* **Logistics Bottlenecks:** Shipments from **Peru** introduce the highest latency (**6.42 Days**), creating potential operational idle time compared to **UAE** (**2.46 Days**).
* **Quality Control Variance:** Unstable batch purity levels directly correlate with higher refining chemical usage and processing downtime.

---

## 💻 Tech Stack & Tools
* **Database & Querying:** MySQL Workbench (Aggregation Queries, Mathematical Conversions, String Parsing)
* **Data Prep:** Power Query / Excel
* **Business Intelligence:** Power BI Desktop (Custom KPI Cards, High-Contrast Typography, Scatter Plots, Custom Formatting)
* **Version Control:** Git & GitHub

## 🗂️ SQL Query Samples

```sql
-- 1. Calculating Yield Loss and Financial Impact by Supplier
SELECT 
    Supplier_Name,
    COUNT(Batch_ID) AS Total_Batches,
    SUM(Gross_Dore_Weight_KG) AS Total_Gross_Weight_KG,
    ROUND(SUM(Gross_Dore_Weight_KG * (Expected_Purity_Pct / 100)) - SUM(Actual_Gold_Extracted_KG), 2) AS Yield_Loss_KG,
    ROUND((SUM(Gross_Dore_Weight_KG * (Expected_Purity_Pct / 100)) - SUM(Actual_Gold_Extracted_KG)) * 7500000, 2) AS Financial_Loss_INR
FROM mdo_gold_refinery
GROUP BY Supplier_Name
ORDER BY Yield_Loss_KG DESC;

-- 2. Transit Performance Analysis by Country
SELECT 
    Refinery_Location,
    AVG(Transit_Days_Port_to_Refinery) AS Avg_Transit_Days,
    MAX(Transit_Days_Port_to_Refinery) AS Max_Transit_Days,
    MIN(Transit_Days_Port_to_Refinery) AS Min_Transit_Days
FROM mdo_gold_refinery
GROUP BY Refinery_Location;
