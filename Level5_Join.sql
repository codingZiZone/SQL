# https://school.programmers.co.kr/learn/courses/30/lessons/131534

#first solution
select Year(S.SALES_DATE) as Year, month(S.SALES_DATE) as Month, count(distinct S.user_id) as purchased_users, 
        Round(count(distinct S.user_id)
               / (SELECT count(user_id) 
                  from user_info
                  where year(joined) = '2021'), 1) as PUCHASED_RATIO
from user_info U inner join Online_Sale S
on U.user_id = S.user_id
where year(U.joined) = '2021'
group by Year(S.SALES_DATE), month(S.SALES_DATE)
order by 1, 2;

# second solution
select year(SALES_DATE) as YEAR, month(SALES_DATE) as MONTH , 
        count(distinct user_id) as purchased_users,  
        Round(count(distinct user_id)
               / (SELECT count(user_id) 
                  from user_info
                  where year(joined) = '2021'), 1)
        as PUCHASED_RATIO
        
from online_sale
where user_id in (select user_id 
                 from user_info
                 where year(joined) ='2021')
                 
group by year(SALES_DATE), month(SALES_DATE);
