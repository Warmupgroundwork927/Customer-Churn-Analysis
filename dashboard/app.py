import streamlit as st
import pandas as pd
import plotly.express as px

# ==================================================
# PAGE CONFIG
# ==================================================

st.set_page_config(
    page_title="Customer Churn Dashboard",
    page_icon="📊",
    layout="wide"
)

# ==================================================
# LOAD DATA
# ==================================================

@st.cache_data
def load_data():
    return pd.read_csv("/home/vishal/Downloads/archive/Telco_customer_churn.csv")

df = load_data()

# ==================================================
# SIDEBAR FILTERS
# ==================================================

st.sidebar.header("Filters")

contract_filter = st.sidebar.multiselect(
    "Contract Type",
    options=sorted(df["Contract"].unique()),
    default=sorted(df["Contract"].unique())
)

internet_filter = st.sidebar.multiselect(
    "Internet Service",
    options=sorted(df["Internet Service"].unique()),
    default=sorted(df["Internet Service"].unique())
)

gender_filter = st.sidebar.multiselect(
    "Gender",
    options=sorted(df["Gender"].unique()),
    default=sorted(df["Gender"].unique())
)

filtered_df = df[
    (df["Contract"].isin(contract_filter))
    & (df["Internet Service"].isin(internet_filter))
    & (df["Gender"].isin(gender_filter))
]

# ==================================================
# KPI CALCULATIONS
# ==================================================

total_customers = len(filtered_df)

churned_customers = (
    filtered_df["Churn Label"] == "Yes"
).sum()

churn_rate = (
    churned_customers / total_customers
) * 100

avg_monthly_charge = (
    filtered_df["Monthly Charges"].mean()
)

# ==================================================
# HEADER
# ==================================================

st.title("📊 Customer Churn Analysis Dashboard")

st.caption(
    "IBM Telco Customer Churn Dataset | 7,043 Customers | 33 Features"
)

st.markdown(
    """
Analyze customer behavior, churn drivers, and retention opportunities
using telecom customer data.
"""
)

# ==================================================
# KPI CARDS
# ==================================================

col1, col2, col3, col4 = st.columns(4)

with col1:
    st.metric(
        "Total Customers",
        f"{total_customers:,}"
    )

with col2:
    st.metric(
        "Churned Customers",
        f"{churned_customers:,}"
    )

with col3:
    st.metric(
        "Churn Rate",
        f"{churn_rate:.2f}%"
    )

with col4:
    st.metric(
        "Avg Monthly Charges",
        f"${avg_monthly_charge:.2f}"
    )

st.divider()

# ==================================================
# TABS
# ==================================================

tab1, tab2, tab3 = st.tabs(
    [
        "Executive Overview",
        "Customer Analysis",
        "Churn Drivers"
    ]
)

# ==================================================
# TAB 1 - EXECUTIVE OVERVIEW
# ==================================================

with tab1:

    st.subheader("Contract Churn Analysis")

    contract_churn = (
        pd.crosstab(
            filtered_df["Contract"],
            filtered_df["Churn Label"],
            normalize="index"
        ) * 100
    )

    fig = px.bar(
        contract_churn,
        y="Yes",
        text="Yes",
        title="Churn Rate by Contract Type",
        labels={
            "Yes": "Churn Rate (%)"
        }
    )

    fig.update_traces(
        texttemplate="%{y:.1f}%",
        textposition="outside"
    )

    fig.update_layout(
        yaxis_title="Churn Rate (%)",
        xaxis_title="Contract Type"
    )

    st.plotly_chart(
        fig,
        use_container_width=True
    )

    st.subheader("High-Risk Customer Sample")

    risk_df = filtered_df[
        filtered_df["Churn Label"] == "Yes"
    ][[
        "Contract",
        "Payment Method",
        "Internet Service",
        "Monthly Charges",
        "Tenure Months"
    ]]

    st.dataframe(
        risk_df.sort_values(
            by="Monthly Charges",
            ascending=False
        ).head(20),
        use_container_width=True
    )

    st.subheader("📌 Key Findings")

    st.markdown(
        """
- Overall customer churn rate is **26.5%**.
- Customers on **Month-to-Month contracts** exhibit the highest churn rate (**42.7%**).
- Customers using **Electronic Check** payment show the highest churn rate (**45.3%**).
- Customer support quality is a major churn driver.
- Competitor offerings significantly impact customer retention.
"""
    )

# ==================================================
# TAB 2 - CUSTOMER ANALYSIS
# ==================================================

with tab2:

    st.subheader("Payment Method Analysis")

    payment_churn = (
        pd.crosstab(
            filtered_df["Payment Method"],
            filtered_df["Churn Label"],
            normalize="index"
        ) * 100
    )

    fig = px.bar(
        payment_churn,
        y="Yes",
        text="Yes",
        title="Churn Rate by Payment Method"
    )

    fig.update_traces(
        texttemplate="%{y:.1f}%",
        textposition="outside"
    )

    fig.update_layout(
        yaxis_title="Churn Rate (%)",
        xaxis_title="Payment Method"
    )

    st.plotly_chart(
        fig,
        use_container_width=True
    )

    st.subheader("Internet Service Analysis")

    internet_churn = (
        pd.crosstab(
            filtered_df["Internet Service"],
            filtered_df["Churn Label"],
            normalize="index"
        ) * 100
    )

    fig = px.bar(
        internet_churn,
        y="Yes",
        text="Yes",
        title="Churn Rate by Internet Service"
    )

    fig.update_traces(
        texttemplate="%{y:.1f}%",
        textposition="outside"
    )

    fig.update_layout(
        yaxis_title="Churn Rate (%)",
        xaxis_title="Internet Service"
    )

    st.plotly_chart(
        fig,
        use_container_width=True
    )

# ==================================================
# TAB 3 - CHURN DRIVERS
# ==================================================

with tab3:

    st.subheader("Top Churn Reasons")

    top_reasons = (
        filtered_df[
            filtered_df["Churn Label"] == "Yes"
        ]["Churn Reason"]
        .value_counts()
        .head(10)
        .sort_values()
    )

    fig = px.bar(
        x=top_reasons.values,
        y=top_reasons.index,
        orientation="h",
        title="Top 10 Churn Reasons"
    )

    st.plotly_chart(
        fig,
        use_container_width=True
    )

    col1, col2 = st.columns(2)

    with col1:

        st.subheader("Average Tenure")

        tenure_avg = (
            filtered_df
            .groupby("Churn Label")["Tenure Months"]
            .mean()
            .reset_index()
        )

        fig = px.bar(
            tenure_avg,
            x="Churn Label",
            y="Tenure Months",
            text="Tenure Months"
        )

        fig.update_traces(
            texttemplate="%{y:.1f}",
            textposition="outside"
        )

        st.plotly_chart(
            fig,
            use_container_width=True
        )

    with col2:

        st.subheader("Average Monthly Charges")

        monthly_avg = (
            filtered_df
            .groupby("Churn Label")["Monthly Charges"]
            .mean()
            .reset_index()
        )

        fig = px.bar(
            monthly_avg,
            x="Churn Label",
            y="Monthly Charges",
            text="Monthly Charges"
        )

        fig.update_traces(
            texttemplate="$%{y:.2f}",
            textposition="outside"
        )

        st.plotly_chart(
            fig,
            use_container_width=True
        )

# ==================================================
# BUSINESS RECOMMENDATIONS
# ==================================================

st.divider()

st.subheader("💡 Business Recommendations")

st.markdown(
    """
1. Promote annual and two-year contracts through discounts and loyalty programs.

2. Encourage customers to adopt automatic payment methods instead of Electronic Check.

3. Improve customer support quality and responsiveness.

4. Launch targeted retention campaigns for high-risk customer segments.

5. Improve service competitiveness regarding speed, pricing, and bundled offerings.
"""
)

# ==================================================
# FOOTER
# ==================================================

st.markdown("---")

st.markdown(
"""
**Created by Vishal Kumar**

Tools Used: Python • SQL • Streamlit • Plotly • Pandas
"""
)
