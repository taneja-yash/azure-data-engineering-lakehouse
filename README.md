# Azure Data Engineering Lakehouse Project

## 📌 Overview
This project demonstrates the end-to-end implementation of a **data engineering lakehouse architecture** using **Azure Data Factory, Databricks, Synapse Analytics, and Power BI**.  

The pipeline follows the **Bronze–Silver–Gold layered approach**:  
- **Bronze** → Raw data ingestion from GitHub into ADLS Gen2  
- **Silver** → Data cleansing and transformation in Databricks  
- **Gold** → Aggregated, query-optimized data exposed in Synapse Analytics for reporting in Power BI  

---

## 🗂️ Project Architecture
1. **Data Source**: CSV files stored on GitHub  
2. **Ingestion**: Azure Data Factory pipelines (parametrized for multiple files)  
3. **Storage**: Azure Data Lake Storage Gen2 with bronze, silver, and gold containers  
4. **Processing**: Databricks notebooks with service principal authentication  
5. **Serving Layer**: Synapse Analytics external tables and views  
6. **Visualization**: Power BI connected via serverless SQL endpoint  

---

## ⚙️ Step-by-Step Implementation

### 1. Data Upload & Preparation
- Uploaded raw CSV files to GitHub for ingestion.  

### 2. Azure Resource Setup
- Created **Resource Group**  
- Provisioned a **Storage Account** with three containers:  
  - `bronze` (raw data)  
  - `silver` (transformed data)  
  - `gold` (curated/aggregated data)  
- Created a **Data Factory**  

### 3. Data Ingestion with Azure Data Factory
- Built **CopyRawData pipeline** to pull data from GitHub into ADLS Gen2  
- Configured:  
  - **HTTP linked service** → GitHub data source  
  - **ADLS linked service** → Data Lake Storage  
- Developed a **dynamic pipeline** with JSON parameters, `foreach`, and `lookup` to ingest 10 CSV files automatically  
- Loaded raw files into the **bronze layer**  

### 4. Data Transformation with Databricks
- Created a **Databricks workspace**  
- Registered an **application in Entra ID (Azure AD)**  
  - Generated **client secret**  
  - Assigned **Storage Blob Contributor role** to the app for ADLS Gen2  
- Connected to ADLS Gen2 using **service principal (OAuth 2.0 client credentials)**  
- Created a Databricks **notebook** for transformations:  
  - Loaded CSV files from **bronze**  
  - Applied cleaning & transformations  
  - Saved outputs in **silver layer** as **Parquet files**  

### 5. Analysis in Databricks
Performed exploratory data analysis on sales data:  
- Orders per date  
- Distribution of sales per product category  

### 6. Serving Layer with Synapse Analytics
- Created a **Synapse workspace** with new storage  
- Enabled **Managed Identity** and IAM permissions for Synapse to access ADLS  
- Granted **Storage Blob Data Contributor** role for querying data  

**Steps inside Synapse:**  
1. Created **database schema** for gold layer  
2. Created **master key & scoped credential**  
3. Defined **external data sources** for silver and gold layers  
4. Created **external file format** (Parquet)  
5. Created **external tables** from silver data  
6. Built **views** using `OPENROWSET()` abstraction layer in gold schema  

### 7. Reporting with Power BI
- Exposed curated gold layer data through **serverless SQL endpoint**  
- Connected **Power BI** for interactive dashboards and reporting  

---

## 📊 Key Deliverables
- **Automated ingestion pipeline** (Data Factory with parametrization)  
- **Bronze–Silver–Gold layered storage design**  
- **Secure Databricks connection** using service principal auth  
- **Transformed and cleaned data in Parquet format**  
- **Exploratory analysis in Databricks**  
- **Synapse external tables and views for gold layer**  
- **Power BI reports** connected to Synapse serverless SQL endpoint  

---

## 🚀 Technologies Used
- **Azure Data Factory** – Data ingestion pipelines  
- **Azure Data Lake Storage Gen2** – Storage layers  
- **Azure Databricks** – Data transformation with Spark  
- **Azure Entra ID** – Authentication and permissions  
- **Azure Synapse Analytics** – Query serving and abstraction layer  
- **Power BI** – Data visualization and reporting  

---

## Author
Yash Taneja
- [LinkedIn](https://linkedin.com/in/yash-taneja-07) | [GitHub](https://github.com/taneja-yash)
