## https://school.programmers.co.kr/learn/courses/30/lessons/131124

# first solution
SELECT member_name,  review_text, date_format(REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
from MEMBER_PROFILE inner join (select member_id, review_text, REVIEW_DATE
                                from rest_review
                                where member_id = (select member_id 
                                from rest_review 
                                group by MEMBER_ID 
                                order by count(*) desc 
                                limit 1)) as rest_review
															# rest_review 테이블을 count(*)순 (리뷰 개수) 으로
															# 내림차 정렬해서 limit 1 걸고 가장 많이 리뷰쓴 member_id
															# 를 서브쿼리로 가져와서 where 을 걸어준 rest_review 와 조인

                    on  MEMBER_PROFILE.member_Id = rest_review.member_id
order by REVIEW_DATE, REVIEW_TEXT;


# second solution
SELECT member_name,  review_text, date_format(REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
from member_profile M inner join rest_review R on M.member_id = R.member_id
where m.member_id = (select member_id 
                   from rest_review
                   group by member_id 
                   order by count(*) desc
                   limit 1
                  )
order by 3, 2
;

# 가장 많은 리뷰 개수를 가지는 아이들 중 (실제로 예시 테이블에서 count(*) = 3인 애들이 세 명임) 
# **한 명만** 출력하게 되는 이슈가 있다.

# Third solution
SELECT member_name,  review_text, date_format(REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
from member_profile M inner join rest_review R on M.member_id = R.member_id
where m.member_id in (select member_id 
                   from rest_review
                    group by member_id 
                    having count(*) = (select count(*)
                                      from rest_review
                                      group by member_id 
                                      order by count(*) desc
                                      limit 1
                                      ))
								# 메인 쿼리의 멤버 아이디 in
								# 섭쿼리의 섭쿼리에서 리뷰의 max 개수를 섭쿼리에 돌려주고
								# 섭쿼리에선 그 개수와 동일한 member_id를 메인쿼리에 돌려주고,
								# 메인에선 그 member_id 와 동일한 아이들을 받아서 보여줌.
                   
order by 3, 2
;

