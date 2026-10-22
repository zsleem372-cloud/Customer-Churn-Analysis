CREATE DATABASE CustomerChurnAnalysis

USE CustomerChurnAnalysis



SELECT COUNT(*)
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]


select top 10*

FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]


select
sum(case when MultipleLines is null then 1 else 0 end) as 'nullMultipleLines',
sum(case when OnlineSecurity is null then 1 else 0 end) as 'nullOnlineSecurity',
sum(case when TotalCharges is null then 1 else 0 end) as 'nullTotalCharges'
from dbo.[WA_Fn-UseC_-Telco-Customer-Churn]


SELECT *
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
WHERE TotalCharges IS NULL


SELECT
customerID,
COUNT(*) AS Customer_Count
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY customerID
HAVING COUNT(*) > 1;



select Churn,count(*) as 'Customer_Count'
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY Churn



select Churn,Contract,count(*)AS 'Customer_Count'
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY Churn ,Contract
order by Churn ,Contract



----Total customers and churn rate إجمالي العملاء ونسبة إلغاء الاشتراك

select count(*) as 'Total_Customers',
sum(case when Churn=1 then 1 else 0 end) as 'Churned_Customers',
cast(100.0*sum(case when Churn=1 then 1 else 0 end)/count(*)AS DECIMAL(5,2)) as 'Churn_Rate'
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]


---##Cancellation based on contract type إلغاء الاشتراك حسب نوع العقد

select contract, count(*) AS 'Total_Customers',
sum(case when Churn=1 then 1 else 0 end) as 'Churned_Customers',cast(100.0*sum(case when Churn=1 then 1 else 0 end)/count(*)AS DECIMAL(5,2)) as 'Churn_Rate'
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
group by contract



--##Number of customers and churn rate by InternetService عدد العملاء ونسبة الـ Churn حسب InternetService


select InternetService, count(*) AS'Total_Customers',
sum(case when Churn=1 then 1 else 0 end) as 'Churned_Customers',cast(100.0*sum(case when Churn=1 then 1 else 0 end)
/count(*)AS DECIMAL(5,2)) as 'Churn_Rate'
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
group by InternetService

---##Churn by Payment Method /Churn حسب طريقة الدفع PaymentMethod


select PaymentMethod, count(*) AS'Total_Customers',
sum(case when Churn=1 then 1 else 0 end) as 'Churned_Customers',cast(100.0*sum(case when Churn=1 then 1 else 0 end)
/count(*)AS DECIMAL(5,2)) as 'Churn_Rate'
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
group by PaymentMethod


--###Comparison of average monthly fees and subscription duration between retained and churned customers./ مقارنة متوسط الرسوم الشهرية ومدة الاشتراك بين العملاء المستمرين والمغادرين

SELECT
Churn,COUNT(*) AS Total_Customers,
AVG(MonthlyCharges) AS Avg_Monthly_Charges,
AVG(tenure * 1.0) AS Avg_Tenure_Months
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY Churn


USE CustomerChurnAnalysis
