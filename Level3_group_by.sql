# https://school.programmers.co.kr/learn/courses/30/lessons/157340

select car_id, 
if (sum(case when start_date <= '2022-10-16' and
          end_date >= '2022-10-16'
          then 1
          else 0 end) > 0, '대여중', '대여 가능') as AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
group by car_id
order by 1 desc;
