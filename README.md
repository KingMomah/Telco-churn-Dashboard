# 📉 Telco Churn Analysis: Digging Deeper with SQL + Power BI

## 👋 Overview

This project explores a Telco dataset to understand customer churn — **who's leaving, why they're leaving, and what we can do about it**.

The goal? Use **SQL for deep data exploration** and **Power BI** for intuitive, insight-rich dashboards.

## 🧠 What I Found

- Most customers that churn are **month-to-month subscribers** — no long-term commitment means they’re more likely to leave.
- **Tenure matters**: Customers in their first year are the most likely to churn.
- **Charge discrepancies** revealed a hidden insight — some churned users were potentially **overcharged**, paying more than expected.
- **Payment method and paperless billing** also played a significant role in churn behavior.

## 🛠️ How I Analyzed It

### 🔎 SQL Work
I used SQL to:
- Create a working copy of the dataset
- Recalculate expected total charges (`MonthlyCharges * Tenure`)
- Compare expected vs. actual charges to find inconsistencies
- Slice churn across tenure ranges, contract types, seniority, and payment methods

### 📊 Dashboard Highlights
![Dashboard](https://github.com/user-attachments/assets/0b896586-a09c-49b7-8565-f28cc9e0eac6)

The dashboard brings the SQL insights to life using:
- Tenure group analysis
- Churn rates by contract type and payment method
- Charge accuracy visualized by category
- Deep dive into senior citizens and billing impact

## ✅ Professional Recommendations

Based on the insights uncovered:

### 1. Contract Strategy
- Encourage longer-term contracts with onboarding incentives.
- Use churn predictors to retain month-to-month customers early.

### 2. Charge Transparency
- Fix charge calculation discrepancies.
- Communicate billing clearly with overcharged users and offer goodwill credits.

### 3. Tenure-Based Retention
- Focus on the first 12 months of a customer’s journey.
- Implement engagement checkpoints at 30, 60, and 90 days.

### 4. Payment Method Optimization
- Explore issues with electronic check users.
- Promote auto-pay methods with discounts or rewards.

### 5. Paperless Billing Improvements
- Redesign digital bills for better clarity and simplicity.
- Test paper billing with churn-prone segments for comparison.

### 6. Senior & Dependent Segments
- Provide customized plans and support for senior customers.
- Avoid digital-only strategies for this segment.

### 7. Churn Risk Model
- Develop a scoring system using churn drivers from the data.
- Prioritize retention campaigns based on high-risk scores.

## 💡 Tech Stack

- **SQL (MySQL)** for data transformation and analysis
- **Excel** for quick data cleaning, spot-checking, dashboards and storytelling

🔗 Let’s connect on [LinkedIn](www.linkedin.com/in/king-momah-1a8804279)  
📫 Contact: kingmomah2006@email.com
