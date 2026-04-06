# Sales Funnel Analysis — SQL & BigQuery

## Executive Summary

This project analyses an e-commerce sales funnel using BigQuery SQL across **9,381 user events** spanning December 2025 to February 2026. The analysis tracks how users move from initial page view through to completed purchase, broken down by traffic source. Out of 5,000 page view sessions, **826 resulted in a purchase** — an overall conversion rate of **16.5%** — generating **$87,975 in total revenue** at an average order value of $106.51. Email emerged as the highest-converting traffic channel, while social media showed significant drop-off.

---

## Business Problem

E-commerce businesses lose potential revenue at every stage of the purchase journey. Without visibility into *where* users drop off and *which channels* bring the most valuable traffic, marketing spend and UX improvements are made without evidence. This analysis was designed to answer three core questions:

1. Where in the funnel are users dropping off, and by how much?
2. Which traffic sources drive the most conversions and revenue?
3. What is the overall revenue performance, and where are the biggest growth opportunities?

---

### Approach

All analysis was performed in **Google BigQuery** using SQL CTEs (Common Table Expressions) to keep logic modular and readable. The analysis was structured into five query blocks:

1. **Funnel volume** — count of users at each stage
2. **Step-by-step conversion rates** — percentage moving from one stage to the next
3. **Traffic source breakdown** — total users by acquisition channel
4. **Funnel by source** — stage volumes segmented by traffic source
5. **Revenue analysis** — total revenue, purchase count, and average order value

---

## Skills

- **SQL / BigQuery** — CTEs, conditional aggregation (`CASE WHEN`), window functions, `ROUND()`, `AVG()`, `SUM()`
- **Funnel analysis** — defining multi-stage conversion funnels and calculating step-by-step drop-off rates
- **Segmentation** — breaking down funnel performance by traffic acquisition channel
- **Revenue analysis** — computing total revenue and average order value from transactional event data
- **Data storytelling** — translating query results into actionable business insights

---

## Results
- **Biggest drop-off** : 69% of visitors leave without adding anything to cart — the product page is the weakest link
- **Checkout works well** : Once users add to cart, 53% complete a purchase — the checkout experience is solid
- **Email converts best** : 1 in 3 email visitors buy, vs 1 in 14 from social media
- **Social is underperforming** : Drives 29% of traffic but only 13% of revenue
- **Organic brings the most revenue** : $37,280 (42% of total) — largely due to high volume
  
---

## Business Recommendations

1. Fix the page view → add to cart drop (biggest opportunity)

2. Invest more in email marketing

3. Audit social media strategy

