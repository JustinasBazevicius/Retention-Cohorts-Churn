SELECT 
  DATE_TRUNC(subscription_start, WEEK) AS cohort_week, -- Main week (week_0)
  COUNT(user_pseudo_id) AS week_0_users, -- Week 0 number of users
  
  SUM(CASE 
      WHEN subscription_start >= DATE_TRUNC(subscription_start, WEEK) 
           AND (subscription_end IS NULL OR subscription_end > DATE_ADD(DATE_TRUNC(subscription_start, WEEK), INTERVAL 1 WEEK)) -- Week 1 activity between week 0 and week 1
      THEN 1 ELSE 0 END) AS week_1,
    
  SUM(CASE 
      WHEN subscription_start >= DATE_TRUNC(subscription_start, WEEK)  
           AND (subscription_end IS NULL OR subscription_end > DATE_ADD(DATE_TRUNC(subscription_start, WEEK), INTERVAL 2 WEEK))  -- Week 2 activity between week 0 and week 2
      THEN 1 ELSE 0 END) AS week_2,

  SUM(CASE 
      WHEN subscription_start >= DATE_TRUNC(subscription_start, WEEK)
           AND (subscription_end IS NULL OR subscription_end > DATE_ADD(DATE_TRUNC(subscription_start, WEEK), INTERVAL 3 WEEK)) -- Week 3 activity between week 0 and week 3
      THEN 1 ELSE 0 END) AS week_3,

  SUM(CASE 
     WHEN subscription_start >= DATE_TRUNC(subscription_start, WEEK)
           AND (subscription_end IS NULL OR subscription_end > DATE_ADD(DATE_TRUNC(subscription_start, WEEK), INTERVAL 4 WEEK)) -- Week 4 activity between week 0 and week 4
      THEN 1 ELSE 0 END) AS week_4,

  SUM(CASE 
      WHEN subscription_start >= DATE_TRUNC(subscription_start, WEEK) 
           AND (subscription_end IS NULL OR subscription_end > DATE_ADD(DATE_TRUNC(subscription_start, WEEK), INTERVAL 5 WEEK)) -- Week 5 activity between week 0 and week 5
      THEN 1 ELSE 0 END) AS week_5,

  SUM(CASE 
      WHEN subscription_start >= DATE_TRUNC(subscription_start, WEEK) 
           AND (subscription_end IS NULL OR subscription_end > DATE_ADD(DATE_TRUNC(subscription_start, WEEK), INTERVAL 6 WEEK))  -- Week 6 activity between week 0 and week 6
      THEN 1 ELSE 0 END) AS week_6 

FROM `turing_data_analytics.subscriptions`
WHERE subscription_start BETWEEN '2020-11-01' AND '2021-01-30' 
Group by cohort_week
ORDER BY cohort_week