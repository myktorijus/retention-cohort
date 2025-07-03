
-- generate a list of week numbers
WITH 
 week_number AS (
  SELECT 0 AS week_num UNION ALL
  SELECT 1 UNION ALL
  SELECT 2 UNION ALL
  SELECT 3 UNION ALL
  SELECT 4 UNION ALL
  SELECT 5 UNION ALL
  SELECT 6
),

-- to identify if data cuts off
 valid_weeks AS (
  SELECT DISTINCT 
   DATE_TRUNC(subscription_start, WEEK(MONDAY)) AS week_date
  FROM
   `turing_data_analytics.subscriptions`
),

-- creating cohorts
 cohort AS (
  SELECT
   user_pseudo_id,
   DATE_TRUNC(subscription_start, WEEK(MONDAY)) AS cohort_week, -- starting monday
   subscription_start,
   subscription_end
  FROM
    `turing_data_analytics.subscriptions`
)

-- cohort weekly analysis
SELECT
 a.cohort_week,
 w.week_num,
 SUM(CASE
      WHEN a.subscription_start <= DATE_ADD(DATE_ADD(a.cohort_week, INTERVAL w.week_num WEEK), INTERVAL 6 DAY) -- sub start must be on or before cohort week end
      AND (a.subscription_end IS NULL OR a.subscription_end > DATE_ADD(a.cohort_week, INTERVAL w.week_num WEEK)) -- sub end must be null or after cohort week start
      THEN 1
     END) AS retention
FROM
 cohort AS a
CROSS JOIN
 week_number AS w
JOIN
 valid_weeks AS vw
ON 
 DATE_ADD(a.cohort_week, INTERVAL w.week_num WEEK) = vw.week_date
GROUP BY
 1,2
ORDER BY
 1,2