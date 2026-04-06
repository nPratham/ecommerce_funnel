SELECT *
FROM `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`;

-- Define sales funnel and different stages --

with sales_funnel as(
  select 
    count (case when event_type like "page_view" then 1 end ) as stage_1_page_view,
    count (case when event_type like "add_to_cart" then 1 end) as stage_2_add_to_cart,
    count (case when event_type like "checkout_start" then 1 end) as stage_3_checkout,
    count (case when event_type like "payment_info" then 1 end) as stage_4_payment_info,
    count (case  when event_type like "purchase" then 1 end) as stage_5_purchase 
  from `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`
)
select *
from sales_funnel;


-- Conversion rates through the funnel -- 

with user_conversion_funnel as(
  select 
    count (case when event_type like "page_view" then 1 end ) as stage_1_page_view,
    count (case when event_type like "add_to_cart" then 1 end) as stage_2_add_to_cart,
    count (case when event_type like "checkout_start" then 1 end) as stage_3_checkout,
    count (case when event_type like "payment_info" then 1 end) as stage_4_payment_info,
    count (case  when event_type like "purchase" then 1 end) as stage_5_purchase 
  from `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`
)
select stage_1_page_view,(stage_2_add_to_cart/stage_1_page_view)*100 as view_to_cart,
(stage_3_checkout/stage_2_add_to_cart)*100 as cart_to_checkout,(stage_4_payment_info/stage_3_checkout)*100 as checkout_to_paymentinfo,(stage_5_purchase/stage_4_payment_info)*100 as paymentinfo_to_purchase

from user_conversion_funnel;

-- Users by source --

with user_source_funnel as(
  select 
    count (case when traffic_source like "email" then 1 end ) as Email,
    count (case when traffic_source like "organic" then 1 end) as Organic,
    count (case when traffic_source like "paid_ads" then 1 end) as Paid_ads,
    count (case when traffic_source like "social" then 1 end) as Social
  from `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`
)
select *
from user_source_funnel;

-- Funnel by source --

with source_funnel as(
  select 
  traffic_source,
    count (case when event_type like "page_view" then 1 end ) as stage_1_page_view,
    count (case when event_type like "add_to_cart" then 1 end) as stage_2_add_to_cart,
    count (case when event_type like "checkout_start" then 1 end) as stage_3_checkout,
    count (case when event_type like "payment_info" then 1 end) as stage_4_payment_info,
    count (case  when event_type like "purchase" then 1 end) as stage_5_purchase 
  from `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`
  group by traffic_source
)
select *
from source_funnel;

-- Conversion rates from different sources -- 

with conversion_source_funnel as(
  select 
  traffic_source,
    count (case when event_type like "page_view" then 1 end ) as stage_1_page_view,
    count (case when event_type like "add_to_cart" then 1 end) as stage_2_add_to_cart,
    count (case when event_type like "checkout_start" then 1 end) as stage_3_checkout,
    count (case when event_type like "payment_info" then 1 end) as stage_4_payment_info,
    count (case  when event_type like "purchase" then 1 end) as stage_5_purchase 
  from `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`
  group by traffic_source
)
select traffic_source,stage_1_page_view,round((stage_2_add_to_cart/stage_1_page_view)*100) as view_to_cart,
round((stage_3_checkout/stage_2_add_to_cart)*100) as cart_to_checkout,round((stage_4_payment_info/stage_3_checkout)*100) as checkout_to_paymentinfo,round((stage_5_purchase/stage_4_payment_info)*100) as payment_to_purchase
from conversion_source_funnel;

-- Revenue Analyis --

with Revenue as(
  select
  count (case when event_type like "page_view" then 1 end ) as page_view,
  count (case when event_type like "purchase" then 1 end ) as total_purchase,
  sum (amount) as total_revenue,
  avg(amount) as avg_amount

  from `data-analytics-projects-492302.sales_funnel_analysis.Sales_EDA`
)
select *
from Revenue;

