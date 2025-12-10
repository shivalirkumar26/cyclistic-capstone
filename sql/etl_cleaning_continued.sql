{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- ============================================================\
-- ETL SCRIPT (CONTINUATION)\
-- Safe + idempotent version\
-- Populates dim_station and fact_rides\
-- ============================================================\
\
-- 1) Ensure DW schema exists\
CREATE SCHEMA IF NOT EXISTS dw AUTHORIZATION postgres;\
\
-- 2) Ensure dim_station exists\
CREATE TABLE IF NOT EXISTS dw.dim_station (\
  station_id   TEXT PRIMARY KEY,\
  station_name TEXT,\
  lat          NUMERIC,\
  lng          NUMERIC\
);\
\
-- 3) Insert station dimension cleanly (1 row per station_id)\
TRUNCATE TABLE dw.dim_station;\
\
INSERT INTO dw.dim_station (station_id, station_name, lat, lng)\
SELECT station_id,\
       MAX(station_name) AS station_name,\
       AVG(lat)          AS lat,\
       AVG(lng)          AS lng\
FROM (\
    SELECT start_station_id::text AS station_id,\
           start_station_name     AS station_name,\
           start_lat              AS lat,\
           start_lng              AS lng\
    FROM raw.stg_rides\
    WHERE start_station_id IS NOT NULL\
\
    UNION ALL\
\
    SELECT end_station_id::text AS station_id,\
           end_station_name      AS station_name,\
           end_lat               AS lat,\
           end_lng               AS lng\
    FROM raw.stg_rides\
    WHERE end_station_id IS NOT NULL\
) s\
GROUP BY station_id\
ORDER BY station_id;\
\
-- 4) Insert cleaned fact rows (safe + dedup + duration filters)\
INSERT INTO dw.fact_rides (\
  ride_id, rideable_type, member_casual, started_at, ended_at,\
  ride_length_min, start_date, start_hour, day_of_week, is_weekend,\
  start_station_id, end_station_id, raw_file_name\
)\
SELECT DISTINCT ON (sr.ride_id)\
  sr.ride_id,\
  sr.rideable_type,\
  sr.member_casual,\
  sr.started_at,\
  sr.ended_at,\
  ROUND(EXTRACT(EPOCH FROM (sr.ended_at - sr.started_at)) / 60, 2) AS ride_length_min,\
  (date_trunc('day', sr.started_at))::date AS start_date,\
  EXTRACT(HOUR FROM sr.started_at)::int AS start_hour,\
  TO_CHAR(sr.started_at, 'Day') AS day_of_week,\
  (EXTRACT(DOW FROM sr.started_at) IN (0,6)) AS is_weekend,\
  sr.start_station_id,\
  sr.end_station_id,\
  sr.raw_file_name\
FROM raw.stg_rides sr\
WHERE sr.started_at IS NOT NULL\
  AND sr.ended_at IS NOT NULL\
  AND EXTRACT(EPOCH FROM (sr.ended_at - sr.started_at)) / 60 > 0.1\
  AND EXTRACT(EPOCH FROM (sr.ended_at - sr.started_at)) / 60 < 1440\
ORDER BY sr.ride_id, sr.started_at\
ON CONFLICT (ride_id) DO NOTHING;\
\
-- 5) Helpful indexes\
CREATE INDEX IF NOT EXISTS idx_fact_started_at ON dw.fact_rides(started_at);\
CREATE INDEX IF NOT EXISTS idx_fact_start_station ON dw.fact_rides(start_station_id);\
CREATE INDEX IF NOT EXISTS idx_fact_member_casual ON dw.fact_rides(member_casual);}