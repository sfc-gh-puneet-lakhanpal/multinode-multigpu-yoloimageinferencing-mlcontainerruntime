use role sysadmin;
create database if not exists partners_db;
use database partners_db;
create schema if not exists evolv_sch;
use schema evolv_sch;

CREATE COMPUTE POOL if not exists object_detection_cp_gpu_nv_s_data_download
  MIN_NODES = 1
  MAX_NODES = 1
  INSTANCE_FAMILY = GPU_NV_S
  INITIALLY_SUSPENDED = TRUE
  AUTO_RESUME = TRUE
  AUTO_SUSPEND_SECS = 300;

CREATE COMPUTE POOL if not exists object_detection_cp_gpu_nv_s_5_nodes
  MIN_NODES = 5
  MAX_NODES = 5
  INSTANCE_FAMILY = GPU_NV_S
  INITIALLY_SUSPENDED = TRUE
  AUTO_RESUME = TRUE
  AUTO_SUSPEND_SECS = 300;

CREATE NETWORK RULE if not exists allow_all_rule
MODE= 'EGRESS'
TYPE = 'HOST_PORT'
VALUE_LIST = ('0.0.0.0:443','0.0.0.0:80');

CREATE EXTERNAL ACCESS INTEGRATION if not exists allow_all_integration
ALLOWED_NETWORK_RULES = (allow_all_rule)
ENABLED = true;