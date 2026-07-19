
                            ## Module 1 — Basic Business Overview
                           
Q1:-  How many total transactions are available for analysis?
                             
SELECT COUNT(*) AS Total_Transactions
FROM bank_transactions;

Q2:- How many different customers made these transactions?

SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM bank_transactions;

Q3:- What is the total value of all transactions?

SELECT
SUM(`Transaction Amount`) AS Total_Transaction_Value
FROM bank_transactions;

Q4:- What is the average amount spent per transaction?

SELECT
ROUND(AVG(`Transaction Amount`),2) AS Average_Transaction
FROM bank_transactions;

Q5:- What are the smallest and largest transactions?

SELECT
MIN(`Transaction Amount`) AS Minimum_Transaction,
MAX(`Transaction Amount`) AS Maximum_Transaction
FROM bank_transactions;

Q6:- Transaction Amount Statistics?

SELECT
COUNT(*) AS Total_Transactions,
SUM(`Transaction Amount`) AS Total_Value,
ROUND(AVG(`Transaction Amount`),2) AS Average_Value,
MIN(`Transaction Amount`) AS Minimum_Value,
MAX(`Transaction Amount`) AS Maximum_Value
FROM bank_transactions;


Q7:- How many transactions are fraudulent?

SELECT
`Fraud Status`,
COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY `Fraud Status`;


Q8:- Fraud Percentage?

SELECT
`Fraud Status`,
COUNT(*) AS Transactions,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM bank_transactions),
2
) AS Percentage
FROM bank_transactions
GROUP BY `Fraud Status`;

                       ## Module 2: Transaction Analysis
                               

## Business Goal  :- "How do different types of transactions behave, and where are the fraud hotspots?"

Q1: -  Which transaction type is most common?

SELECT
    `Transaction Type`,
    COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY `Transaction Type`
ORDER BY Total_Transactions DESC;
                          
Q2: -  Which transaction type has the highest fraud rate?

SELECT
    `Transaction Type`,
    COUNT(*) AS Total_Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Transactions,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Transaction Type`
ORDER BY Fraud_Rate DESC;


Q3: - Which merchant categories are targeted most?

SELECT
    `Merchant Category`,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count
FROM bank_transactions
GROUP BY `Merchant Category`
ORDER BY Fraud_Count DESC; 

Q4:- Which locations experience the most fraud?

SELECT
    Location,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count
FROM bank_transactions
GROUP BY Location
ORDER BY Fraud_Count DESC;

Q5:- Which device type is riskiest?

SELECT
    `Device Type`,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Device Type`
ORDER BY Fraud_Rate DESC;


                           ## Module 3: Time-Based AnalysiS
                           
##  Business Goal :-   "When are fraudulent transactions most likely to occur?"    

Q1:- Which Month Has the Most Transactions?

SELECT
    `Month Name`,
    COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY `Month Name`
ORDER BY COUNT(*) DESC;                     

Q2:-  Which Month Has the Highest Fraud Rate?

SELECT
    `Month Name`,
    COUNT(*) AS Total_Transactions,
    SUM(CASE
            WHEN `Fraud Status` = 'Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status` = 'Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Month Name`
ORDER BY Fraud_Rate DESC;

Q3: -  Which Day of the Week Has the Highest Fraud?

SELECT
    `Day Name`,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Day Name`
ORDER BY Fraud_Rate DESC;

Q4:- Which Hour Has the Highest Fraud?

SELECT
    Hour,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY Hour
ORDER BY Fraud_Rate DESC;

Q5:- Which Time of Day Has the Highest Fraud?

SELECT
    `Time of Day`,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Time of Day`
ORDER BY Fraud_Rate DESC;


Q6:- Business Hours vs Non-Business Hours?

SELECT
    `Business Hours`,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Business Hours`
ORDER BY Fraud_Rate DESC;

Q7:- Weekend vs Weekday?

SELECT
    `Day Type`,
    COUNT(*) AS Transactions,
    SUM(CASE
            WHEN `Fraud Status`='Fraud' THEN 1
            ELSE 0
        END) AS Fraud_Count,
    ROUND(
        SUM(CASE
                WHEN `Fraud Status`='Fraud' THEN 1
                ELSE 0
            END) * 100.0 /
        COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Day Type`;


Q8:-  Monthly Transaction Value?

SELECT
    `Month Name`,
    ROUND(SUM(`Transaction Amount`),2) AS Total_Transaction_Value
FROM bank_transactions
GROUP BY `Month Name`
ORDER BY Total_Transaction_Value DESC;

                     ##  Module 4: Customer & Risk Analysis
                     
## Business Goal: -Identify the characteristics that are associated with fraudulent transactions.


Q1:- Suspicious IP Analysis?

SELECT
    `Suspicious IP`,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END) AS Fraud_Count,
    ROUND(
        SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Suspicious IP`;

Q2:- Previous Fraud History?

SELECT
    `Previous Fraud History`,
    COUNT(*) AS Transactions,
    SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END) AS Fraud_Count,
    ROUND(
        SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Previous Fraud History`;

Q3:- Authentication Method ?

SELECT
    `Authentication Method`,
    COUNT(*) AS Transactions,
    SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END) AS Fraud_Count,
    ROUND(
        SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Authentication Method`
ORDER BY Fraud_Rate DESC;



Q4:- Card Type ?

SELECT
    `Card Type`,
    COUNT(*) AS Transactions,
    SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END) AS Fraud_Count,
    ROUND(
        SUM(CASE WHEN `Fraud Status`='Fraud' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Fraud_Rate
FROM bank_transactions
GROUP BY `Card Type`
ORDER BY Fraud_Rate DESC;

Q5:- Average Transaction Distance?

SELECT
    `Fraud Status`,
    ROUND(AVG(`Transaction Distance (Km)`),2) AS Average_Distance
FROM bank_transactions
GROUP BY `Fraud Status`;

Q6:-  Average Transaction Amount?

SELECT
    `Fraud Status`,
    ROUND(AVG(`Transaction Amount`),2) AS Average_Transaction
FROM bank_transactions
GROUP BY `Fraud Status`;


Q7:- Average Fraud Risk Score?

SELECT
    `Fraud Status`,
    ROUND(AVG(`Fraud Risk Score`),4) AS Average_Risk
FROM bank_transactions
GROUP BY `Fraud Status`;

Q8:- Failed Transactions (7 Days)?

SELECT
    `Fraud Status`,
    ROUND(AVG(`Failed Transactions (7 Days)`),2) AS Average_Failed_Transactions
FROM bank_transactions
GROUP BY `Fraud Status`;

Q9:-  Daily Transaction Count?

SELECT
    `Fraud Status`,
    ROUND(AVG(`Daily Transaction Count`),2) AS Average_Daily_Transactions
FROM bank_transactions
GROUP BY `Fraud Status`;


Q10:- Account Balance?

SELECT
    `Fraud Status`,
    ROUND(AVG(`Account Balance`),2) AS Average_Account_Balance
FROM bank_transactions
GROUP BY `Fraud Status`;


                      ## MODULE 5  Advance Analytics
                      
Q1:-  Which transaction types have more than 12,000 transactions?

SELECT
    `Transaction Type`,
    COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY `Transaction Type`
HAVING COUNT(*) > 12000;


Q2:- Which transactions are above the average transaction amount?

SELECT *
FROM bank_transactions
WHERE `Transaction Amount` >
(
    SELECT AVG(`Transaction Amount`)
    FROM bank_transactions
);

Q3:-    WITH TransactionSummary AS
(
    SELECT
        `Transaction Type`,
        COUNT(*) AS Total_Transactions
    FROM bank_transactions
    GROUP BY `Transaction Type`
)

SELECT *
FROM TransactionSummary;



Q4:- Number every transaction.?

SELECT
    `Transaction ID`,
    `Customer ID`,
    `Transaction Amount`,
    ROW_NUMBER() OVER(
        ORDER BY `Transaction Amount` DESC
    ) AS Row_Num
FROM bank_transactions;

Q5:- Rank transactions by amount?

SELECT
    `Transaction ID`,
    `Transaction Amount`,
    RANK() OVER(
        ORDER BY `Transaction Amount` DESC
    ) AS Transaction_Rank
FROM bank_transactions;




Q6:- Top 10 Highest Transactions?

SELECT
    `Transaction ID`,
    `Customer ID`,
    `Transaction Amount`
FROM bank_transactions
ORDER BY `Transaction Amount` DESC
LIMIT 10;

Q7:- How does cumulative transaction value grow?

SELECT
    `Transaction Date`,
    `Transaction Amount`,
    SUM(`Transaction Amount`)
    OVER(
        ORDER BY `Transaction Date`
    ) AS Running_Total
FROM bank_transactions;

Q8:- Which customers spend the most?

SELECT
    `Customer ID`,
    SUM(`Transaction Amount`) AS Total_Spent,
    RANK() OVER(
        ORDER BY SUM(`Transaction Amount`) DESC
    ) AS Customer_Rank
FROM bank_transactions
GROUP BY `Customer ID`;


Q9:- Fraud Ranking by Location?

SELECT
    Location,
    SUM(
        CASE
            WHEN `Fraud Status`='Fraud'
            THEN 1
            ELSE 0
        END
    ) AS Fraud_Count,
    RANK() OVER(
        ORDER BY
        SUM(
            CASE
                WHEN `Fraud Status`='Fraud'
                THEN 1
                ELSE 0
            END
        ) DESC
    ) AS Fraud_Rank
FROM bank_transactions
GROUP BY Location;




















































































