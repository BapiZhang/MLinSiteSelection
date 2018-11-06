drop table if exists ZSY_arpu_total_ptype_0;

create table ZSY_arpu_total_ptype_0

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,SUM(b.arpu) as arpu_total

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 0

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_arpu_total_ptype_1;

create table ZSY_arpu_total_ptype_1

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,SUM(b.arpu) as arpu_total

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 1

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_arpu_total_ptype_2;

create table ZSY_arpu_total_ptype_2

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,SUM(b.arpu) as arpu_total

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 2

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_brand_ratio_ptype_0;

create table ZSY_brand_ratio_ptype_0

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,count(1) as cnt,count(b.brand='华为')/cnt as huawei,count(b.brand='小米')/cnt as xiaomi,count(b.brand='苹果')/cnt as pingguo,count(b.brand='荣耀')/cnt as rongyao

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 0

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_brand_ratio_ptype_1;

create table ZSY_brand_ratio_ptype_1

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,count(1) as cnt,count(b.brand='华为')/cnt as huawei,count(b.brand='小米')/cnt as xiaomi,count(b.brand='苹果')/cnt as pingguo,count(b.brand='荣耀')/cnt as rongyao

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 1

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_brand_ratio_ptype_2;

create table ZSY_brand_ratio_ptype_2

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,count(1) as cnt,count(b.brand='华为')/cnt as huawei,count(b.brand='小米')/cnt as xiaomi,count(b.brand='苹果')/cnt as pingguo,count(b.brand='荣耀')/cnt as rongyao

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 2

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_gender_total_ptype_0;

create table ZSY_gender_total_ptype_0

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,count(b.gender = '01') as man,count(b.gender = '02') as faleman

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 0

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_gender_total_ptype_1;

create table ZSY_gender_total_ptype_1

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,count(b.gender = '01') as man,count(b.gender = '02') as faleman

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 1

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_gender_total_ptype_2;

create table ZSY_gender_total_ptype_2

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,count(b.gender = '01') as man,count(b.gender = '02') as faleman

from openlab.stay_poi a

inner join openlab.user_attribute b on a.uid=b.uid

where a.ptype = 2

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_user_Itime_total_temple;

create table ZSY_user_Itime_total_temple

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.uid,b.ltypec,sum(b.lflux / 1024 / 1024) as lflux

from openlab.stay_poi a

inner join openlab.label_codes b on a.lcode=b.lcode

group by a.uid,b.ltypec;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_Itime_total_ptype_0;

create table ZSY_Itime_total_ptype_0

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,sum(case b.ltypec = '01' then b.lflux else 0) as lflux_01,sum(case b.ltypec = '02' then b.lflux else 0) as lflux_02,sum(case b.ltypec = '03' then b.lflux else 0) as lflux_03

from openlab.stay_poi a

inner join ZSY_user_Itime_total_temple b on a.uid=b.uid

where a.ptype = 0

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_Itime_total_ptype_1;

create table ZSY_Itime_total_ptype_1

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,sum(case b.ltypec = '01' then b.lflux else 0) as lflux_01,sum(case b.ltypec = '02' then b.lflux else 0) as lflux_02,sum(case b.ltypec = '03' then b.lflux else 0) as lflux_03

from openlab.stay_poi a

inner join ZSY_user_Itime_total_temple b on a.uid=b.uid

where a.ptype = 1

group by a.final_grid_id;

-----------------------------------------------------------------------------------------------------

drop table if exists ZSY_Itime_total_ptype_2;

create table ZSY_Itime_total_ptype_2

row format delimited fields terminated by ',' Lines terminated by '\n' null defined as '' stored as textfile

as

select a.final_grid_id,sum(case b.ltypec = '01' then b.lflux else 0) as lflux_01,sum(case b.ltypec = '02' then b.lflux else 0) as lflux_02,sum(case b.ltypec = '03' then b.lflux else 0) as lflux_03

from openlab.stay_poi a

inner join ZSY_user_Itime_total_temple b on a.uid=b.uid

where a.ptype = 2

group by a.final_grid_id;

