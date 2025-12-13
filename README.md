Cyclistic Rider Behavior & Membership Conversion Analysis

Overview

This project analyzes Cyclistic bike-share trip data (2023) to understand how casual riders and annual members use the service differently, and how those differences can be leveraged to drive membership growth.

The focus is not just on exploration, but on translating usage patterns into clear business insights that leadership and marketing teams could realistically act on.

⸻

Business Context

Cyclistic’s annual members generate higher long-term value than casual riders.
The business goal behind this analysis is to answer a simple question:

What rider behaviors indicate strong potential for membership conversion?

⸻

Key Questions
1. When do members vs casual riders use the service most?
2. How do ride lengths differ between the two groups?
3. Which stations show high casual rider engagement?
4. What usage patterns signal strong conversion opportunities?

⸻

Approach & Workflow

Data Source: Cyclistic 2023 trip data (monthly CSV files)

Data Processing:
1. Loaded and cleaned data in PostgreSQL
2. Built a star-style analytical model (fact & dimensions)
3. Created SQL views specifically designed for dashboarding

Visualization: Built an interactive dashboard in Tableau Public

Raw CSVs → PostgreSQL (ETL & modeling) → Analytical views → Tableau

⸻

Tools Used
1. PostgreSQL / SQL – data cleaning, transformations, analytical views
2. Tableau Public – dashboard design and storytelling
3. GitHub – version control and documentation

⸻

Dashboard

🔗 Live Dashboard (Tableau Public)
https://public.tableau.com/views/CyclisticRiderBehaviorMembershipOpportunity2023/CyclisticUsageMemberConversionInsights2023

📄 Dashboard PDF
dashboard/dashboard.pdf

🖼️ Preview Image
dashboard/dashboard.png

⸻

Key Insights
1. Members ride more frequently and mostly on weekdays, suggesting commute-driven usage
2. Casual riders take longer rides and prefer weekends, indicating leisure use
3. Several high-traffic stations show heavy casual usage, making them strong candidates for targeted conversion campaigns
4. Ride frequency appears to be a stronger conversion signal than ride length alone

⸻

Business Recommendations
1. Focus membership campaigns on high-usage casual riders at key stations
2. Design weekend-based conversion offers for leisure riders
3. Promote membership once riders cross a certain ride-frequency threshold

⸻

Notes
1. Raw data files are excluded due to size
2. Analysis is limited to the 2023 dataset
3. The dashboard is designed for strategic insight, not real-time operations

⸻

About Me

Shivali Ravindra Kumar
Business Intelligence Analyst

Portfolio: https://shivaliravindrakumar.netlify.app
LinkedIn: 
