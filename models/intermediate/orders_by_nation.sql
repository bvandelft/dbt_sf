-- dbt model for view ORDERS_BY_NATION
{{ config(materialized='view') }}

CREATE OR REPLACE VIEW bvd_sandbox.dbt_bvandelft.orders_by_nation AS
  (WITH orders AS
     (SELECT *
      FROM {{ ref('fct_orders') }}),
        customers AS
     (SELECT *
      FROM {{ ref('dim_customers') }}),
        FINAL AS
     (SELECT orders.*,
             customers.nation
      FROM orders
      LEFT JOIN customers ON orders.customer_key = customers.customer_key) SELECT *
   FROM FINAL)