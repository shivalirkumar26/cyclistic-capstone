{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- ============================================================\
-- ETL SCRIPT (INITIAL VERSION)\
-- Creates DW schema + dimensions + fact table structure\
-- ============================================================\
\
-- 0) Create schema dw (if not exists)\
CREATE SCHEMA IF NOT EXISTS dw AUTHORIZATION postgres;\
\
-- 1) Create dim_date\
CREATE TABLE IF NOT EXISTS dw.dim_date (\
  date_key        DATE PRIMARY KEY,\
  year            INT,\
  month           INT,\
  month_name      TEXT,\
  day             INT,\
  day_name        TEXT,\
  week_of_year    INT,\
  is_weekend      BOOLEAN\
);\
\
INSERT INTO dw.dim_date (date_key, year, month, month_name, day, day_name, week_of_year, is_weekend)\
SELECT dt::date AS date_key,\
       EXTRACT(YEAR FROM dt)::int AS year,\
       EXTRACT(MONTH FROM dt)::int AS month,\
       TO_CHAR(dt, 'Month')      AS month_name,\
       EXTRACT(DAY FROM dt)::int AS day,\
       TO_CHAR(dt, 'Day')        AS day_name,\
       EXTRACT(WEEK FROM dt)::int AS week_of_year,\
       (EXTRACT(DOW FROM dt) IN (0,6)) AS is_weekend\
FROM (\
    SELECT DISTINCT date_trunc('day', started_at)::date AS dt\
    FROM raw.stg_rides\
    WHERE started_at IS NOT NULL\
) d\
ON CONFLICT (date_key) DO NOTHING;\
\
-- 2) Create dim_bike_type\
CREATE TABLE IF NOT EXISTS dw.dim_bike_type (\
  rideable_type TEXT PRIMARY KEY\
);\
\
INSERT INTO dw.dim_bike_type (rideable_type)\
SELECT DISTINCT rideable_type\
FROM raw.stg_rides\
WHERE rideable_type IS NOT NULL\
ON CONFLICT (rideable_type) DO NOTHING;\
\
-- 3) Create dim_customer_type\
CREATE TABLE IF NOT EXISTS dw.dim_customer_type (\
  member_casual TEXT PRIMARY KEY\
);\
\
INSERT INTO dw.dim_customer_type (member_casual)\
SELECT DISTINCT member_casual\
FROM raw.stg_rides\
WHERE member_casual IS NOT NULL\
ON CONFLICT (member_casual) DO NOTHING;\
\
-- 4) Create dim_station (structure only)\
CREATE TABLE IF NOT EXISTS dw.dim_station (\
  station_id   TEXT PRIMARY KEY,\
  station_name TEXT,\
  lat          NUMERIC,\
  lng          NUMERIC\
);\
\
-- (dim_station INSERT happens in continuation script)\
\
-- 5) Create fact table structure\
CREATE TABLE IF NOT EXISTS dw.fact_rides (\
  ride_id               TEXT PRIMARY KEY,\
  rideable_type         TEXT REFERENCES dw.dim_bike_type(rideable_type),\
  member_casual         TEXT REFERENCES dw.dim_customer_type(member_casual),\
  started_at            TIMESTAMP,\
  ended_at              TIMESTAMP,\
  ride_length_min       NUMERIC,\
  start_date            DATE REFERENCES dw.dim_date(date_key),\
  start_hour            INT,\
  day_of_week           TEXT,\
  is_weekend            BOOLEAN,\
  start_station_id      TEXT REFERENCES dw.dim_station(station_id),\
  end_station_id        TEXT REFERENCES dw.dim_station(station_id),\
  raw_file_name         TEXT\
);\
\
-- END OF INITIAL SCRIPT}