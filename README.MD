# 📊 Customer Churn Analysis Dashboard

An end-to-end Data Analytics project focused on understanding customer churn behavior in a telecom company. This project combines SQL analysis, Python-based exploratory data analysis (EDA), and an interactive Streamlit dashboard to identify key churn drivers and provide actionable business recommendations.

---

## 🚀 Project Overview

Customer churn is a critical business problem that directly impacts revenue and customer lifetime value. The objective of this project is to analyze telecom customer data, identify factors contributing to customer attrition, and develop an interactive dashboard for business decision-making.

### Key Objectives

- Analyze customer demographics and service usage patterns.
- Identify major drivers of customer churn.
- Evaluate churn rates across customer segments.
- Provide business recommendations to improve retention.
- Build an interactive dashboard for stakeholder insights.

---

## 📂 Project Structure

```text
Customer-Churn-Analysis/

├── data/
│   └── Telco_customer_churn.csv
│
├── dashboard/
│   └── app.py
│
├── notebooks/
│   └── churn_analysis.ipynb
│
├── sql/
│   └── churn_queries.sql
│
├── screenshots/
│   ├── dashboard.png
│
├── requirements.txt
│
└── README.md
```

---

## 🛠️ Tech Stack

### Programming & Analysis
- Python
- Pandas
- NumPy

### Data Visualization
- Plotly
- Streamlit
- Matplotlib
- Seaborn

### Database
- SQL (MySQL)

### Development Tools
- Jupyter Notebook
- Git & GitHub

---

## 📈 Dataset

**IBM Telco Customer Churn Dataset**

- Total Customers: **7,043**
- Features: **33**
- Churned Customers: **1,869**
- Retained Customers: **5,174**

Dataset includes:

- Customer demographics
- Contract information
- Payment methods
- Internet services
- Monthly charges
- Customer lifetime value (CLTV)
- Churn labels and churn reasons

---

## 🔍 Exploratory Data Analysis

The notebook includes:

### Customer Overview
- Churn Distribution
- Customer Segmentation

### Churn Drivers
- Contract Type Analysis
- Payment Method Analysis
- Internet Service Analysis
- Technical Support Analysis
- Churn Reason Analysis

### Revenue Analysis
- Revenue at Risk
- Customer Lifetime Value (CLTV)

---

## 📊 Dashboard Features

### Executive Overview
- Total Customers
- Churned Customers
- Churn Rate
- Average Monthly Charges

### Customer Analysis
- Churn Rate by Contract Type
- Churn Rate by Payment Method
- Churn Rate by Internet Service

### Churn Drivers
- Top Churn Reasons
- Average Tenure Analysis
- Monthly Charges Analysis
- High-Risk Customer Segments

### Interactive Filters
- Contract Type
- Internet Service
- Gender

---

## 💡 Key Findings

### Churn Rate
- Overall churn rate is **26.5%**.

### Contract Type
- Month-to-Month customers have the highest churn rate (**42.7%**).
- One-Year contracts show significantly lower churn (**11.3%**).
- Two-Year contracts have the lowest churn (**2.8%**).

### Payment Method
- Electronic Check customers exhibit the highest churn rate (**45.3%**).

### Customer Support
- Poor customer support experience is a major churn driver.
- "Attitude of Support Person" is the most frequently reported churn reason.

### Competition
Competitor-related factors account for a significant portion of customer attrition:

- Better download speeds
- More data offerings
- Better pricing and promotional offers

---

## 📌 Business Recommendations

1. Promote long-term contracts through discounts and loyalty programs.
2. Encourage customers to switch to automatic payment methods.
3. Improve customer support quality and responsiveness.
4. Launch targeted retention campaigns for high-risk customers.
5. Improve competitiveness in pricing and service offerings.

---

## ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/your-username/Customer-Churn-Analysis.git

cd Customer-Churn-Analysis
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the dashboard:

```bash
cd dashboard

streamlit run app.py
```

---

## 📸 Dashboard Preview

### Executive Overview

> Add dashboard screenshot here

```markdown
![Dashboard](screenshots/dashboard.png)
```

---

## 🎯 Skills Demonstrated

- Data Cleaning
- Exploratory Data Analysis (EDA)
- SQL Querying
- Data Visualization
- Dashboard Development
- Business Analytics
- Customer Segmentation
- Data Storytelling

---

## 👨‍💻 Author

**Vishal Kumar**

B.Tech, Metallurgical & Materials Engineering  
Visvesvaraya National Institute of Technology (VNIT), Nagpur

- GitHub: https://github.com/Vishal-kr6
- LinkedIn: https://www.linkedin.com/in/vishal-kumar-vnit/
---

## ⭐ If you found this project useful, consider giving it a star!
