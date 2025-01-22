
select * 
from layoffs;

drop table staging;
-- create a staging table for the clearing part 
create table staging 
like layoffs;

-- inserting the raw data
insert staging
select *
from layoffs;

select * 
from staging;

-- creating a new table `staging_` and adding a new field `row_no` to get the values of data occurrences with in the dataSet 
CREATE TABLE `staging_` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_no` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- select * from staging_;

-- inserting data into `staging_` table by partitioning each data segment 
insert into staging_
select * ,
row_number() over(
partition by 
company,
location,
industry,
total_laid_off,
percentage_laid_off,
`date`,
stage,
country,
funds_raised_millions) as row_no
from staging;

-- checking for duplicate data. the data has duplicate if it as more than 1 in the "row_no" column
select * 
from staging_ 
where row_no>1;

-- DELETING THE DUPLICATE DATA
delete 
from staging_ 
where row_no>1;

-- checking the complete data table  "staging_"
select * 
from staging_;







