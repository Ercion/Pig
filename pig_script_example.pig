/* 
Multiline comment 
In Pig Scripts
*/

--Load dataset with column names and datatypes
location_records = LOAD '/data1' USING PigStorage(',') as (truckid:chararray, driverid:chararray, event:chararray, latitude:chararray, longitude:chararray, city:chararray, state:chararray, velocity:int, event_ind:int, idling_ind int);


--Group records by city
grp_by_sym = GROUP location_records BY city;

--Calculate maximum closing price
event_count = FOREACH grp_by_sym GENERATE group, COUNT(location_records.event) as event_count;

--Store output
STORE event_count INTO 'output/pig/data1' USING PigStorage(',');