# Celebal-Final-Project


# **📁 ADLS Gen2 Multi-Format Data Load using SQL & Python (Databricks)**

## **📝 Project Overview**

This project demonstrates how to:
- Read **different file formats** from **Azure Data Lake Storage Gen2 (ADLS Gen2)**
- Use **both SQL and Python syntax** in **Azure Databricks**
- Load the files into **Managed Delta Tables**
- Validate that all Delta Tables contain **exactly 500 rows**

---

## **📌 Steps Followed**

### **A. Using SQL Syntax**
1. **Upload** random `customers` data (500 rows) to ADLS Gen2  
2. **Connect** ADLS Gen2 to Databricks using SQL
3. **Create Managed Delta Tables** using `CTAS`
    - Direct CTAS for formats: **AVRO, PARQUET, ORC, DELTA**
4. For formats like **CSV, TSV, JSON, XML, XLSX, TXT**:
    - Create a **Temporary View** with a defined schema
    - Use **CTAS** from the Temp View to create a Delta Table

### **B. Using Python Syntax**
1. **Upload** customers data to ADLS Gen2  
2. **Connect** ADLS Gen2 with Databricks using **Mount or Direct Path Access**
3. Read each file using appropriate **Spark DataFrame APIs**
4. **Create Managed Delta Tables** using Python
    - Direct write for **AVRO, PARQUET, ORC, DELTA**
    - For **CSV, TSV, JSON, XML, XLSX, TXT**, read → create temp view → CTAS Delta table

---

## **✅ Data Validation**

A **generic validation function** is created using both SQL and Python that:
- Verifies **row count = 500** for each Delta Table  
---

## **📂 File Formats Covered**

- **CSV**
- **TSV**
- **JSON**
- **XML**
- **XLSX**
- **TXT**
- **AVRO**
- **PARQUET**
- **ORC**
- **DELTA**

---

## **🧪 Technologies Used**

- Azure Data Lake Storage Gen2  
- Azure Databricks  
- Delta Lake  
- Apache Spark (SQL & PySpark)  
- Python  

---

