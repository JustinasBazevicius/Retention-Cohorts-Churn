# Retention, Cohorts & Churn
In this project, I wrote SQL queries to analyze weekly retention and churn percentages for subscription cohorts. The focus was on calculating retention for user cohorts, tracking their activity over a 6-week period, and deriving churn percentages from retention data to uncover key insights related to subscription behavior.

Cohort Analysis:
I extracted and analyzed data for users who started their subscriptions within a specific week. The cohort was tracked over the following 6 weeks to evaluate retention and churn.

Retention & Churn Percentages Calculation:
I calculated weekly retention percentages from Week 0 to Week 6 by truncating the subscription start date to the beginning of the week (Monday) and tracking user activity. Churn percentages were derived by subtracting the retention percentage from 100% for each cohort.

Key Findings:
I interpreted the visualizations to uncover trends, such as sharp drop-offs in retention, identifying cohorts that performed better than others, and pinpointing key churn periods. I provided actionable insights based on retention and churn percentages.
