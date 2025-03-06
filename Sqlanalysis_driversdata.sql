create database driversdata;

select * from drivers_data;
describe drivers_data;

update drivers_data
set date_registration = str_to_date(date_registration, '%m/%d/%Y');

alter table drivers_data
modify column date_registration date;
alter table drivers_data change ï»¿id_driver id_drivers int;

/*TOTAL NO.OF DRIVERS REGISTERED*/
select count(id_drivers) from drivers_data;
/*DRIVERS REGISTERED BY COUNTRY*/
select country, count(id_drivers) from drivers_data
group by country;

/*service type*/
select service_type from drivers_data
group by service_type;
/*total no.of taxis and phv*/
select service_type,count(id_drivers) from drivers_data
group by service_type;
/*country wise taixs and phv*/
select country,service_type,count(service_type) from drivers_data
group by country,service_type;

/*MARKET RECEIVING*/
/*no.of drivers receiving marketing and no.of drivers not receiving marketing*/
select receive_marketing,count(id_drivers) from drivers_data
group by receive_marketing;
/*count of receiving marketing by country*/
select country,receive_marketing,count(id_drivers) from drivers_data
group by country,receive_marketing;
/*total Percentage of drivers receiving marketing*/
select count(case when receive_marketing = 'True' then 1 end)*100.0 / nullif(count(*),0) as percentage_receiving_marketing from drivers_data;
/*percentage of drivers receiving marketing by country*/
select country,count(case when receive_marketing = 'True' then 1 end)*100.0 / nullif(count(*),0) as percentage_receiving_marketing from drivers_data
group by country;
/*percentage of drivers receiving marketing by service type*/
select service_type,count(case when receive_marketing = 'True' then 1 end)*100.0 / nullif(count(*),0) as percentage_receiving_marketing from drivers_data
group by service_type;

/*DRIVERS REGISTRATIONS SECTION*/
/*DRIVERS REGISTERED BY YEAR 2011-2020)*/
select year(date_registration)as registered_year,count(*) as no_of_drivers_registered from drivers_data
group by year(date_registration)
order by registered_year;
/*DRIVERS REGISTERD BY MONTH 2011-2020)*/
select year(date_registration)as registered_year,month(date_registration)as registered_month,count(*) as no_of_drivers_registered from drivers_data
group by year(date_registration),month(date_registration)
order by registered_year,registered_month;
/*DRIVERS REGISTERED BY SERVICE TYPE*/
select year(date_registration)as registered_year,service_type,count(*) as no_of_drivers_registered from drivers_data
group by year(date_registration),service_type
order by registered_year;
/*DRIVERS REGISTERED BY COUNTRY*/
select year(date_registration)as registered_year,country,count(*) as no_of_drivers_registered from drivers_data
group by year(date_registration),country
order by registered_year;




