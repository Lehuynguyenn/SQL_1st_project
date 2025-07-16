
## Technologies Used

*   **Database:** Microsoft SQL Server 2022
*   **Containerization:** Docker (to create a stable, reproducible environment)
*   **IDE:** Visual Studio Code with the official `mssql` extension

---
### Phase 1: Initial Request & Data Foundation
| File | Business Scenario & Purpose | Skills Demonstrated |
| :--- | :--- | :--- |
| **`01_create_schema.sql`** | **Problem:** The business has data in spreadsheets but no structured database. **Purpose:** To design and build the foundational database schema for storing supplier and order information. | **Database Design**, SQL DDL, Primary & Foreign Keys, Data Types. |
| **`02_insert_data.sql`** | **Problem:** Data needs to be loaded into the new database. **Purpose:** To simulate an ETL process by inserting raw data, including a known data quality error for later detection. | **ETL Simulation**, SQL `INSERT` statements. |
| **`03_initial_report.sql`** | **Problem:** The Supply Chain Manager asks, "Who are our suppliers and how many orders have we placed with them? Are they delivering on time?" **Purpose:** To create the first analytical report to answer the initial business question and establish a performance baseline. | **Business Analysis**, Aggregation, `JOIN`, `CASE` Statements. |
| **`04_data_fix_dml.sql`** | **Problem:** The initial report reveals a supplier is listed under two names ("ACME Corp" and "Acme Corporation"), making the report inaccurate. **Purpose:** To correct this data quality issue directly in the database. | **Database Operations**, **DML**, Data Maintenance, Bug Fixing. |
| **`05_final_report.sql`** | **Problem:** The manager is happy with the fix but now asks, "What is the average time it takes for a supplier to deliver an order?" **Purpose:** To enhance the initial report with a new, more specific KPI. | **Consultative Analysis**, Adapting to new requests, `DATEDIFF`. |

### Phase 2: Evolving the Solution for New Business Needs
| File | Business Scenario & Purpose | Skills Demonstrated |
| :--- | :--- | :--- |
| **`06_evolve_schema.sql`** | **Problem:** The Finance and Quality teams want to use the database, but it's missing crucial data points like product cost, order quantity, and quality checks. **Purpose:** To modify and expand the live database schema without losing existing data. | **Schema Evolution**, `ALTER TABLE`, `CREATE TABLE`. |
| **`07_load_expanded_data.sql`** | **Problem:** The new data from Finance and Quality needs to be loaded. **Purpose:** To perform a second ETL cycle, loading new product and quality data, and updating historical orders with quantity information. | **ETL**, `UPDATE`, `INSERT`. |
| **`08_cost_analysis_report.sql`** | **Problem:** The Supply Chain Manager now needs to understand spending: "What is the total monetary value of orders we have placed with each supplier?" **Purpose:** To create a financial report by joining three tables to calculate total order value. | **Complex Querying**, Financial Analysis. |
| **`09_quality_analysis_report.sql`** | **Problem:** The Quality Manager needs to identify problem suppliers: "What is the quality failure rate for each of our suppliers?" **Purpose:** To calculate a critical quality KPI, demonstrating the ability to handle division and data type casting for accurate metrics. | **KPI Calculation**, Data Type `CAST`ing for precision. |
| **`10_senior_insight_report.sql`** | **Problem:** Management needs a high-level, actionable number: "What is the total financial cost of failed goods from each supplier?" **Purpose:** To synthesize all available data (Suppliers, Orders, Products, Quality) to provide a deep, strategic insight that directly impacts the bottom line. | **Insight Generation**, 4-table join, Advanced Filtering. |

---

## Database Schema

The final, evolved database schema consists of four related tables:
*A simple ERD representing the relationships between Suppliers, Products, Orders, and QualityChecks.*

---

## How to Run This Project

### Prerequisites
1. Docker Desktop installed and running.
2. Visual Studio Code with the `SQL Server (mssql)` extension.
3. Git (for cloning).

### Setup Instructions
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Lehuynguyenn/SQL_1st_project.git
    cd SQL_1st_project
    ```
2.  **Start the SQL Server Container:**
    Run the following command in your terminal to create and start the MS SQL Server container. It is configured with 4GB of RAM for stability.
    ```bash
    docker run \
        -e "ACCEPT_EULA=Y" \
        -e "MSSQL_SA_PASSWORD=MyProject_2024!" \
        --memory 4g \
        -p 1433:1433 \
        --name mySqlServer \
        -d mcr.microsoft.com/mssql/server:2022-latest
    ```
3.  **Connect from VS Code:**
    - Open VS Code and use the SQL Server extension to connect.
    - **Server:** `localhost`
    - **Authentication:** SQL Login
    - **User:** `sa`
    - **Password:** `MyProject_2024!`
    - **Important:** Remember to check the "Trust server certificate" box.

4.  **Run the SQL Scripts:**
    Execute the `.sql` files in numerical order (from `01` to `10`) to build the database and replicate the full analysis workflow.