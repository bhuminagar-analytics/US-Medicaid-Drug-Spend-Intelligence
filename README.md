# 🏥 US Medicaid Drug Spend Intelligence
### Healthcare Business Analysis & Cost Optimization

> A full end-to-end BA project lifecycle — analyzing 10 years of U.S. Medicaid drug utilization data across 50+ states to identify pharmaceutical cost drivers, reimbursement patterns, and cost optimization opportunities for Medicaid Managed Care Organizations (MCOs).

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Bhumi_Nagar-0077B5?style=flat&logo=linkedin)](https://www.linkedin.com/in/bhuminagar/)
[![Portfolio](https://img.shields.io/badge/Notion-Portfolio-000000?style=flat&logo=notion)](https://sulky-peripheral-8e9.notion.site/Bhumi-Nagar-92e5984d31d8431c9515836eeaaf883e?source=copy_link)
[![Lucidchart](https://img.shields.io/badge/Lucidchart-Process_Flows-F97924?style=flat&logo=lucidchart)](https://lucid.app/lucidchart/1ee6c84f-65ac-4091-8731-5d99c68a3323/view)

---

## 📌 Project Overview

| Item | Details |
|---|---|
| **Project Type** | Healthcare Business Analysis & Business Intelligence |
| **Stakeholder** | Medicaid Managed Care Organization (MCO) — Payer Analytics Team |
| **Data Source** | CMS Medicaid State Drug Utilization Data (Medicaid.gov) |
| **Data Coverage** | 2016–2024 · 17,000+ drug utilization records · 50+ states · MCOU & FFSU |
| **Tools** | PostgreSQL · Power BI · Lucidchart · MS Word |
| **Prepared By** | Bhumi Nagar — Business Analyst |

---

## 🎯 Business Problem

Medicaid managed care organizations face a critical visibility gap: pharmaceutical spending continues to rise year-over-year, yet most payer analytics teams lack the structured infrastructure to understand what is actually driving those costs.

**Specific gaps this project addresses:**

- No visibility into which drugs are driving the majority of pharmaceutical spend
- No structured understanding of how spending has trended over 10 years
- No state-level benchmarking to identify geographic outliers and high-cost markets
- No analysis of whether cost increases are driven by price inflation or utilization volume
- No comparison of spend efficiency between Managed Care (MCOU) and Fee-for-Service (FFSU)

---

## 🏢 Stakeholder Analysis

| Stakeholder | Business Need |
|---|---|
| MCO Payer Analytics Team | Cost visibility, formulary management, rebate negotiation |
| Medicaid Program Leadership | Spending trend monitoring and program performance |
| Finance & Operations Teams | Budget planning and utilization efficiency |
| Pharma Market Access Teams | Drug positioning and formulary access strategy |
| Executive Leadership | Strategic cost optimization and decision support |

---

## 🎯 Business Objectives

**Primary Objectives:**

- Analyze Medicaid drug spending trends across 2016–2024
- Identify high-cost drugs contributing disproportionately to total spend
- Compare reimbursement model efficiency — MCOU vs FFSU
- Evaluate state-level spending concentration and geographic outliers
- Build an executive-level KPI visibility and reporting framework
- Deliver actionable cost optimization recommendations

**Secondary Objectives:**

- Simulate a real-world end-to-end business analysis lifecycle
- Build reusable SQL-based KPI architecture
- Demonstrate healthcare analytical storytelling
- Create scalable dashboard architecture for ongoing monitoring

---

## 📦 BA Deliverables

| # | Deliverable | Description | Status |
|---|---|---|---|
| 1 | Project Charter | Scope, objectives, stakeholders, success metrics, risks | ✅ Complete |
| 2 | Business Requirements Document | FR-001 to FR-021, NFR-001 to NFR-005, acceptance criteria | ✅ Complete |
| 3 | KPI Definition Document | 15 KPIs across 6 categories — formulas, business context, interpretation | ✅ Complete |
| 4 | Process Flow Diagrams | 4 Lucidchart diagrams — As-Is/To-Be, BA Workflow, Data Workflow, Pipeline | ✅ Complete |
| 5 | SQL Data Pipeline | PostgreSQL: Raw → Staging → Enriched → Analytics (11 KPI views) | ✅ Complete |
| 6 | Power BI Dashboard | 6-page executive dashboard — screenshots included | ✅ Complete |
| 7 | Executive Summary | Business-ready findings and recommendations | ✅ Complete |

---

## 🔄 Enterprise Project Lifecycle

```text
Business Problem Identification
        ↓
Project Charter
        ↓
Business Requirements Gathering (BRD)
        ↓
Process Mapping & Workflow Analysis (Lucidchart)
        ↓
KPI Definition & Governance Framework
        ↓
SQL Data Engineering & ETL Pipeline
        ↓
Power BI Dashboard Development
        ↓
Analytical Insights & Executive Reporting
```

---

## 🏗️ Solution Architecture

```text
Raw CSV Files (CMS Medicaid.gov — 2016–2024)
        ↓
PostgreSQL — Raw Schema
raw.medicaid_drug_utilization
        ↓
Staging Layer — staging.medicaid_clean
(cleaning · standardization · suppression handling · XX exclusion)
        ↓
Enriched Layer — staging.medicaid_enriched
(Cost/Rx · Cost/Unit · Units/Rx · Medicaid Dependency Ratio)
        ↓
Analytics Layer — 11 KPI Views
kpi_yearly · kpi_state · kpi_state_year · kpi_drug · kpi_drug_share
kpi_drug_pareto · kpi_utilization_type · kpi_suppression_year
kpi_suppression_state · kpi_suppression_utilization_type · kpi_suppressed_drug
        ↓
Power BI Semantic Layer
(Data Modeling · Relationships · DAX Measures · KPI Cards)
        ↓
6-Page Executive Dashboard
```

---

## 📊 KPI Framework

| Category | KPIs |
|---|---|
| **Financial** | Total Spend · Medicaid Spend · Non-Medicaid Spend |
| **Utilization** | Total Prescriptions · Total Units |
| **Efficiency** | Avg Cost per Prescription · Avg Cost per Unit · Avg Units per Prescription |
| **Dependency** | Medicaid Dependency Ratio |
| **Concentration** | Spend Share · Prescription Share · Cumulative Spend Share (Pareto) |
| **Data Quality** | Suppression Rate · Suppressed Rows · Non-Suppressed Rows |

---

## 🔑 Key SQL Analytical Views

| View | Purpose |
|---|---|
| `analytics.kpi_yearly` | Year-level KPI trends — spend, prescriptions, units |
| `analytics.kpi_state` | State-level benchmarking across 50+ jurisdictions |
| `analytics.kpi_state_year` | State × Year combined analysis |
| `analytics.kpi_drug` | Drug-level spend and utilization performance |
| `analytics.kpi_drug_share` | Spend share and prescription share by drug |
| `analytics.kpi_drug_pareto` | Cumulative spend share — Pareto 80/20 analysis |
| `analytics.kpi_utilization_type` | MCOU vs FFSU reimbursement comparison |
| `analytics.kpi_suppression_year` | Year-level suppression analysis |
| `analytics.kpi_suppression_state` | State-level suppression analysis |
| `analytics.kpi_suppression_utilization_type` | Suppression by reimbursement model |
| `analytics.kpi_suppressed_drug` | Drug-level suppression tracking |

---

## 📈 Power BI Dashboard

> 📸 Screenshots available in `07_PowerBI_Dashboard/screenshots/`
> 📄 Dashboard details available in `07_PowerBI_Dashboard/README_dashboard.md`

| Page | Focus Area |
|---|---|
| 1 — Executive Overview | KPI cards · Spend trend · MCOU vs FFSU · Top 10 drugs · State treemap |
| 2 — Spending Trends | 10-year YoY analysis · Prescription & unit growth trends |
| 3 — State Performance | 50+ state benchmarking · Cost/Rx by state · Geographic outliers |
| 4 — Drug Analysis | Drug-level Pareto · Spend share · Cost efficiency by drug |
| 5 — Cost Drivers | Price vs volume decomposition · Reimbursement model comparison |
| 6 — Data Quality | Suppression rates by year, state, and utilization type |

---

## 🔍 Key Findings

| # | Finding | Insight |
|---|---|---|
| 01 | **Cost Concentration** | ~20% of drugs drive ~80% of total Medicaid pharmaceutical spend — classic Pareto 80/20 concentration pattern |
| 02 | **Spending Growth** | Consistent upward trend 2016–2024 · $1.5T total spend across the period |
| 03 | **Managed Care Dominance** | ~90%+ of total expenditure flows through Managed Care (MCOU) — structural dependency confirmed |
| 04 | **Geographic Concentration** | CA, NY, and TX account for disproportionate share of total Medicaid spend |
| 05 | **Price-Driven Cost Growth** | Avg cost per prescription = $307 — rising faster than volume, confirming price-driven increases |
| 06 | **Data Quality** | Suppression rates vary by year, state, and utilization type — documented and managed via SQL logic |

---

## 💡 Business Recommendations

1. **Target high-cost drug tier for formulary review** — top 20% of drugs driving 80% of spend should be prioritized for formulary management, therapeutic substitution, and rebate negotiation
2. **Investigate price-driven cost growth** — avg cost/Rx at $307 rising faster than prescription volume — assess pricing agreements and benchmark against rebate standards
3. **Geographic cost containment strategy** — CA, NY, and TX require state-specific formulary and utilization management programs
4. **Evaluate MCOU vs FFSU efficiency** — with 90%+ of spend through managed care, benchmark cost-per-prescription performance between both models
5. **Deploy continuous KPI monitoring** — quarterly tracking of spend trends, cost/Rx, and Pareto concentration to enable proactive cost management

---

## ⚠️ Challenges & Mitigation

| Challenge | Impact | Mitigation |
|---|---|---|
| Partial-year 2025 data | Misleading trend | Excluded from all executive trend visuals — documented in Data Quality page |
| Suppressed reimbursement records | Incomplete calculations | Managed via SQL CASE logic — NULLs applied, tracked via suppression KPI views |
| Invalid geographic labels ('XX') | Distorted state analysis | Excluded from geographic visuals — documented as unclassified jurisdictions |
| Multi-year data inconsistency | Reporting inconsistency | Standardized through staging views and column normalization |
| Decimal overflow in Power BI | Import instability | Managed through controlled data type formatting and load sequencing |

---

## ⚠️ Limitations

- Analysis limited to publicly available CMS aggregated data — no patient-level identifiers available
- 2025 data excluded from trend analysis due to partial-year reporting
- Suppressed records excluded from spend calculations — total spend may be slightly understated
- Drug therapeutic classification not available in source data — analysis at product name level only
- Gross reimbursement rates used throughout — net spend after manufacturer rebates not reflected

---

## 🛠️ Tech Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=mysql&logoColor=white)
![Lucidchart](https://img.shields.io/badge/Lucidchart-F97924?style=flat&logo=lucidchart&logoColor=white)
![Microsoft Word](https://img.shields.io/badge/Microsoft_Word-2B579A?style=flat&logo=microsoftword&logoColor=white)

---

## ⚙️ How to Run the SQL

**Prerequisites:**

- PostgreSQL 13+
- pgAdmin or any PostgreSQL client
- CMS Medicaid CSV files (2016–2024) downloaded from Medicaid.gov

**Steps:**

```sql
-- Step 1: Create raw schema and import yearly CSV files using COPY command
-- Step 2: Run staging clean view — handles suppression logic and XX exclusion
-- Step 3: Run enriched layer — creates 4 derived KPI metrics
-- Step 4: Run all 11 analytics KPI views in sequence

-- Full script: 05_SQL_Data_Engineering/Medicaid_Analysis.sql
-- Pipeline overview: 05_SQL_Data_Engineering/SQL_Pipeline_Overview.pdf
```

---

## 📁 Repository Structure

```text
medicaid-drug-spend-intelligence/
│
├── README.md
│
├── 01_Project_Charter/
│   └── Project_Charter.pdf
│
├── 02_Business_Requirements/
│   └── Business_Requirements_Document.pdf
│
├── 03_KPI_Framework/
│   └── KPI_Definition_Document.pdf
│
├── 04_Process_Flow_Diagrams/
│   ├── As_Is_To_Be.png
│   ├── Business_Analysis_Workflow.png
│   ├── End_to_End_Data_Workflow.png
│   └── Dashboard_Architecture_Pipeline.png
│
├── 05_SQL_Data_Engineering/
│   ├── Medicaid_Analysis.sql
│   └── SQL_Pipeline_Overview.pdf
│
├── 06_Data/
│   └── README_data.md
│
├── 07_PowerBI_Dashboard/
│   ├── README_dashboard.md
│   └── screenshots/
│       ├── 01_Executive_Overview.png
│       ├── 02_Spending_Trends.png
│       ├── 03_State_Performance.png
│       ├── 04_Drug_Analysis.png
│       ├── 05_Cost_Drivers.png
│       └── 06_Data_Quality.png
│
└── 08_Executive_Summary/
    └── Executive_Summary.pdf
```

---

## 📂 Data Source

| Item | Details |
|---|---|
| **Dataset** | CMS Medicaid State Drug Utilization Data |
| **Source** | [Medicaid.gov — State Drug Utilization Data](https://www.medicaid.gov/medicaid/prescription-drugs/state-drug-utilization-data/index.html) |
| **Coverage** | 2016–2024 · 50+ U.S. states + jurisdictions |
| **Records** | 17,000+ drug utilization records across 10 yearly files |
| **Models** | MCOU (Managed Care) · FFSU (Fee-for-Service) |

> Raw data files are not included in this repository.
> All datasets are publicly available and can be downloaded directly from Medicaid.gov.
> Full data source details are documented in `06_Data/README_data.md`

---

## 🚀 Future Enhancements

- Predictive analytics and spend forecasting models based on historical trend patterns
- Drug therapeutic category segmentation (requires external classification data)
- Year-over-Year (YoY) growth percentage KPI for automated trend reporting
- Rebate-adjusted spend analysis — net cost after manufacturer rebates
- Beneficiary-level per-member-per-month (PMPM) cost metrics
- Automated Power BI refresh pipeline for real-time monitoring
- Advanced state efficiency index — composite benchmarking metric

---

## 🔗 Connect

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Bhumi_Nagar-0077B5?style=flat&logo=linkedin)](https://linkedin.com/in/bhuminagar)
[![Portfolio](https://img.shields.io/badge/Notion-Portfolio-000000?style=flat&logo=notion)](https://sulky-peripheral-8e9.notion.site/Medicaid-Drug-Spend-Intelligence-Project-Overview-29e777045f0946078d21fb7151ae8d07)
[![Lucidchart](https://img.shields.io/badge/Lucidchart-Process_Flows-F97924?style=flat&logo=lucidchart)](https://lucid.app/lucidchart/1ee6c84f-65ac-4091-8731-5d99c68a3323/view)

---

*Prepared by Bhumi Nagar · Business Analyst · MBA, Business Analytics (STEM) · Saint Peter's University · April 2026*