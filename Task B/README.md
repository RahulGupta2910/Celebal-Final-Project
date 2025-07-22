# Read Different File Formats from ADLS Gen2 Using Python in Azure Databricks

This project demonstrates how to:
- Load sample customer data into **Azure Data Lake Storage Gen2 (ADLS Gen2)**
- Convert CSV into various file formats using **Python in Azure Databricks**
- Mount ADLS containers in **Azure Databricks**
- Use **PySpark (Python)** to read different file formats
- Create **managed Delta tables** (not external)
- Perform data **validation** using a generic reusable Python function

---

## Project Overview

- **Data Source:** 500 customer records in `customers.csv`
- **Target Formats:** CSV, TSV, JSON, XML, XLSX, TXT, AVRO, PARQUET, ORC, DELTA
- **Storage:** ADLS Gen2 with containers for raw and converted data
- **ETL & Processing:** Entirely in Azure Databricks using **PySpark**

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
  - `converted`: for format-converted files in AVRO, PARQUET, ORC, etc.

---

## Azure Databricks

### Workspace & Cluster

- Created and configured with **Databricks Runtime supporting Delta, XML, and Excel libraries**
- Python-based notebooks developed for ETL and validation logic

---

### Mount ADLS Gen2 Containers

```python
dbutils.fs.mount(
  source="wasbs://raw-data@<your_storage_account>.blob.core.windows.net/",
  mount_point="/mnt/raw-data",
  extra_configs={"fs.azure.account.key.<your_storage_account>.blob.core.windows.net": dbutils.secrets.get(scope="myscope", key="adls_key")}
)

dbutils.fs.mount(
  source="wasbs://converted@<your_storage_account>.blob.core.windows.net/",
  mount_point="/mnt/converted",
  extra_configs={"fs.azure.account.key.<your_storage_account>.blob.core.windows.net": dbutils.secrets.get(scope="myscope", key="adls_key")}
)
```


## Technologies Used

- Azure Data Lake Storage Gen2
- Azure Data Factory
- Azure Databricks
- Apache Spark (SQL + PySpark)
- Delta Lake
- Avro, Parquet, ORC, JSON, XML, XLSX, TXT, CSV, TSV
