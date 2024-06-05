# https://school.programmers.co.kr/learn/courses/30/lessons/157339

SELECT C.car_id, C.car_type, Round(C.daily_fee * 30 * (1-D.discount_rate * 0.01), 0) as FEE
from (select car_id, car_type, daily_fee
      from CAR_RENTAL_COMPANY_CAR
      where car_type in ('세단', 'suv')) as C
inner join
      (select car_type, discount_rate
       from CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
       where duration_type = '30일 이상') as D 
       on C.car_type = D.car_type
       
where # NOTICE: In WHERE, we can not use alias that was declared in SELECT
C.daily_fee * 30 * (1-D.discount_rate * 0.01) >= 500000 
and C.daily_fee * 30 * (1-D.discount_rate * 0.01) < 2000000
and C.car_id not in (select distinct car_id
       from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
       where (start_date <= '2022-11-30' And
       end_date >= '2022-11-01')) 
order by 3 desc, 2, 1 desc
;
