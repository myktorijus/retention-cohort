<h1>Cohort, Retention Analysis</h1>

<p>This repository contains a SQL-based cohort retention analysis using user subscription data. The goal of the analysis is to understand how user retention evolves over time across different signup cohorts and to identify retention drop-offs that can inform product and engagement strategies.</p>

<h2>Contents</h2>
<ul>
  <li><strong>SQL file for Cohort Retention logic</strong> — retention.sql</li>
  <li><strong>PowerBi report</strong> — retention.pbix</li>
  <li><strong>PowerBi report in PDF</strong> — retention.pdf</li>
  <li><strong>Google Sheets link with query output</strong> — <a href="https://docs.google.com/spreadsheets/d/1m5apKE6ZL4xyq2njLiVscZymug3JCFP6_-LCn5XwY5g/edit?usp=sharing" target="_blank">View Sheet</a></li>
</ul>

<h2>Summary</h2>
<ul>
  <li>Created weekly cohorts by truncating each user's date to the Monday of that week</li>
  <li>Analyzed user cohort data to evaluate retention across 6 weeks</li>
  <li>Built a PowerBi report with retention tables and provided insights</li>
</ul>

<h2>Key Insights</h2>
<ul>
  <li>Early November cohorts (especially 2020-11-09) had the weakest retention across the board—dropping from 16.2K to 13.7K by week 6</li>
  <li>December cohorts consistently outperformed earlier ones, with retention rates above 90% by week 6</li>
  <li>Week 1 to Week 6 drop rates tightened significantly over time, from a ~13% drop (Oct 26) down to just ~4% by the end of December</li>
</ul>

<h2>Tools Used</h2>
<ul>
  <li>Google BigQuery (SQL)</li>
  <li>PowerBi</li>
  <li>Subscription data</li>
</ul>
