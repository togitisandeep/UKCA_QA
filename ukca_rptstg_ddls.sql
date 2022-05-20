
CREATE TABLE rptstage.`rpt_uk_fact_requests_ca` (
  `ca_rqst_id` BIGINT(20) NOT NULL COMMENT 'Surrogate Key' ,
  `lot_nbr` BIGINT(20) NOT NULL COMMENT 'Lot Number' ,
  `slr_cd` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Seller Code' ,
  `claim_nbr` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Claim Number' ,
  `clearance_dttm` DATETIME DEFAULT NULL COMMENT 'Clearance Datetime' ,
  `clearance_stg_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Stage Code' ,
  `clearance_rqst_status` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Request Status' ,
  `authorized_dttm` DATETIME DEFAULT NULL COMMENT 'Authorized Datetime' ,
  `crush_authorized_dttm` DATETIME DEFAULT NULL COMMENT 'Crush Authorized Datetime' ,
  `crush_flg` TINYINT(4) DEFAULT NULL COMMENT 'Crush Flag' ,
  `clr_flg` TINYINT(4) DEFAULT NULL COMMENT 'Clearance Flag' ,
  `preclr_flg` TINYINT(4) DEFAULT NULL COMMENT 'Preclearance Flag' ,
  `nxt_cntct_dt` DATETIME DEFAULT NULL COMMENT 'Next Contact Datetime' ,
  `slr_nxt_rvw_dt` DATETIME DEFAULT NULL COMMENT 'Next Review Datetime' ,
  `rqst_crt_dt` DATETIME DEFAULT NULL COMMENT 'Request Created Datetime' ,
  `rqst_cmpltd_dt` DATETIME DEFAULT NULL COMMENT 'Request Completed Datetime' ,
  `last_actn_dt` DATETIME DEFAULT NULL COMMENT 'Transporter Licience plate State Code' ,
  `last_actn_entity_type` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Transporter Licience plate State Code' ,
  `last_actn_entity` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Transporter Licience plate State Code' ,
  `ca_hld_dt` DATETIME DEFAULT NULL COMMENT 'Clearance Hold Datetime' ,
  `ca_hld_rsn` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Hold Reason' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation Use1r' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  KEY `ca_requests_key` (`ca_rqst_id`,`claim_nbr`,`last_upd_dt`,`clearance_stg_cd`,`rqst_crt_dt`,`lot_nbr`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_requests_shrdky` (`ca_rqst_id`)
) ;



CREATE TABLE rptstage.`rpt_uk_fact_entities_ca` (
  `entity_id` BIGINT(20) DEFAULT NULL,
  `entity_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ca_rqst_sbtask_id` BIGINT(20) DEFAULT NULL,
  `sbtask_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sbtask_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sbtask_status_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `close_rsn_cd` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sla_cntct_dt` DATETIME DEFAULT NULL,
  `last_cntct_dt` DATETIME DEFAULT NULL,
  `sbtask_cmpltd_dt` DATETIME DEFAULT NULL,
  `cntct_rslt_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sbtask_stg_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sbtask_crt_dt` DATETIME DEFAULT NULL,
  `ca_rqst_task_id` BIGINT(20) DEFAULT NULL,
  `ca_rqst_id` BIGINT(20) DEFAULT NULL,
  `nxt_cntct_dt` DATETIME DEFAULT NULL,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `crt_dt` DATETIME DEFAULT NULL,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_upd_dt` DATETIME DEFAULT NULL,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_status_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_cmpltd_dt` DATETIME DEFAULT NULL,
  `task_crt_dt` DATETIME DEFAULT NULL,
  KEY `entity_id_key` (`entity_id`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `entity_id_shky` (`entity_id`)
) ;




CREATE TABLE rptstage.`rpt_uk_fact_events_ca` (
  `ca_event_log_id` BIGINT(20) NOT NULL COMMENT 'Surrogate Key' ,
  `lot_nbr` BIGINT(20) DEFAULT NULL COMMENT 'Lot Number' ,
  `ref_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Reference Code' ,
  `ref_id` BIGINT(20) DEFAULT NULL COMMENT 'Reference ID' ,
  `event_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Event Code' ,
  `event_notes` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Notes to be added for the event log' ,
  `event_json` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Event JSON' ,
  `trgrd_by_entity` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Triggered By Entity' ,
  `trgrd_by` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Triggered By' ,
  `trgrd_dt` DATETIME DEFAULT NULL COMMENT 'Triggered Datetime' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
 KEY `ca_event_logs_key` (`ca_event_log_id`,`lot_nbr`,`last_upd_dt`,`ref_cd`,`ref_id`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_event_logs_shrdkey` (`ca_event_log_id`)
 
) ;



CREATE TABLE rptstage.`rpt_uk_fact_message_ca` (
  `entity_id` BIGINT(20) DEFAULT NULL,
  `entity_type` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ca_msg_dtl_id` BIGINT(20) DEFAULT NULL,
  `from_entity_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `from_entity` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `to_entity_type` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `to_entity` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comments` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_dtl_json` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_dtl_ack_flg` TINYINT(4) DEFAULT NULL,
  `msg_dtl_status` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ca_msg_hdr_id` BIGINT(20) DEFAULT NULL,
  `ca_rqst_id` BIGINT(20) DEFAULT NULL,
  `ca_rqst_task_id` BIGINT(20) DEFAULT NULL,
  `ca_rqst_sbtask_id` BIGINT(20) DEFAULT NULL,
  `msg_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_hdr_json` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `msg_status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resp_entity` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resp_entity_id` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resp_comments` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resp_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_dt` DATETIME DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_upd_dt` DATETIME DEFAULT NULL,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  KEY `entity_id_key` (`entity_id`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `entity_id_shrdkey` (`entity_id`) 
) ;




CREATE TABLE rptstage.`rpt_uk_dim_request_attributes_ca` (
  `ca_rqst_attr_id` BIGINT(20) NOT NULL COMMENT 'Surrogate Key' ,
  `ca_rqst_id` BIGINT(20) NOT NULL COMMENT 'Clearance Request Id' ,
  `attr_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Attribute Type' ,
  `attr_json_val` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Attribute JSON Value' ,
  `attr_status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Attribute Status' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_request_attributes_key` (`ca_rqst_attr_id`,`ca_rqst_id`,`last_upd_dt`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_request_attributes_shrdkey` (`ca_rqst_attr_id`)
) ;



CREATE TABLE rptstage.`rpt_uk_dim_request_subtask_attributes_ca` (
  `ca_sbtask_attr_id` BIGINT(20) NOT NULL COMMENT 'PRIMARY KEY' ,
  `ca_rqst_sbtask_id` BIGINT(20) NOT NULL COMMENT 'Clearance Request SubTask Id' ,
  `attr_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Attribute type' ,
  `attr_json_val` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Attribute JSON Value' ,
  `attr_status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Attribute Status' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_request_subtask_attributes_key` (`ca_sbtask_attr_id`,`ca_rqst_sbtask_id`,`last_upd_dt`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_request_subtask_attributes_shrdkey` (`ca_sbtask_attr_id`)
) ;



CREATE TABLE rptstage.`rpt_uk_dim_subtask_type_codes_ca` (
  `sbtask_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Subtask Type Code' ,
  `sbtask_type_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Subtask Type Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
   KEY `sbtask_type_cd_key` (`sbtask_type_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `sbtask_type_cd_shrdkey` (`sbtask_type_cd`)
) ;




CREATE TABLE rptstage.`rpt_uk_dim_subtask_types_ca` (
  `ca_task_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Task Type Code' ,
  `ca_sbtask_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance SubTask Type Code' ,
  `ca_sbtask_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance SubTask Code' ,
  `ca_sbtask_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance SubTask Name' ,
  `properties_json` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Properties JSON data' ,
  `cntct_due_time` DECIMAL(10,3) DEFAULT NULL COMMENT 'Default Initial Contact Due Time in Hours' ,
  `cntct_flup_time` DECIMAL(10,3) DEFAULT NULL COMMENT 'Default Contact Follow up Time in Hours' ,
  `sbtask_priority` INT(11) DEFAULT NULL COMMENT 'Subtask Priority' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_task_type_cd_key` (`ca_task_type_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_task_type_cd_shrdkey`(`ca_task_type_cd`) 
) ;




CREATE TABLE rptstage.`rpt_uk_dim_task_types_ca` (
  `task_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Task Type Code' ,
  `task_type_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Task Type Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `task_type_cd_key` (`task_type_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `task_type_cd_shrdkey` (`task_type_cd`)
) ;




CREATE TABLE rptstage.`rpt_uk_dim_status_codes_ca` (
  `ca_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Status Category Code' ,
  `ca_status_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Status Code' ,
  `ca_status_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Status Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_cat_cd_key` (`ca_cat_cd`,`ca_status_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_cat_cd_shrdkey` (`ca_cat_cd`)
) ;



CREATE TABLE rptstage.`rpt_uk_dim_stages_ca` (
  `ca_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Stage Category Code' ,
  `ca_stg_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Stage Code' ,
  `ca_stg_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Stage Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_cat_cd_key` (`ca_cat_cd`,`ca_stg_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_cat_cd_shrdkey` (`ca_cat_cd`)
);



CREATE TABLE rptstage.`rpt_uk_dim_reference_codes_ca` (
  `ca_ref_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Reference Category Code' ,
  `ca_ref_cd` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Reference Code' ,
  `ca_ref_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Reference Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_ref_cat_cd_key` (`ca_ref_cat_cd`,`ca_ref_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_ref_cat_cd_shrdkey` (`ca_ref_cat_cd`) 
) ;




CREATE TABLE rptstage.`rpt_uk_dim_reference_categories_ca` (
  `ca_ref_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Reference Category Code' ,
  `ca_ref_cat_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Reference Category Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_ref_cat_cd_key` (`ca_ref_cat_cd`)  USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_ref_cat_cd_shrdkey` (`ca_ref_cat_cd`) 
) ;


CREATE TABLE rptstage.`rpt_uk_dim_reason_codes_ca` (
  `ca_rsn_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Claim Reason Category Code' ,
  `ca_rsn_cd` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Claim Reason Code' ,
  `ca_rsn_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Claim Reason Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is \"A\" or \"I\", to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_rsn_cat_cd_key` (`ca_rsn_cat_cd`,`ca_rsn_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_rsn_cat_cd_shrdkey` (`ca_rsn_cat_cd`) 
) ;



CREATE TABLE rptstage.`rpt_uk_dim_reason_categories_ca` (
  `ca_rsn_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Reason Category Code' ,
  `ca_rsn_cat_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Reason Category Description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is \"A\" or \"I\", to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `ca_rsn_cat_cd_key` (`ca_rsn_cat_cd`)  USING CLUSTERED COLUMNSTORE,
  SHARD KEY `ca_rsn_cat_cd_shrdkey` (`ca_rsn_cat_cd`)
) ;



CREATE TABLE rptstage.`rpt_uk_dim_message_types_ca` (
  `msg_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'message Category Code' ,
  `msg_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'message Type Code' ,
  `msg_type_desc` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'message Description' ,
  `msg_type_json` VARCHAR(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JSON Storage field for message type' ,
  `status` VARCHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `msg_cat_cd_key` (`msg_cat_cd`,`msg_type_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `msg_cat_cd_shrdkey` (`msg_cat_cd`) 
) ;



CREATE TABLE rptstage.`rpt_uk_dim_message_categories_ca` (
  `msg_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Message Category code' ,
  `msg_cat_desc` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Message Category description' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `msg_cat_cd_key` (`msg_cat_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `msg_cat_cd_shrdkey` (`msg_cat_cd`)
) ;



CREATE TABLE rptstage.`rpt_uk_dim_attribute_types_ca` (
  `attr_type_cat_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Attribute Type Category Code' ,
  `attr_type_cd` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Clearance Attribute Type Code' ,
  `attr_type_nm` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Clearance Attribute Type Name' ,
  `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT 'Value is A or I, to indicate status is Active or Inactive' ,
  `batch_nbr` BIGINT(20) DEFAULT NULL,
  `crt_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Creation User' ,
  `crt_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Timestamp' ,
  `last_upd_user` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Last Update User' ,
  `last_upd_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp' ,
  `source_sys` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'Source from which record came from' ,
  KEY `attr_type_cat_cd_key` (`attr_type_cat_cd`,`attr_type_cd`) USING CLUSTERED COLUMNSTORE,
  SHARD KEY `attr_type_cat_cd_shrdkey` (`attr_type_cat_cd`) 
) ;


