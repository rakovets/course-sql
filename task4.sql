SELECT * FROM academy1.department;


#  1Вывести номера корпусов, если суммарный фонд финансирования расположенных в них кафедр превышает 100000.

select building , financing from
department
where financing >10000;


#  2Вывести названия групп 5-го курса кафедры “Software
#Development”, которые имеют более 10 пар в первую неделю.

select * from 
`groups` g
JOIN groupslectures gl on  g.group_id = gl.groups_id
join lectures le on le.lectures_id = gl.lecture_id
WHERE year = 5;


#  3Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) больше, чем рейтинг группы
#  “D221”

SELECT  *
FROM `student` s 
JOIN groupsstudents gs on  gs.student_id = s.student_id
JOIN groups g on g.group_id = gs.groups_id;


#   4Вывести фамилии и имена преподавателей, ставка которых
#  выше средней ставки профессоров

SELECT 
    name, surname, salary / 100 * 5
FROM
    teachers
WHERE
    IsProfessor = 0 AND salary > 1000;
    

#   5Вывести названия групп, у которых больше одного куратора.

SELECT *
from `groups` g
join groupscurators gs on gs.groups_id = g.group_id
JOIN curator c on c.curator_id = gs.curator_id
ORDER BY groups_id ;









