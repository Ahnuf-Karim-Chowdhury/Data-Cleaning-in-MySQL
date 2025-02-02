# Data Cleaning in SQL: A Comprehensive Guide 💻🧹

Welcome! 🚀 This repository contains various SQL scripts and solutions to perform **data cleaning** operations using SQL. It's designed to help you clean and standardize data, remove duplicates, handle `NULL` values, and delete unnecessary rows and columns. Let's dive into the features of this project! 👇

---

## Table of Contents 📚

- [Features](#features)
- [Development Stage](#development-stage)
- [Duplicate Data Deletion](#duplicate-data-deletion)
- [Standardizing Data](#standardizing-data)
- [Handling NULL Data](#handling-null-data)
- [Unnecessary Row Column_Deletion](#unnecessary-row-column-deletion)
- [License](#license)

---

## Features 🌟

This repository includes 5 main branches with their features mentioned under them, each corresponding to a specific type of data cleaning operation:

### Development-Stage 🚧
- Contains the full developmental and final code of the dataCleaning Project.

### **Feature-01_Duplicate_Data_Deletion** ❌🔄
- Eliminates duplicate records by identifying rows with repeated data.
  
### **Feature-02_Standardizing_data** 🔧🎨
- Standardizes data such as company names, countries, and date formats.

### **Feature-03_Handling_NULL_data** 🚫🤔
- Deals with `NULL` values by filling them in with relevant data or removing them.

### **Feature-04_Unnecessary_Row_Column_Deletion** 🗑️
- Removes unnecessary rows and columns to optimize your dataset.

---

## Development-Stage 🚧

The **Development-Stage** branch contains the full code, incorporating all of the features mentioned above. It offers a step-by-step breakdown of the entire data cleaning process, from importing raw data to performing all necessary clean-up tasks.


## Duplicate Data Deletion 🔄❌
In this part duplicate data are identified and deleted from the dataset layoffs.csv. 
For example :
```sql
-- Identifying duplicate records
select * from staging_ where row_no>1;
-- Deleting duplicate data
delete from staging_ where row_no>1;
```
- Using the **ROW_NUMBER()** function to identify and delete duplicate rows.
## Standardization of Data 🎨📝
In this part data are structured and standardized for better use cases. 
As one of the columns from the dataset layoffs.csv was named `date` was the object type of `text` which was modified 
to be a `DATE` type column and some other data were also standardized for a cleaner data analysis.

For example :
```sql
-- Standardizing industry names
UPDATE staging_ SET industry = 'Crypto' WHERE industry LIKE 'Crypto%';
```
- Standardizing company names, location names, countries, and date formats.

## Handling NULL Data 🚫🤷‍♂️
In this part the null values are populated by considering the common valid values of different rows with same or similar data.

For example:
```sql
-- Handling NULL values
update staging_ set industry = null where industry = '';

```
- Identifying and handling NULL or empty string values.

## Unnecessary Row/Column Deletion 🗑️🚪
Unnecessary rows/columns were deleted in this part.
As in the previous "Duplicate Data Deletion" segment `row_no` row was created which served its purpose and now is rendered unnecessary was deleted at the
end of the project.

For example:
```sql
-- Dropping unnecessary columns
alter table staging_ drop column row_no;
```
- Removing any unnecessary columns or rows that might affect data quality.

## License 📜

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](./LICENSE) file for details.
