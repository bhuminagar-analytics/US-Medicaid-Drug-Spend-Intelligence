# Medicaid Drug Spend Intelligence & Cost Optimization

### Healthcare Business Intelligence & Business Analysis Case Study

---

## Executive Overview

This project is an end-to-end Healthcare Business Intelligence and Business Analysis case study focused on analyzing U.S. Medicaid drug utilization and reimbursement trends using PostgreSQL and Power BI.

The solution was designed to simulate a real-world enterprise analytics lifecycle including:

- Business problem analysis
- Stakeholder-oriented documentation
- KPI governance
- SQL-based data engineering
- Process flow design
- Executive dashboard development
- Analytical storytelling
- Decision-support reporting

The final analytical framework transforms fragmented multi-year Medicaid reimbursement data into centralized business intelligence capable of supporting healthcare finance, operations, and strategic decision-making.

---

# Business Problem

Healthcare reimbursement systems generate massive amounts of utilization and payment data; however, organizations often struggle with:

- Limited visibility into rising pharmaceutical spending
- Difficulty identifying high-cost drugs and reimbursement concentration
- Fragmented reporting structures
- Lack of standardized KPI governance
- Limited state-level benchmarking
- Delayed operational decision-making

Without centralized analytics and reporting, stakeholders face challenges in understanding reimbursement trends, cost concentration, utilization efficiency, and operational risk areas.

This project addresses these challenges by building a structured healthcare analytics and business intelligence solution using SQL and Power BI.

---

# Business Objectives

## Primary Objectives

- Analyze Medicaid drug spending trends from 2016–2024
- Identify high-cost drugs contributing disproportionately to spend
- Compare reimbursement structures (MCOU vs FFSU)
- Evaluate state-level spending concentration
- Build executive-level KPI visibility
- Support healthcare cost optimization analysis

---

## Secondary Objectives

- Simulate a real-world business analysis lifecycle
- Build reusable SQL-based KPI architecture
- Demonstrate enterprise reporting workflows
- Develop healthcare analytical storytelling
- Create scalable dashboard architecture

---

# Stakeholders

| Stakeholder Group | Business Need |
|---|---|
| Healthcare Finance Teams | Cost visibility and reimbursement analysis |
| Medicaid Program Leadership | Spending trend monitoring |
| Operations Teams | Utilization analysis |
| Business Analysts | KPI governance and reporting |
| Executive Leadership | Strategic decision support |

---

# Enterprise Project Lifecycle

This project follows a structured enterprise analytics workflow:

```text
Business Problem Identification
        ↓
Project Charter
        ↓
Business Requirements Gathering
        ↓
Process Mapping & Workflow Analysis
        ↓
KPI Definition & Governance
        ↓
SQL Data Engineering & ETL
        ↓
Power BI Dashboard Development
        ↓
Analytical Insights & Executive Reporting

Business Analysis Deliverables

The project includes enterprise-style BA and BI documentation.

Deliverable	Purpose
Project Charter	Defines scope, objectives, stakeholders, and success criteria
Business Requirements Document (BRD)	Documents functional and analytical requirements
KPI Definition Document	Standardizes metric definitions and governance
Executive Summary	Summarizes analytical findings and business value
Lucidchart Process Flows	Visualizes workflows, architecture, and transformation lifecycle
Process Flow Diagrams
AS-IS vs TO-BE Transformation

Demonstrates the transition from fragmented reporting workflows to centralized healthcare business intelligence.

Business Analysis Workflow

Illustrates the end-to-end business analysis lifecycle followed throughout the project.

End-to-End Data & Analytics Workflow

Visualizes the transformation of raw CMS Medicaid data into analytical decision-support insights.

Dashboard Architecture & Data Pipeline

Shows the SQL-based analytical architecture and Power BI reporting pipeline.

SQL Data Engineering & KPI Architecture

The backend analytical workflow was developed using PostgreSQL.

SQL Workflow Included
Schema creation and staging setup
Multi-year Medicaid data ingestion
Data validation and quality checks
Suppression handling logic
Feature engineering
KPI aggregation views
Pareto analysis
Utilization-type analysis
State-level benchmarking
Suppression analytics
Key SQL Analytical Views
View	Purpose
analytics.kpi_yearly	Year-level KPI trends
analytics.kpi_state	State-level benchmarking
analytics.kpi_state_year	State × Year analysis
analytics.kpi_drug	Drug-level performance
analytics.kpi_drug_share	Spend concentration analysis
analytics.kpi_drug_pareto	Pareto analysis
analytics.kpi_utilization_type	MCOU vs FFSU comparison
analytics.kpi_suppression_year	Data suppression analysis
Power BI Dashboard

The Power BI dashboard was designed using executive-focused reporting principles emphasizing:

clarity
stakeholder readability
KPI storytelling
analytical consistency
decision-support visibility
Dashboard Pages
Page	Purpose
Executive Overview	High-level KPI visibility
Spending Trends	Longitudinal trend analysis
State Performance	Geographic benchmarking
Drug Analysis	Top cost drivers and Pareto analysis
Cost Drivers	Utilization and reimbursement insights
Data Quality	Suppression and governance analysis
Executive Overview Dashboard

Key Business Insights
Medicaid drug spending demonstrated a consistent upward trend from 2016–2024.
Managed Care (MCOU) contributed ~90%+ of total reimbursement expenditure.
A relatively small percentage of drugs contributed disproportionately to total spend.
California, New York, and Texas represented major reimbursement concentration states.
Average cost per prescription increased significantly over time.
Suppression logic and invalid geographic records required analytical governance and SQL transformation handling.
Challenges & Mitigation
Challenge	Mitigation
Partial-year 2025 data	Excluded from executive trend reporting
Suppressed reimbursement values	Managed through SQL transformation logic
Invalid XX geographic labels	Removed from state benchmarking visuals
Multi-year data inconsistency	Standardized through staging views
KPI standardization	Implemented KPI governance framework
Repository Structure
medicaid-drug-spend-intelligence/
│
├── 01_Project_Charter/
├── 02_Business_Requirements/
├── 03_KPI_Framework/
├── 04_Process_Flow_Diagrams/
├── 05_SQL_Data_Engineering/
├── 06_Data/
├── 07_PowerBI_Dashboard/
├── 08_Executive_Summary/
└── README.md
Tools & Technologies
Category	Technologies
Database	PostgreSQL
BI & Visualization	Power BI
Query Language	SQL
KPI Modeling	DAX
Process Mapping	Lucidchart
Documentation	BRD, Charter, KPI Governance
Dataset
Source

CMS Medicaid State Drug Utilization Data

Coverage
2016–2025
Multi-state reimbursement data
Medicaid utilization and spending records
Note

Raw CSV files are not included in this repository due to dataset size considerations and because the source data is publicly available through CMS/Medicaid.gov.

Future Enhancements

Potential future improvements include:

predictive analytics
forecasting models
drug category segmentation
provider-level analysis
automated refresh pipelines
advanced benchmarking
real-time reporting workflows
Conclusion

This project demonstrates a complete Healthcare Business Intelligence and Business Analysis lifecycle by integrating:

business analysis
KPI governance
SQL data engineering
Power BI dashboard development
analytical storytelling
executive reporting

The final solution transforms raw Medicaid reimbursement data into actionable healthcare business intelligence capable of supporting strategic and operational decision-making.

Author
Bhumi Nagar

Healthcare Analytics | Business Analysis | Business Intelligence

LinkedIn: https://www.linkedin.com/in/bhuminagar/
Notion: https://sulky-peripheral-8e9.notion.site/Medicaid-Drug-Spend-Intelligence-Project-Overview-29e777045f0946078d21fb7151ae8d07?source=copy_link
Lucidchart: https://lucid.app/lucidchart/1ee6c84f-65ac-4091-8731-5d99c68a3323/view