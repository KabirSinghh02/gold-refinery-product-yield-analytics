SELECT 
    Supplier_Name,
    COUNT(Batch_ID) AS Total_Batches,
    SUM(Gross_Dore_Weight_KG) AS Total_Gross_Weight_KG,
    ROUND(SUM(Gross_Dore_Weight_KG * (Expected_Purity_Pct / 100)) - SUM(Actual_Gold_Extracted_KG), 3) AS Yield_Loss_KG,
    ROUND((SUM(Gross_Dore_Weight_KG * (Expected_Purity_Pct / 100)) - SUM(Actual_Gold_Extracted_KG)) * 7500000, 2) AS Financial_Loss_INR
FROM mdo_gold_refinery
GROUP BY Supplier_Name
ORDER BY Yield_Loss_KG DESC;


SELECT 
    Refinery_Location,
    AVG(Transit_Days_Port_to_Refinery) AS Avg_Transit_Days,
    MAX(Transit_Days_Port_to_Refinery) AS Max_Transit_Days,
    MIN(Transit_Days_Port_to_Refinery) AS Min_Transit_Days
FROM mdo_gold_refinery
GROUP BY Refinery_Location;


SELECT 
    SUBSTRING(Date, 4, 7) AS Production_Month,
    COUNT(Batch_ID) AS Total_Batches,
    ROUND(SUM(Actual_Gold_Extracted_KG), 3) AS Total_Pure_Gold_Output_KG
FROM mdo_gold_refinery
GROUP BY SUBSTRING(Date, 4, 7)
ORDER BY Production_Month;
