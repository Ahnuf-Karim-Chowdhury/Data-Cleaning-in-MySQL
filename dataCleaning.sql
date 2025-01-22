
select * 
from layoffs;

-- create a staging table for the clearing part 
create table staging 
like layoffs;

-- insertin the raw data
insert staging
select *
from layoffs;

select * 
from staging;
