/* 
Purpose: Validate data completeness and identify potential issues
before running final analysis.
*/

-- Check for missing mental health scores
SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN todep IS NULL THEN 1 ELSE 0 END) AS missing_phq,
  SUM(CASE WHEN tosc IS NULL THEN 1 ELSE 0 END) AS missing_scs,
  SUM(CASE WHEN toas IS NULL THEN 1 ELSE 0 END) AS missing_as
FROM students;

-- Check distribution of length of stay for international students
SELECT
  stay,
  COUNT(*) AS n
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay;