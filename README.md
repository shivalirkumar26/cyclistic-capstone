Cyclistic Rider Behavior & Membership Conversion Analysis (2023)

Overview

This project analyzes Cyclistic bike-share trip data (2023) to understand how casual riders and annual members use the service differently, and how those differences can inform membership conversion strategies.

The goal is not just to explore patterns, but to translate rider behavior into clear, actionable insights that marketing and leadership teams could realistically use.

⸻

Business Context

Cyclistic’s annual members generate higher long-term value than casual riders.
The core business question behind this analysis is:

Which rider behaviors indicate strong potential for membership conversion?

⸻

Key Questions
1. When do members and casual riders use the service most?
2. How does usage frequency differ between the two groups?
3. Which stations attract high casual rider activity?
4. Which behavioral patterns best signal conversion potential?

⸻

Key Insights & Business Impact

Key Insights
1. Ride frequency is a stronger indicator of membership conversion than ride duration. Riders who use the service more often are significantly more likely to become members.
2. Annual members ride more frequently overall, reinforcing frequency as the primary behavioral differentiator.
3. Several of the busiest stations are dominated by casual riders, highlighting locations with strong, untapped conversion potential.

Business Impact
1. Shifts conversion efforts from broad promotions to behavior-driven targeting.
2. Enables focused marketing campaigns at high-demand stations instead of low-impact areas.
3. Reduces wasted marketing spend and operational effort by prioritizing riders and locations with the highest likelihood of conversion.

Who This Enables
1. Marketing teams: design targeted, data-backed membership campaigns.
2. Operations teams: understand where demand is strongest and interventions matter most.
3. Leadership: gain a clear, evidence-based view of where membership growth efforts should be concentrated.

⸻

Approach & Workflow

Data Source: Cyclistic 2023 trip data (monthly CSV files)

Data Processing:
1. Data ingestion and cleaning in PostgreSQL
2. Star-style analytical model (fact and dimension tables)
3. SQL views built specifically for dashboard performance and clarity

Visualization: Interactive dashboard built in Tableau Public

Raw CSVs → PostgreSQL (ETL & modeling) → Analytical views → Tableau

⸻

Tools Used
1. PostgreSQL / SQL – data cleaning, transformations, analytical views
2. Tableau Public – dashboard design and visual storytelling
3. GitHub – version control and documentation

⸻

Design Decisions & Trade-offs
1. Tableau Public was chosen to prioritize visual clarity, storytelling, and public accessibility without requiring viewer licenses.
2. Aggregated SQL views were used instead of raw trip-level data to improve performance and keep the focus on decision-level insights.
3. Ride frequency was emphasized over ride duration after analysis showed it to be a stronger conversion signal.
4. Station-level analysis was preferred to remain privacy-aware while still enabling actionable marketing decisions.
5. The analysis was limited to 2023 data to maintain consistency across all months and avoid partial-year distortion.

⸻

Dashboard

Live Dashboard (Tableau Public):
https://public.tableau.com/views/CyclisticRiderBehaviorMembershipOpportunity2023/CyclisticUsageMemberConversionInsights2023

Dashboard PDF: dashboard/dashboard.pdf

Preview Image: dashboard/dashboard.png

⸻

Business Recommendations
1. Target high-frequency casual riders with tailored membership offers.
2. Focus conversion campaigns at stations with high casual usage.
3. Introduce membership prompts once riders cross a ride-frequency threshold.

⸻

Notes
1. Raw data files are excluded due to size.
2. Analysis is limited to the 2023 dataset.
3. The dashboard is designed for strategic insight, not real-time operations.

⸻

About Me

Shivali Ravindra Kumar - Business Intelligence Analyst

- Portfolio: https://shivaliravindrakumar.netlify.app
- LinkedIn: https://www.linkedin.com/in/shivali-r-kumar
