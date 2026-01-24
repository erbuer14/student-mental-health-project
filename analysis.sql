/* 
Goal: Understand how international students' mental health + social connectedness vary by length of stay.

Question: For international students only, how many students are in each "stay" group, and what are the average scores for PHQ (depression), SCS (social connectedness), and AS (acculturative stress)?

Notes/assumptions:
- inter_dom = 'Inter' identifies international students.
- stay represents length of stay in years.
- AVG() ignores NULLs by default; if scores can be missing, averages reflect only non-null responses.
*/

SELECT 
  stay,
  COUNT(*) AS count_int,
  ROUND(AVG(todep), 2) AS avg_phq,
  ROUND(AVG(tosc), 2) AS avg_scs,
  ROUND(AVG(toas), 2) AS avg_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;