-- dbt model for view STG_TPCH_CUSTOMERS
{{ config(materialized='view') }}

CREATE OR REPLACE VIEW bvd_sandbox.dbt_bvandelft.stg_tpch_customers AS
  (WITH SOURCE AS
     (SELECT *
      FROM raw.tpch_sf001.customer),FINAL AS
     (SELECT c_custkey AS customer_key,
             c_name AS name,
             c_address AS address,
             c_nationkey AS nation_key,
             c_phone AS phone_number,
             c_acctbal AS account_balance,
             c_mktsegment AS market_segment,
             c_comment AS COMMENT
      FROM SOURCE) SELECT *
   FROM FINAL)
