# https://school.programmers.co.kr/learn/courses/30/lessons/59045

SELECT O.animal_id, O.animal_type, O.name
from animal_ins I inner join animal_outs O on I.animal_id = O.animal_id
where I.SEX_UPON_INTAKE like 'intact%' and 
(O.SEX_UPON_OUTCOME like 'spayed%' or O.SEX_UPON_OUTCOME like 'neutered%')
order by 1;
