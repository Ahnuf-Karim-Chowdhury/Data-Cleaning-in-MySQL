
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


select company, trim(company)
from staging_;
-- removing the white space from the `company`
update staging_ 
set company = trim(company);

-- serially checking the data colums of industry
select distinct industry
from staging_ order by 1;

-- sandardizing the data
UPDATE staging_
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';


-- checking the distinct locations for need of standardization
select distinct location
from staging_
order by 1;

-- checking the distinct country for need of standardization
select distinct country
from staging_
order by 1;

-- single period at the end of 'United States.' detected!. Standardizing that data..
select distinct country , trim(trailing '.' from country)
from staging_
order by 1;
-- the actual standardization
update staging_
set country = trim(trailing '.' from country)
where country like 'United States%';
-- check 
select distinct country
from staging_
order by 1;


-- Standardizing the data string to a date formate
select `date`,
str_to_date(`date`,'%m/%d/%Y')
from staging_;
-- the actual convertion
update staging_
set `date` = str_to_date(`date`,'%m/%d/%Y');
-- change the column type from text to date
alter table staging_
modify column `date` date;
-- check
select `date`
from staging_;


