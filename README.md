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

Data Source
•	Cyclistic 2023 trip data (monthly CSV files)

Data Processing
•	Loaded and cleaned data in PostgreSQL
•	Built a star-style analytical model (fact & dimensions)
•	Created SQL views specifically designed for dashboarding

Visualization
•	Built an interactive dashboard in Tableau Public

Raw CSVs → PostgreSQL (ETL & modeling) → Analytical views → Tableau

⸻

Tools Used
•	PostgreSQL / SQL – data cleaning, transformations, analytical views
•	Tableau Public – dashboard design and storytelling
•	GitHub – version control and documentation

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
•	Members ride more frequently and mostly on weekdays, suggesting commute-driven usage
•	Casual riders take longer rides and prefer weekends, indicating leisure use
•	Several high-traffic stations show heavy casual usage, making them strong candidates for targeted conversion campaigns
•	Ride frequency appears to be a stronger conversion signal than ride length alone

⸻

Business Recommendations
•	Focus membership campaigns on high-usage casual riders at key stations
•	Design weekend-based conversion offers for leisure riders
•	Promote membership once riders cross a certain ride-frequency threshold

⸻

Repository Structure

cyclistic-capstone/
├── data/
│   ├── raw/          # Original CSVs (ignored in Git)
│   └── processed/    # Exported analytical views
├── sql/
│   ├── etl_cleaning.sql
│   └── etl_cleaning_continued.sql
├── dashboard/
│   ├── dashboard.png
│   └── dashboard.pdf
└── README.md

Notes
•	Raw data files are excluded due to size
•	Analysis is limited to the 2023 dataset
•	The dashboard is designed for strategic insight, not real-time operations

⸻

About Me

Shivali Ravindra Kumar
Business Intelligence Analyst

Portfolio: https://shivaliravindrakumar.netlify.app
LinkedIn: 
