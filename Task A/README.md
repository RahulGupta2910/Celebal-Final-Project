# Read Different File Formats from ADLS Gen2 Using SQL in Azure Databricks

This project demonstrates how to:
- Load sample customer data into **Azure Data Lake Storage Gen2 (ADLS Gen2)**
- Convert CSV into various file formats using **Azure Data Factory (ADF)**
- Mount ADLS containers in **Azure Databricks**
- Use **SQL and PySpark** to read different file formats
- Create **managed Delta tables** (not external)
- Perform data **validation** with a reusable function

---

## Project Overview

- **Data Source:** 500 customer records in `customers.csv`
- **Target Formats:** CSV, TSV, JSON, XML, XLSX, TXT, AVRO, PARQUET, ORC, DELTA
- **Storage:** ADLS Gen2 with containers for raw and converted data
- **ETL Tool:** Azure Data Factory
- **Processing:** Azure Databricks (SQL + PySpark)

---

## Sample Data

**File:** `customers.csv`  
**Rows:** 500  
**Columns:**
- `CustomerID`
- `FirstName`
- `LastName`
- `Email`
- `Phone`
- `City`
- `Country`

---

## Azure Resources

- **Resource Group:** `customerdata-rg-final`
- **Storage Account:** ADLS Gen2 (Hierarchical Namespace Enabled)
- **Containers:**
  - `raw-data`: for original `customers.csv`
  - `converted`: for format-converted files

---

## Azure Data Factory (ADF)

### Linked Services

- **Name:** `LS_ADLSGen2`
- **Type:** Azure Data Lake Gen2
- **Authentication:** Shared Access Signature (SAS)

### Pipeline: `CSV_Conversion_Pipeline`

- **Purpose:** Convert CSV to:
  - `Parquet → /converted/parquet/`
  - `Avro → /converted/avro/`
  - `ORC → /converted/orc/`

> Delta conversion was not handled in ADF, and was instead done in Databricks.

---

## Azure Databricks

### Workspace & Cluster

- Created and configured with **Databricks Runtime supporting Delta, XML, and Excel packages**

### Mount ADLS Gen2 Containers

```python
dbutils.fs.mount(
  source="wasbs://raw-data@<your_storage_account>.blob.core.windows.net/",
  mount_point="/mnt/raw-data",
  extra_configs={"<conf_key>": "<sas_token>"}
)

dbutils.fs.mount(
  source="wasbs://converted@<your_storage_account>.blob.core.windows.net/",
  mount_point="/mnt/converted",
  extra_configs={"<conf_key>": "<sas_token>"}
)
```
## Technologies Used

-Azure Data Lake Storage Gen2
-Azure Data Factory
-Azure Databricks
-Apache Spark (SQL + PySpark)
-Delta Lake
-Avro, Parquet, ORC, JSON, XML, XLSX, TXT, CSV, TSV

