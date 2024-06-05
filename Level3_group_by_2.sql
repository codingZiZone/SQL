# https://school.programmers.co.kr/learn/courses/30/lessons/151139

select *
from(
        select month(start_date) as Month, car_id, count(*) as records
        from CAR_RENTAL_COMPANY_RENTAL_HISTORY
        where car_id in (select distinct car_id 
                        from CAR_RENTAL_COMPANY_RENTAL_HISTORY
                         where start_date between '2022-08-01' and '2022-10-31'
                        group by car_id having count(history_id) >= 5) 
        and start_date between '2022-08-01' and '2022-10-31'
        group by month(start_date),  car_id
        order by 1 , 2 desc
            ) as H
    where H.records > 0 ;

