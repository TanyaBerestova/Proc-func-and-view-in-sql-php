
/*Второй вариант Берестова*/
/*   Представление   */
CREATE
SQL SECURITY INVOKER
VIEW view_var2
AS
SELECT
  `t`.`last_name` AS `teacher`,
  `c`.`course_name` AS `course`,
  `fc`.`min_duration` AS `min_duration`,
  `fc`.`faculty_id` AS `faculty`
FROM (((`teacher_course` `tc`
  JOIN `teacher` `t`
    ON ((`tc`.`teacher_id` = `t`.`teacher_id`)))
  JOIN `course` `c`
    ON ((`tc`.`course_id` = `c`.`course_id`)))
  JOIN `faculty_course` `fc`
    ON ((`fc`.`course_id` = `c`.`course_id`)))
ORDER BY CONCAT(`t`.`last_name`, ' ', `t`.`first_name`);

/*   Функция   */
CREATE FUNCTION function_var2 ()
RETURNS int(11)
SQL SECURITY INVOKER
BEGIN
  DECLARE count_st int;

  SELECT
    COUNT(s.student_id) INTO count_st
  FROM student_marks sm
    RIGHT JOIN student s
      ON sm.student_id = s.student_id
  WHERE mark IS NULL;

  RETURN count_st;
END;

  /*   Процедура  */
CREATE PROCEDURE procedure_var2 (IN t_id int(11), IN c_id int(11))
SQL SECURITY INVOKER
BEGIN

  SELECT
    fc.min_duration AS 'min_duration',
    f.faculty_name AS 'faculty'
  FROM faculty_course fc
    JOIN faculty f
      ON fc.faculty_id = f.faculty_id
    JOIN course c
      ON fc.course_id = c.course_id
    JOIN teacher_course tc
      ON c.course_id = tc.course_id
  WHERE tc.teacher_id = t_id
  AND tc.course_id = c_id;

END;
