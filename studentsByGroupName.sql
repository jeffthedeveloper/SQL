SELECT
  course_name,
  COUNT(student_id) AS number_of_students
FROM
  students
GROUP BY
  course_name;
