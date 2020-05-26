--  sync_brands_desks_operators --------------------------------------------------------------------
USE DWH;
DELIMITER $$
DROP PROCEDURE IF EXISTS sync_brands_desks_operators;
CREATE PROCEDURE sync_brands_desks_operators()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
     SELECT Count(*) INTO @exists FROM information_schema.tables  WHERE table_schema = 'DWH'
				AND table_name = 'dwh_brands_desks_operators1';
            SET @query = If(@exists>0,
			'RENAME TABLE dwh_brands_desks_operators1 TO dwh_brands_desks_operators',
			'SELECT \'nothing to rename\' status');	
				PREPARE stmt FROM @query;
				EXECUTE stmt;
			DROP TABLE IF EXISTS dwh_brands_desks_operators_temp;
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'sync_brands_desks_operators-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

END;
SET @runId= UUID();
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS DWH.dwh_brands_desks_operators_temp;
CREATE TABLE DWH.dwh_brands_desks_operators_temp LIKE DWH.dwh_brands_desks_operators;
COMMIT;  
-- *********************************** Cryptomusu **********************************
set @Brand='Cryptomusu';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopedb.operator_desk_rel odr
				INNER JOIN antelopedb.operators op ON odr.operator_id = op.id
				INNER JOIN antelopedb.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
-- *********************************** Go365 **********************************
set @Brand='Go365';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopeDbGo365.operator_desk_rel odr
				INNER JOIN antelopeDbGo365.operators op ON odr.operator_id = op.id
				INNER JOIN antelopeDbGo365.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
-- *********************************** StarCapital **********************************
set @Brand='StarCapital';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopedb_StarCapital.operator_desk_rel odr
				INNER JOIN antelopedb_StarCapital.operators op ON odr.operator_id = op.id
				INNER JOIN antelopedb_StarCapital.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
-- *********************************** 7Online **********************************
set @Brand='7Online';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopedb_7Online.operator_desk_rel odr
				INNER JOIN antelopedb_7Online.operators op ON odr.operator_id = op.id
				INNER JOIN antelopedb_7Online.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
-- *********************************** AlphaLive **********************************
set @Brand='AlphaLive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopedb_alphalive.operator_desk_rel odr
				INNER JOIN antelopedb_alphalive.operators op ON odr.operator_id = op.id
				INNER JOIN antelopedb_alphalive.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
-- *********************************** ROIMAX **********************************
set @Brand='ROIMAX';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelope_roimax.operator_desk_rel odr
				INNER JOIN antelope_roimax.operators op ON odr.operator_id = op.id
				INNER JOIN antelope_roimax.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
-- *********************************** SuperFive **********************************
set @Brand='SuperFive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopedb_superfive.operator_desk_rel odr
				INNER JOIN antelopedb_superfive.operators op ON odr.operator_id = op.id
				INNER JOIN antelopedb_superfive.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  

-- *********************************** coinlife **********************************
set @Brand='CoinLife';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'sync_brands_desks_operators', @Brand, @runId, CURRENT_TIMESTAMP);

INSERT INTO DWH.dwh_brands_desks_operators_temp
(
	brand_name,operator_id,country_iso,operator_full_name,operator_active
	,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
)
	  SELECT 
			@Brand AS brand_name,
			odr.operator_id AS operator_id,
			op.country_iso AS country_iso,
			op.full_name AS operator_full_name,
			op.is_active AS operator_active,
			op.is_deleted AS opertor_deleted,
			odr.desk_id AS desk_id,
			dsk.name AS desk_name,
			dsk.type AS desk_type,
			(CASE
				WHEN (dsk.type = 0) THEN 'Conversion'
				WHEN (dsk.type = 1) THEN 'Retention'
				WHEN (dsk.type = 2) THEN 'Ninja'
			END) AS desk_type_name,
            op.creation_time,
            op.Last_Update_Time
		FROM  antelopedb_coinlife.operator_desk_rel odr
				INNER JOIN antelopedb_coinlife.operators op ON odr.operator_id = op.id
				INNER JOIN antelopedb_coinlife.desk dsk ON odr.desk_id = dsk.id ;
  
UPDATE control 
   SET flag = 1 , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  
                
-- *********************************** Rename operations **********************************   
RENAME TABLE DWH.dwh_brands_desks_operators TO DWH.dwh_brands_desks_operators1;
RENAME TABLE DWH.dwh_brands_desks_operators_temp TO DWH.dwh_brands_desks_operators;
drop table DWH.dwh_brands_desks_operators1;

COMMIT;  

 -- *********************************** END **********************************
ANALYZE TABLE dwh_brands_desks_operators;

END$$
DELIMITER ;

--  sync_bonus --------------------------------------------------------------------
USE DWH;
DELIMITER $$
DROP PROCEDURE IF EXISTS sync_bonus;
CREATE PROCEDURE sync_bonus()
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_bonus-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);
end;
set @runId= UUID();
SET FOREIGN_KEY_CHECKS=0;
-- *********************************** Cryptomusu **********************************
set @Brand='Cryptomusu';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_musu:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = 'Cryptomusu'
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Musu
 select id as soureTransactionId from antelopedb.bonus bb where 
 	 bb.last_update_time >= @top_time_musu
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableCryptomusu
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 
 from DWH.TR_Musu musu left join antelopedb.bonus bo on musu.soureTransactionId = bo.id  left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb.desk de on bo.desk_id = de.id left join antelopedb.operators op on bo.rep_id  = op.id
 left join antelopedb.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_Musu) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTableCryptomusu;

drop table DWH.TR_Musu;
drop table DWH.TempTableCryptomusu;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;    

-- *********************************** Go365 **********************************
set @Brand='Go365';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_go:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Go
 select id as soureTransactionId from antelopeDbGo365.bonus bb where 
 	 bb.last_update_time >= @top_time_go
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableGo
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6

 
 from DWH.TR_Go go left join antelopeDbGo365.bonus bo on go.soureTransactionId = bo.id  left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopeDbGo365.desk de on bo.desk_id = de.id left join antelopeDbGo365.operators op on bo.rep_id  = op.id
 left join antelopeDbGo365.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_Go) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTableGo;

drop table DWH.TR_Go;
drop table DWH.TempTableGo;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;       


-- --------------Bonus - Proftit
/*

set @Brand='Proftit';
set @crm='Proftit';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_bonus', @crm, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_proftit:=last_update_time
 FROM DWH.dwh_bonus
 Where crm = @crm
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Proftit
 select id as soureTransactionId from thedatabrainers.transaction_transfer_bonuses ttb where 
 	 ttb.updated_at >= @top_time_proftit;
	
                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableProftit
select ttb.id as id,
cu.brand_name as brand_name,
cu.id as customer_id,
ttb.created_at as creation_time,
cu.last_update_time as customer_last_update_time,
ttb.updated_at as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
ttb.status_id as status,
case ttb.status_id 
	when 1 then 'Success'
    when 2 then 'Negative'
    when 3 then 'Canceled'
    when 4 then 'Canceled'
    when 5 then 'Pending'
end as status_name,
 ttb.requestedAmount as amount,
 0 as currency,
 ttb.requestedAmountBasic  as base_amount,
  ' ' as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 ttb.user_id as actual_rep_id,
concat(u.firstName,' ' , u.lastName) as actual_rep_name,
'Proftit' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
--  ------------------------------------
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
0 as acquisition_status,
' ' as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
ttb.created_at as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
ttb.user_id as transaction_owner_id,
concat(toi.firstName,' ' , toi.lastName) as transaction_owner_name,
cust.deskId as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,

cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id 


from DWH.TR_Proftit Pro left join thedatabrainers.transaction_transfer_bonuses ttb on Pro.soureTransactionId= ttb.id
LEFT JOIN thedatabrainers.customer_trading_accounts cta ON ttb.tradingAccountId = cta.id
LEFT JOIN DWH.dwh_customers cu ON cta.customerId = cu.id and cu.crm ='Proftit'
LEFT JOIN thedatabrainers.users u ON ttb.user_id = u.id
left join thedatabrainers.brands br on cu.brand_name = br.name collate utf8_general_ci
left join thedatabrainers.users toi on ttb.user_id = toi.id
left join thedatabrainers.customers cust on cta.customerId = cust.id
left join thedatabrainers.desks de on cust.deskId = de.id;

-- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_Proftit) and crm = @crm);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id)
 
 select * from DWH.TempTableProftit;
   
drop table DWH.TR_Proftit;
drop table DWH.TempTableProftit;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @crm;
COMMIT;  

*/ 
-- *********************************** StarCapital **********************************
set @Brand='StarCapital';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_star:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Star
 select id as soureTransactionId from antelopedb_StarCapital.bonus bb where 
 	 bb.last_update_time >= @top_time_star
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableStarCapital
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 
 from DWH.TR_Star star left join antelopedb_StarCapital.bonus bo on star.soureTransactionId = bo.id  left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_StarCapital.desk de on bo.desk_id = de.id left join antelopedb_StarCapital.operators op on bo.rep_id  = op.id
 left join antelopedb_StarCapital.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_Star) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTableStarCapital;

drop table DWH.TR_Star;
drop table DWH.TempTableStarCapital;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;    

-- *********************************** 7Online **********************************
set @Brand='7Online';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_7Online:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_7Online
 select id as soureTransactionId from antelopedb_7Online.bonus bb where 
 	 bb.last_update_time >= @top_time_7Online
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTable7Online
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6
 from DWH.TR_7Online 7Online left join antelopedb_7Online.bonus bo on 7Online.soureTransactionId = bo.id  left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_7Online.desk de on bo.desk_id = de.id left join antelopedb_7Online.operators op on bo.rep_id  = op.id
 left join antelopedb_7Online.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_7Online) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTable7Online;

drop table DWH.TR_7Online;
drop table DWH.TempTable7Online;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;    

-- *********************************** Roimax **********************************
set @Brand='ROIMAX';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_Roimax:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Roimax
 select id as soureTransactionId from antelope_roimax.bonus bb where 
 	 bb.last_update_time >= @top_time_Roimax
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableRoimax
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6
 from DWH.TR_Roimax Roimax left join antelope_roimax.bonus bo on Roimax.soureTransactionId = bo.id  left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelope_roimax.desk de on bo.desk_id = de.id left join antelope_roimax.operators op on bo.rep_id  = op.id
 left join antelope_roimax.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_Roimax) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTableRoimax;

drop table DWH.TR_Roimax;
drop table DWH.TempTableRoimax;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;    


-- *********************************** AlphaLive **********************************
set @Brand='AlphaLive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_AlphaLive:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_AlphaLive
 select id as soureTransactionId from antelopedb_alphalive.bonus bb where 
 	 bb.last_update_time >= @top_time_AlphaLive
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableAlphaLive
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 from DWH.TR_AlphaLive AlphaLive left join antelopedb_alphalive.bonus bo on AlphaLive.soureTransactionId = bo.id  left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_alphalive.desk de on bo.desk_id = de.id left join antelopedb_alphalive.operators op on bo.rep_id  = op.id
 left join antelopedb_alphalive.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_AlphaLive) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTableAlphaLive;

drop table DWH.TR_AlphaLive;
drop table DWH.TempTableAlphaLive;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;    

-- *********************************** superfive **********************************
set @Brand='SuperFive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_superfive:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_superfive
 select id as soureTransactionId from antelopedb_superfive.bonus bb where 
 	 bb.last_update_time >= @top_time_superfive
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablesuperfive
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6
 from DWH.TR_superfive superfive 
 left join antelopedb_superfive.bonus bo on superfive.soureTransactionId = bo.id  
 left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_superfive.desk de on bo.desk_id = de.id 
 left join antelopedb_superfive.operators op on bo.rep_id  = op.id
 left join antelopedb_superfive.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;


   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_superfive) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTablesuperfive;

drop table DWH.TR_superfive;
drop table DWH.TempTablesuperfive;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  

-- *********************************** coinlife **********************************
set @Brand='CoinLife';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_bonus', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_coinlife:=last_update_time
 FROM DWH.dwh_bonus
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch bonus id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_coinlife
 select id as soureTransactionId from antelopedb_coinlife.bonus bb where 
 	 bb.last_update_time >= @top_time_coinlife
	and  bb.normalized_amount/100 > 2;

                   
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablecoinlife
select bo.id as id,
@Brand as brand_name,
bo.user_id as customer_id,
bo.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bo.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
cu.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
'11' as type,
'Bonus' as type_name,
'0' as status,
'Success' as status_name,
 bo.amount/100 as amount,
 0 as currency,
 bo.normalized_amount/100  as base_amount,
  bo.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 bo.operator_id as actual_rep_id,
 op.full_name as  actual_rep_name,
 'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bo.acquisition_status as acquisition_status,
case bo.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
bo.creation_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
0 as transaction_conv_owner_id,
null as  transaction_conv_owner_name, 
0 as transaction_conv_desk_id,
null transaction_conv_desk_name,
0 as  transaction_ret_owner_id,
null as transaction_ret_owner_name,
0  as transaction_ret_desk_id,
null as  transaction_ret_desk_name, 
bo.operator_id as transaction_owner_id,
tranOwnerRep.full_name as transaction_owner_name,
bo.desk_id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6
 from DWH.TR_coinlife coinlife 
 left join antelopedb_coinlife.bonus bo on coinlife.soureTransactionId = bo.id  
 left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_coinlife.desk de on bo.desk_id = de.id 
 left join antelopedb_coinlife.operators op on bo.rep_id  = op.id
 left join antelopedb_coinlife.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;


   -- delete rows to be updated/ on target table
delete from DWH.dwh_bonus where (id in (select soureTransactionId from DWH.TR_coinlife) and brand_name = @Brand);

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, 
customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id,
 creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTablecoinlife;

drop table DWH.TR_coinlife;
drop table DWH.TempTablecoinlife;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  

analyze table dwh_bonus;

END$$
DELIMITER ;

--  sync_comments --------------------------------------------------------------------
USE DWH;
DELIMITER $$
DROP  PROCEDURE IF EXISTS sync_comments;
CREATE PROCEDURE sync_comments()
BEGIN

 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback;
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_comments-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

end;

set @runId= UUID();
SET FOREIGN_KEY_CHECKS=0;
-- *********************************** Cryptomusu **********************************
set @Brand='Cryptomusu';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_musu:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = 'Cryptomusu'
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
'Cryptomusu' as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_cryptomusu.v_cryptomusu_communications cc left join comms_cryptomusu.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_musu;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
 COMMIT;    
   
   -- *********************************** Go365 **********************************
set @Brand='Go365';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_go:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = 'Go365'
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
'Go365' as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_go365.v_go365_communications cc left join comms_go365.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_go;



UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;   
-- *********************************** Proftit **********************************
/*
set @crm='Proftit';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @crm, @runId, CURRENT_TIMESTAMP);

-- take last added comments
SELECT @top_time_proftit:=creation_time
 FROM DWH.dwh_comments
 Where crm =  @crm
 order by creation_time desc limit 1;
 
 
-- create temp table to fetch id's that needs to be added
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Pro
 select id as soureCommentId from thedatabrainers.customer_communications where 
 	  FROM_UNIXTIME(date/1000) > @top_time_proftit;
          
 
 -- fetch records to add based on those id's
 CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableProftit
  SELECT
br.name as brand_name,
cc.customerId as customer_id,
FROM_UNIXTIME(cc.date/1000) as creation_time,
' ' as entity_type_name,
ccs.id as comment_type,
ccs.name as comment_type_name,
ccst.name as STATUS,
'Success' as DELIVERY_STATUS,
ccs.name as comment_title,
left(cc.details, 254) as comment_summary,
'Proftit' as crm,
cc.id as OriginId
  FROM DWH.TR_Pro pro left join thedatabrainers.customer_communications cc on pro.soureCommentId = cc.id
left join thedatabrainers.customer_communication_subjects ccs on cc.subjectId = ccs.id
left join thedatabrainers.customer_communication_statuses ccst on cc.statusId  = ccst.id
left join thedatabrainers.customers c on cc.customerId = c.id
left join thedatabrainers.brands br on c.brandId  = br.id;
 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm, OriginId) 
SELECT * from DWH.TempTableProftit;


drop table DWH.TR_Pro;
drop table DWH.TempTableProftit;


-- *****************************
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @crm;
COMMIT;   
*/
-- *********************************** StarCapital **********************************
set @Brand='StarCapital';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_star:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = @Brand
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
@Brand as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_starcapital.v_starcapital_communications cc left join comms_starcapital.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_star;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;   


-- *********************************** 7Online **********************************
set @Brand='7Online';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_7Online:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = @Brand
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
@Brand as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_7Online.v_7online_communications cc left join comms_7Online.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_7Online
and CRM_ID <> '7OnlineDepositEmailNotification@7online.io';

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;   


-- *********************************** roimax **********************************
set @Brand='ROIMAX';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_Roimax:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = @Brand
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
@Brand as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_roimax.v_roimax_communications cc left join comms_roimax.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_Roimax;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;   

-- *********************************** AlphaLive **********************************
set @Brand='AlphaLive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_AlphaLive:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = @Brand
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
@Brand as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_alphalive.v_alphalive_communications cc left join comms_alphalive.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_AlphaLive;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;   

-- *********************************** SuperFive **********************************
set @Brand='SuperFive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_musu:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = 'superfive'
 order by creation_time desc limit 1;

                 
INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
@Brand as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_superfive.v_superfive_communications cc 
left join comms_superfive.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_musu;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
 COMMIT;    
 
 -- *********************************** coinlife **********************************
set @Brand='CoinLife';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_comments', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_musu:=creation_time
 FROM DWH.dwh_comments
 Where brand_name = 'coinlife'
 order by creation_time desc limit 1;

INSERT INTO DWH.dwh_comments
(brand_name, customer_id, creation_time, entity_type_name, comment_type, comment_type_name, STATUS,
DELIVERY_STATUS, comment_title, comment_summary, crm) 
SELECT 
@Brand as brand_name,
cc.CRM_ID as customer_id,
cc.TIME_STAMP as creation_time,
cc.ENTITY_TYPE  as entity_type_name,
cc.COMM_TYPE as comment_type,
au.value as comment_type_name,
cc.STATUS as 'SUCCESS',
1 AS 'DELIVERY_STATUS',
cc.TITLE AS comment_title,
cc.SUMMARY AS comment_summary,
'Cryptency' as crm
FROM comms_coinlife.v_coinlife_communications cc 
left join comms_coinlife.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]' and cc.TIME_STAMP>@top_time_musu;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
 COMMIT;    
 
analyze table dwh_comments;

END$$
DELIMITER ;

--  sync_payments--------------------------------------------------------------------
DELIMITER $$
DROP  PROCEDURE IF EXISTS sync_payments;
CREATE PROCEDURE sync_payments()
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_payments-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

end;
set @runId= UUID();
set @lag=0; -- positive number in hours for lag fetch

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** Cryptomusu **********************************
set @Brand='Cryptomusu';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_payments', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_musu:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = 'Cryptomusu'
 order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Musu
 select id as soureTransactionId from antelopedb.broker_banking bb where 
 	 bb.last_update_time >= @top_time_musu
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableCryptomusu
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
-- bb.sub_psp_name as sub_psp_name,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 -- from DWH.TR_Musu musu left join antelopedb.broker_banking bb on musu.soureTransactionId = bb.id left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand;
 from DWH.TR_Musu musu left join antelopedb.broker_banking bb on
 musu.soureTransactionId = bb.id left join
 (select * from  DWH.dwh_customers  where  brand_name = @Brand) cu ON bb.user_id = cu.id
 left join antelopedb.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_Musu) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)

 select * from DWH.TempTableCryptomusu;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 1, 'dwh_customers', @Brand, @runId);
#insert into control (last_update_time, flag, object, brand, runId) values (@Update_time, 1, 'dwh_customers', @Brand, @runId);

drop table DWH.TR_Musu;
drop table DWH.TempTableCryptomusu;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;       
       -- *********************************** Go365 **********************************
set @Brand='Go365';
set @Update_time=CURRENT_TIMESTAMP;

-- set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_payments', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);


-- DATE_SUB(last_update_time, INTERVAL 1 DAY)

SELECT @top_time_go:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = 'Go365'
  order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Go
 select id as soureTransactionId from antelopeDbGo365.broker_banking bb where 
	bb.last_update_time >= @top_time_go
             and  bb.normalized_amount/100 > 2;
       
           
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableGo
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100
    else  bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
	else  bb.normalized_amount/100

 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
-- *************************************
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,

cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
-- bb.sub_psp_name as sub_psp_name,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 -- from DWH.TR_Go go left join antelopeDbGo365.broker_banking bb on go.soureTransactionId = bb.id left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand;
 from DWH.TR_Go go left join antelopeDbGo365.broker_banking bb on go.soureTransactionId = bb.id 
 left join (select * from DWH.dwh_customers where brand_name = @Brand) cu ON bb.user_id = cu.id
 left join antelopeDbGo365.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopeDbGo365.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopeDbGo365.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopeDbGo365.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;


-- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_Go) and brand_name = @Brand);

INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id,customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
 select * from DWH.TempTableGo;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

drop table DWH.TR_Go;
drop table DWH.TempTableGo;
# Update  control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT; 
-- *********************************** Proftit **********************************
/*
set @Brand='Proftit';
set @crm='Proftit';
set @Update_time=CURRENT_TIMESTAMP;

-- deposits
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments-deposits', @crm, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_proftit:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where crm = @crm and type_name = 'Deposit'
  order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Pro
 select id as soureTransactionId from thedatabrainers.trading_account_deposits tad where 
	tad.updated_at >= @top_time_proftit;
       
           
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablePro
	select
tad.id as id,
cu.brand_name as brand_name,
tad.customerId as customer_id,
tad.created_at as creation_time,
cu.last_update_time as customer_last_update_time,
tad.updated_at as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
case
	when pro_cus.ftdId = tad.id then 1
    else 0 end
    as  is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
0 as type,
'Deposit' as type_name,
tad.statusId as status,
case 
when tad.statusId= 1 then 'Pending'
when tad.statusId= 2 then 'Requested'
when tad.statusId= 3 then 'Success'
when tad.statusId= 4 then 'Canceled'
when tad.statusId= 5 then 'Failure' -- 'Declined'
when tad.statusId= 6 then 'Failure' -- 'Rejected'
when tad.statusId= 7 then 'Withdrawable'
when tad.statusId= 8 then 'Partial'
when tad.statusId= 9 then 'Closed'
when tad.statusId= 10 then 'Deleted'
end as status_name,
tad.amountApproved as amount,
0 as currency,
tad.amountApprovedBasic as base_amount,
tad.note as comment,
cu.actual_desk_id as actual_desk_id,
cu.actual_desk_name as actual_desk_name,
cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Proftit' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
-- *********************
tad.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
-- ****************************
10 AS acquisition_status,
null as acquisition_status_name,

-- IF(cu.ftdId IS NULL, 0,1) AS acquisition_status,
-- IF(cu.ftdId IS NULL,'Retention','Conversion') as acquisition_status_name,

cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,

tad.created_at as  decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

-- bb.sales_rep_id as transaction_conv_owner_id,
0 as transaction_conv_owner_id,
-- tranConvOwner.full_name as  transaction_conv_owner_name, 
null as  transaction_conv_owner_name, 
-- bb.sales_desk_id as transaction_conv_desk_id,
0 as transaction_conv_desk_id,
-- tranConvDesk.name transaction_conv_desk_name,
null as ransaction_conv_desk_name,
-- bb.retention_rep_id as  transaction_ret_owner_id,
0  as  transaction_ret_owner_id,
-- tranRetOwner.full_name as transaction_ret_owner_name,
null  as transaction_ret_owner_name,
-- bb.retention_desk_id  as transaction_ret_desk_id,
0 as transaction_ret_desk_id,
-- tranRetDesk.name as  transaction_ret_desk_name, 
null as  transaction_ret_desk_name, 
tad.ownerId as  transaction_owner_id,
concat(us.firstName, ' ' ,us.lastName) as transaction_owner_name,
de.id as transaction_desk_id,
de.name as transaction_desk_name,
clc.name as  psp_name,
tad.syncRemoteId as psp_transaction_id,

cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
' ' as user_withdrawal_reason



from DWH.TR_Pro pro left join  thedatabrainers.trading_account_deposits tad on pro.soureTransactionId = tad.id
 left join  DWH.dwh_customers cu on tad.customerId = cu.id and cu.crm='Proftit'
        left join thedatabrainers.customers pro_cus on tad.customerId = pro_cus.id
        left join thedatabrainers.users us   on tad.ownerId = us.id
        left join thedatabrainers.user_brand_desks ubd on tad.ownerId = ubd.userId and tad.syncBrandId = ubd.brandId  and cu.campaign_id = ubd.campaignId
        left join thedatabrainers.desks  de on ubd.deskId = de.id
		left join thedatabrainers.transaction_transfer_creditcards as cc on cc.id=tad.cardTransId
        left join thedatabrainers.clearing_companies as clc on clc.id= cc.clearingCompanyId;

-- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_Pro) and crm = @crm and type_name='Deposit');

INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id,customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason )
select * from DWH.TempTablePro;


drop table DWH.TR_Pro;
drop table DWH.TempTablePro;
# Update  control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @crm and object ='dwh_payments-deposits';
COMMIT; 
-- -----------------------------------------------------------------------------------------------
-- Withdrawal

insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments-withdrawal', @crm, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_proftit:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where crm = @crm and type_name = 'Withdrawal'
  order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Pro
 select id as soureTransactionId from thedatabrainers.trading_account_withdrawals taw where 
	taw.updated_at > @top_time_proftit;
       
           
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablePro
SELECT 
taw.id as id,
cu.brand_name as brand_name,
taw.customerId as customer_id,
taw.created_at as creation_time,
cu.last_update_time as customer_last_update_time,
taw.updated_at as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
0 as  is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
1 as type,
'Withdrawal' as type_name,
taw.statusId as status,
case 
when taw.statusId= 1 then 'Pending'
when taw.statusId= 2 then 'Requested'
when taw.statusId= 3 then 'Success'
when taw.statusId= 4 then 'Canceled'
when taw.statusId= 5 then 'Failure' -- 'Declined'
when taw.statusId= 6 then 'Failure' -- 'Rejected'
when taw.statusId= 7 then 'Withdrawable'
when taw.statusId= 8 then 'Partial'
when taw.statusId= 9 then 'Closed'
when taw.statusId= 10 then 'Deleted'
end as status_name,
-1*taw.amount as amount,
0 as currency,
-1*taw.amountBasic as base_amount,
taw.reason as comment,
cu.actual_desk_id as actual_desk_id,
cu.actual_desk_name as actual_desk_name,
cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Proftit' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
-- *********************
-- taw.ip as transaction_ip,
'0:0:0:0' as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
-- ****************************
-- bb.acquisition_status as acquisition_status,
10 AS acquisition_status,
null as acquisition_status_name,

-- IF(cu.ftdId IS NULL, 0,1) AS acquisition_status,
-- IF(cu.ftdId IS NULL,'Retention','Conversion') as acquisition_status_name,

-- ****************************
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,

taw.created_at as  decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

-- bb.sales_rep_id as transaction_conv_owner_id,
0 as transaction_conv_owner_id,
-- tranConvOwner.full_name as  transaction_conv_owner_name, 
null as  transaction_conv_owner_name, 
-- bb.sales_desk_id as transaction_conv_desk_id,
0 as transaction_conv_desk_id,
-- tranConvDesk.name transaction_conv_desk_name,
null as ransaction_conv_desk_name,
-- bb.retention_rep_id as  transaction_ret_owner_id,
0  as  transaction_ret_owner_id,
-- tranRetOwner.full_name as transaction_ret_owner_name,
null  as transaction_ret_owner_name,
-- bb.retention_desk_id  as transaction_ret_desk_id,
0 as transaction_ret_desk_id,
-- tranRetDesk.name as  transaction_ret_desk_name, 
null as  transaction_ret_desk_name, 
taw.ownerId as  transaction_owner_id,
concat(us.firstName, ' ' ,us.lastName) as transaction_owner_name,
de.id as transaction_desk_id,
de.name as transaction_desk_name,
' ' as  psp_name,
' ' as psp_transaction_id,

cu.customer_creation_time as customer_creation_time,
' ' as currency_name,
' ' AS transaction_method,
' ' AS transaction_method_name,
' '  as psp_descriptor,
' ' as sub_psp_name,
' ' as sub_psp_transaction_id,
' ' as card_expiry,
' '  as card_number,
' ' as card_type,
' ' as comment_for_user,
' ' as transaction_external_id,
taw.reason as user_withdrawal_reason
-- taw.psp_name as  psp_name,
-- taw.psp_transaction_id as psp_transaction_id

-- case bb.acquisition_status
-- 	when 0 then bb.sales_desk_id
--     when 1 then bb.retention_desk_id
-- end as  transaction_desk_id,
--   case bb.acquisition_status
-- 	when 0 then tranConvDesk.name
 --    when 1 then tranRetDesk.name 
-- end as  transaction_desk_name


-- *************************
    FROM DWH.TR_Pro pro left join thedatabrainers.trading_account_withdrawals taw on pro.soureTransactionId = taw.id
        left join DWH.dwh_customers cu on taw.customerId = cu.id and crm = 'Proftit'
        left join thedatabrainers.users us on taw.ownerId = us.id
        left join thedatabrainers.user_brand_desks ubd on taw.ownerId = ubd.userId and taw.syncBrandId = ubd.brandId  and cu.campaign_id = ubd.campaignId
        left join thedatabrainers.desks  de on ubd.deskId = de.id;
   -- WHERE
     --   (taw.requestId IS NOT NULL);
        

-- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_Pro) and crm = @crm and type_name='Withdrawal');

INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id,customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason )
select * from DWH.TempTablePro;

-- -----------------------------------------------------------------------------------------------
-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);


drop table DWH.TR_Pro;
drop table DWH.TempTablePro;
# Update  control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @crm and object ='dwh_payments-withdrawal';
COMMIT; 
*/
-- *********************************** StarCapital **********************************
set @Brand='StarCapital';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_payments', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_star:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = @Brand
 order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Star
 select id as soureTransactionId from antelopedb_StarCapital.broker_banking bb where 
 	 bb.last_update_time >= @top_time_star
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableStarCapital
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
-- bb.sub_psp_name as sub_psp_name,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 -- from DWH.TR_Star musu left join antelopedb_StarCapital.broker_banking bb on musu.soureTransactionId = bb.id left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand;
 from DWH.TR_Star star left join antelopedb_StarCapital.broker_banking bb on
 star.soureTransactionId = bb.id left join
 (select * from  DWH.dwh_customers  where  brand_name = @Brand) cu ON bb.user_id = cu.id
 left join antelopedb_StarCapital.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_StarCapital.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_StarCapital.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_StarCapital.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_Star) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)

 select * from DWH.TempTableStarCapital;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_Star;
drop table DWH.TempTableStarCapital;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;

-- *********************************** 7Online **********************************
set @Brand='7Online';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_payments', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_7online:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = @Brand
 order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_7Online
 select id as soureTransactionId from antelopedb_7Online.broker_banking bb where 
 	 bb.last_update_time >= @top_time_7online
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTable7Online
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
-- bb.sub_psp_name as sub_psp_name,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 -- from DWH.TR_7Online musu left join antelopedb_7Online.broker_banking bb on musu.soureTransactionId = bb.id left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand;
 from DWH.TR_7Online 7Online left join antelopedb_7Online.broker_banking bb on
 7Online.soureTransactionId = bb.id left join
 (select * from  DWH.dwh_customers  where  brand_name = @Brand) cu ON bb.user_id = cu.id
 left join antelopedb_7Online.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_7Online.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_7Online.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_7Online.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_7Online) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTable7Online;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_7Online;
drop table DWH.TempTable7Online;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;

-- *********************************** External Brands **********************************
/*
set @crm='ExternalBrands';

set @Update_time=CURRENT_TIMESTAMP;
  insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @crm, @runId, CURRENT_TIMESTAMP);

-- fetch deposits id to be added
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_external
 select id as soureTransactionId from Events.customer_externals_deposits bb where 
 bb.id not in (select id from DWH.dwh_payments where crm=@crm);
  -- SELECT * FROM DWH.TR_external;
  
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableExternal
select bb.id as id,
bb.brand_name as brand_name,
bb.customer_crm_id as customer_id,
cu.ftd_time as creation_time,
cu.last_update_time as customer_last_update_time,
cu.ftd_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
1 as is_ftd,
-- bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
0 as type,
'Deposit' as type_name,
0 as status,
'Success' as status_name,
usdAmount as amount,
35 as currency,
usdAmount as base_amount,
null as comment,
cu.actual_desk_id as actual_desk_id,
cu.actual_desk_name as actual_desk_name,
cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'ExternalBrands' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
null as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
0 as acquisition_status,
'Conversion' as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
cu.ftd_time as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,
-1 as transaction_conv_owner_id,
'external' as  transaction_conv_owner_name, 
-1  as transaction_conv_desk_id,
'external' transaction_conv_desk_name,
-1  as  transaction_ret_owner_id,
'external' as transaction_ret_owner_name,
-1  as transaction_ret_desk_id,
'external' as  transaction_ret_desk_name, 
-1  transaction_owner_id,
'external' as  transaction_owner_name,
-1  transaction_desk_id,
'external' as  transaction_desk_name,
'external' as  psp_name,
-1 as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
'USD' as currency_name,
'external' AS transaction_method,
'external' AS transaction_method_name,
null as psp_descriptor,
'external' as sub_psp_name,
-1 as sub_psp_transaction_id,
null as card_expiry,
null as card_number,
null as card_type,
null as comment_for_user,
-1 as transaction_external_id,
null  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(cu.ftd_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(cu.ftd_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


from DWH.TR_external external  left join Events.customer_externals_deposits bb on
 external.soureTransactionId = bb.id  left join DWH.dwh_customers cu ON bb.customer_crm_id = cu.id and bb.brand_name= cu.brand_name;

 -- select * from TempTableExternal;
   -- delete rows to be updated/ on target table
-- delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_7Online) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableExternal;

-- delete rows of customers not in dwh_customers
-- delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_external;
drop table DWH.TempTableExternal;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @crm;
COMMIT;
*/
-- *********************************** Roimax **********************************
set @Brand='ROIMAX';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_payments', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_Roimax:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = @Brand
 order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Roimax
 select id as soureTransactionId from antelope_roimax.broker_banking bb where 
 	 bb.last_update_time >= @top_time_Roimax
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableRoimax
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
-- bb.sub_psp_name as sub_psp_name,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 -- from DWH.TR_Roimax musu left join antelope_roimax.broker_banking bb on musu.soureTransactionId = bb.id left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand;
 from DWH.TR_Roimax Roimax left join antelope_roimax.broker_banking bb on
 Roimax.soureTransactionId = bb.id left join
 (select * from  DWH.dwh_customers  where  brand_name = @Brand) cu ON bb.user_id = cu.id
 left join antelope_roimax.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelope_roimax.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelope_roimax.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelope_roimax.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_Roimax) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableRoimax;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_Roimax;
drop table DWH.TempTableRoimax;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;

-- *********************************** AlphaLive **********************************
set @Brand='AlphaLive';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_payments', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

-- DATE_SUB(last_update_time, INTERVAL 1 DAY)
SELECT @top_time_AlphaLive:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = @Brand
 order by last_update_time desc limit 1;


-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_AlphaLive
 select id as soureTransactionId from antelopedb_alphalive.broker_banking bb where 
 	 bb.last_update_time >= @top_time_AlphaLive
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableAlphaLive
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
-- bb.sub_psp_name as sub_psp_name,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6


 -- from DWH.TR_AlphaLive musu left join antelopedb_alphalive.broker_banking bb on musu.soureTransactionId = bb.id left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand;
 from DWH.TR_AlphaLive AlphaLive left join antelopedb_alphalive.broker_banking bb on
 AlphaLive.soureTransactionId = bb.id left join
 (select * from  DWH.dwh_customers  where  brand_name = @Brand) cu ON bb.user_id = cu.id
 left join antelopedb_alphalive.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_alphalive.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_alphalive.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_alphalive.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_AlphaLive) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableAlphaLive;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_AlphaLive;
drop table DWH.TempTableAlphaLive;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;

-- *********************************** superfive **********************************
set @Brand='SuperFive';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_superfive:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_superfive
 select id as soureTransactionId from antelopedb_superfive.broker_banking bb 
 where 
 	 bb.last_update_time >= @top_time_superfive
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablesuperfive
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6
 from DWH.TR_superfive superfive 
 left join antelopedb_superfive.broker_banking bb on superfive.soureTransactionId = bb.id 
 left join DWH.dwh_customers cu ON bb.user_id = cu.id AND brand_name = @Brand
 left join antelopedb_superfive.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_superfive.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_superfive.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_superfive.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_superfive) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTablesuperfive;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_superfive;
drop table DWH.TempTablesuperfive;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;

-- *********************************** coinlife **********************************
set @Brand='CoinLife';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_payments', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_coinlife:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_payments
 Where brand_name = @Brand
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_coinlife
 select id as soureTransactionId from antelopedb_coinlife.broker_banking bb 
 where 
 	 bb.last_update_time >= @top_time_coinlife
	and  bb.normalized_amount/100 > 2;

-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablecoinlife
select bb.id as id,
@Brand as brand_name,
bb.user_id as customer_id,
bb.creation_time as creation_time,
cu.last_update_time as customer_last_update_time,
bb.last_update_time as last_update_time,
cu.country_iso as country_iso,
cu.language_iso as language_iso,
cu.sales_status as sales_status,
cu.retention_status as retention_status,
cu.campaign_id as campaign_id,
cu.campaign_name as campaign_name,
cu.sales_rep_id as sales_rep_id,
cu.sales_rep_name as sales_rep_name,
cu.ret_rep_id as ret_rep_id,
cu.ret_rep_name as ret_rep_name,
cu.sales_desk_id as sales_desk_id,
cu.sales_desk_name as sales_desk_name,
cu.ret_desk_id as ret_desk_id,
cu.ret_desk_name as ret_desk_name,
bb.is_ftd as is_ftd,
cu.is_demo as is_demo,
cu.is_test as is_test,
cu.ftd_time as ftd_time,
bb.type as type,
case 
	 when bb.type = 0 then 'Deposit'
    when bb.type = 1  then 'Withdrawal'
    when bb.type = 2  then 'Transaction In'
    when bb.type = 3  then 'Transaction Out'
    when bb.type = 5  then 'Fee'
end as type_name,
bb.status as status,
case 
	when bb.status = 0 then 'Success'
    when bb.status = 1 then 'Failure'
    when bb.status = 2  then 'Pending'
    when bb.status = 3  then 'Canceled'
	when bb.status = 4  then 'Timeout'
end as status_name,
case 
	when bb.type = 0 then bb.amount/100
	when bb.type =1 then -1*bb.amount/100 
    else bb.amount/100
 end as amount,
 bb.currency as currency,
  case 
	when bb.type = 0 then bb.normalized_amount/100
	when bb.type =1 then -1*bb.normalized_amount/100
    else bb.normalized_amount/100
 end as base_amount,
  bb.comment as comment,
 cu.actual_desk_id as actual_desk_id,
 cu.actual_desk_name as actual_desk_name,
 cu.actual_rep_id as actual_rep_id,
cu.actual_rep_name as  actual_rep_name,
'Cryptency' as crm,
cu.email as email,
cu.telephone as telephone,
cu.first_name as first_name,
cu.source as source,
bb.ip as transaction_ip,
cu.registration_ip as registration_ip,
cu.kyc_status as kyc_status,
cu.kyc_note as kyc_note,
cu.kyc_date as kyc_date,
bb.acquisition_status as acquisition_status,
case bb.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
cu.first_convertion_agent_id as first_convertion_agent_id,
cu.first_convertion_agent_name as first_convertion_agent_name,
cu.first_convertion_desk_id as first_convertion_desk_id,
cu.first_convertion_desk_name as first_convertion_desk_name,
cu.first_retention_agent_id as first_retention_agent_id,
cu.first_retention_agent_name as first_retention_agent_name,
cu.first_retention_desk_id as first_retention_desk_id,
cu.first_retention_desk_name as first_retention_desk_name,
cu.last_login_date as last_login_date,
case 
	when bb.type = 0 then bb.creation_time
	when bb.type = 1 then bb.decision_time
    else bb.creation_time
end as decision_time,
cu.last_retention_note_time as last_retention_note_time,
cu.last_sales_note_time as last_sales_note_time,

bb.sales_rep_id as transaction_conv_owner_id,
tranConvOwner.full_name as  transaction_conv_owner_name, 
bb.sales_desk_id as transaction_conv_desk_id,
tranConvDesk.name transaction_conv_desk_name,
bb.retention_rep_id as  transaction_ret_owner_id,
tranRetOwner.full_name as transaction_ret_owner_name,
bb.retention_desk_id  as transaction_ret_desk_id,
tranRetDesk.name as  transaction_ret_desk_name, 
case bb.acquisition_status
	when 0 then bb.sales_rep_id
    when 1 then bb.retention_rep_id
end as  transaction_owner_id,
case bb.acquisition_status
	when 0 then tranConvOwner.full_name
    when 1 then tranRetOwner.full_name
end as  transaction_owner_name,
case bb.acquisition_status
	when 0 then bb.sales_desk_id
    when 1 then bb.retention_desk_id
end as  transaction_desk_id,
  case bb.acquisition_status
	when 0 then tranConvDesk.name
    when 1 then tranRetDesk.name 
end as  transaction_desk_name,
bb.psp_name as  psp_name,
bb.psp_transaction_id as psp_transaction_id,
cu.customer_creation_time as customer_creation_time,
case 
	when bb.currency = 35 then 'USD'
    else 'USD'
    end as currency_name,
bb.transaction_method AS transaction_method,
case
WHEN bb.transaction_method= 0 THEN 'Credit Card'
WHEN bb.transaction_method= 1 THEN 'Wire'
WHEN bb.transaction_method= 2 THEN 'Credit Card (external iFrame)'
WHEN bb.transaction_method= 3 THEN 'None'
WHEN bb.transaction_method= 4 THEN 'Migration'
WHEN bb.transaction_method= 4 THEN 'Internal Transfer'
ELSE 'None' 
END AS transaction_method_name,
bb.psp_descriptor as psp_descriptor,
IF(bb.sub_psp_name IS NULL, bb.comment,bb.sub_psp_name) AS sub_psp_name,
bb.sub_psp_transaction_id as sub_psp_transaction_id,
bb.card_expiry as card_expiry,
bb.card_number as card_number,
bb.card_type as card_type,
bb.comment_for_user as comment_for_user,
bb.external_id as transaction_external_id,
bb.user_withdrawal_reason  as user_withdrawal_reason,
cu.crmEncodedID as crmEncodedID,
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd,
cu.last_name as last_name,
cu.param1 as param1,
cu.param2 as param2,
cu.param3 as param3,
cu.param4 as param4,
cu.param5 as param5,
cu.param6 as param6
 from DWH.TR_coinlife coinlife 
 left join antelopedb_coinlife.broker_banking bb on coinlife.soureTransactionId = bb.id 
 left join DWH.dwh_customers cu ON bb.user_id = cu.id AND brand_name = @Brand
 left join antelopedb_coinlife.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_coinlife.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_coinlife.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_coinlife.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id;
 
 -- and cu.last_update_time is not null
 
   -- delete rows to be updated/ on target table
delete from DWH.dwh_payments where (id in (select soureTransactionId from DWH.TR_coinlife) and brand_name = @Brand);
-- 
INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time,
country_iso, language_iso, sales_status, retention_status, campaign_id, campaign_name,
sales_rep_id, sales_rep_name, ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name,
ret_desk_id, ret_desk_name, is_ftd, is_demo, is_test, ftd_time, type, type_name,
status, status_name, amount, currency, base_amount, comment, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm , email, telephone, first_name, source
,transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 crmEncodedID, creation_time_dateonly, decision_time_dateonly, is_frd,
 last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTablecoinlife;

-- delete rows of customers not in dwh_customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);

# Insert into control table

drop table DWH.TR_coinlife;
drop table DWH.TempTablecoinlife;


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;


analyze table dwh_payments;
    
    
END$$
DELIMITER ;

USE DWH;
--  sync_customers --------------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS sync_customers;
CREATE PROCEDURE sync_customers()
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION

 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_customers- error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);
end;

set @runId=  UUID();
set @lag=0; -- fetches data back in hours (positive number)
SET FOREIGN_KEY_CHECKS=0;
-- *********************************** Cryptomusu **********************************

set @Brand='Cryptomusu';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_musu:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = 'Cryptomusu' 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Musu
 select id as soureTransactionId from antelopedb.users where 
  last_update_time >= @top_time_musu;
          
           
 --  select count(*) from DWH.TR_Musu;
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableCryptomusu
select us.id as id,
'Cryptomusu' as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name
,case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm
, us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6


from DWH.TR_Musu left join antelopedb.users us on TR_Musu.soureTransactionId = us.id
 left join antelopedb.affiliate aff on us.affiliate_id = aff.id 
left join antelopedb.operators opSales on us.sales_rep = opSales.id
left join antelopedb.operators opRetention on us.retention_rep = opRetention.id
left join antelopedb.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopedb.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopedb.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopedb.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopedb.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopedb.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopedb.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopedb.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopedb.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id;
-- left join (select ap.advertisers_id adId, ap.crmUserID crmUserID, ap.crmEncodedID crmEncodedID, ad.name adName from Events.dwh_api ap left join  Events.dwh_advertisers ad on ap.advertisers_id = ad.id  where ad.name=@Brand ) dwhApi
-- 	on TR_Musu.soureTransactionId = dwhApi.crmUserID and dwhApi.adName=@Brand

-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_Musu) and brand_name = 'Cryptomusu');

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time,first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableCryptomusu;

-- sync customer field on dwh_payment row
update dwh_payments pay right join DWH.TempTableCryptomusu musu on pay.customer_id = musu.id and 
pay.brand_name = musu.brand_name
set pay.customer_last_update_time = musu.last_update_time,
pay.country_iso = musu.country_iso,
pay.language_iso = musu.language_iso,
pay.sales_status = musu.sales_status,
pay.retention_status = musu.retention_status,
pay.campaign_id = musu.campaign_id,
pay.campaign_name = musu.campaign_name,
pay.sales_rep_id = musu.sales_rep_id,
pay.sales_rep_name = musu.sales_rep_name,
pay.ret_rep_id = musu.retention_rep_id,
pay.ret_rep_name = musu.ret_rep_name,
pay.sales_desk_id = musu.sales_desk_id,
pay.sales_desk_name = musu.sales_desk_name,
pay.ret_desk_id = musu.retention_desk_id,
pay.ret_desk_name = musu.ret_desk_name,
pay.is_demo = musu.is_demo,
pay.is_test = musu.is_test,
pay.ftd_time = musu.ftd_time,
pay.actual_rep_id = musu.actual_rep_id,
pay.actual_rep_name = musu.actual_rep_name,
pay.email = musu.email,
pay.telephone = musu.telephone,
pay.first_name = musu.first_name,
pay.source= musu.source,
pay.registration_ip = musu.registration_ip,
pay.kyc_status = musu.kyc_status,
pay.kyc_note = musu.kyc_note,
pay.kyc_date = musu.kyc_date,
pay.first_convertion_agent_id = musu.first_convertion_agent_id,
pay.first_convertion_agent_name = musu.first_convertion_agent_name,
pay.first_convertion_desk_id = musu.first_convertion_desk_id,
pay.first_convertion_desk_name = musu.first_convertion_desk_name,
pay.first_retention_agent_id = musu.first_retention_agent_id,
pay.first_retention_agent_name = musu.first_retention_agent_name,
pay.first_retention_desk_id = musu.first_retention_desk_id,
pay.first_retention_desk_name = musu.first_retention_desk_name,
pay.last_login_date = musu.last_login_date,
pay.last_retention_note_time = musu.last_retention_note_time,
pay.last_sales_note_time = musu.last_sales_note_time,
pay.customer_creation_time = musu.customer_creation_time,
pay.first_ret_agent_assignment_time = musu.first_ret_agent_assignment_time,
pay.crmEncodedID = musu.crmEncodedID,
pay.first_ret_agent_assignment_time_dateonly = musu.first_ret_agent_assignment_time_dateonly,
pay.last_name  = musu.last_name,
pay.param1 = musu.param1,
pay.param2 = musu.param2,
pay.param3 = musu.param3,
pay.param4 = musu.param4,
pay.param5 = musu.param5,
pay.param6 = musu.param6;


-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTableCryptomusu musu on bon.customer_id = musu.id and 
bon.brand_name = musu.brand_name
set bon.customer_last_update_time = musu.last_update_time,
bon.country_iso = musu.country_iso,
bon.language_iso = musu.language_iso,
bon.sales_status = musu.sales_status,
bon.retention_status = musu.retention_status,
bon.campaign_id = musu.campaign_id,
bon.campaign_name = musu.campaign_name,
bon.sales_rep_id = musu.sales_rep_id,
bon.sales_rep_name = musu.sales_rep_name,
bon.ret_rep_id = musu.retention_rep_id,
bon.ret_rep_name = musu.ret_rep_name,
bon.sales_desk_id = musu.sales_desk_id,
bon.sales_desk_name = musu.sales_desk_name,
bon.ret_desk_id = musu.retention_desk_id,
bon.ret_desk_name = musu.ret_desk_name,
bon.is_demo = musu.is_demo,
bon.is_test = musu.is_test,
bon.ftd_time = musu.ftd_time,
bon.actual_rep_id = musu.actual_rep_id,
bon.actual_rep_name = musu.actual_rep_name,
-- bon.is_ftd = musu.is_ftd,
bon.email = musu.email,
bon.telephone = musu.telephone,
bon.first_name = musu.first_name,
bon.source= musu.source,
bon.registration_ip = musu.registration_ip,
bon.kyc_status = musu.kyc_status,
bon.kyc_note = musu.kyc_note,
bon.kyc_date = musu.kyc_date,
bon.first_convertion_agent_id = musu.first_convertion_agent_id,
bon.first_convertion_agent_name = musu.first_convertion_agent_name,
bon.first_convertion_desk_id = musu.first_convertion_desk_id,
bon.first_convertion_desk_name = musu.first_convertion_desk_name,
bon.first_retention_agent_id = musu.first_retention_agent_id,
bon.first_retention_agent_name = musu.first_retention_agent_name,
bon.first_retention_desk_id = musu.first_retention_desk_id,
bon.first_retention_desk_name = musu.first_retention_desk_name,
bon.last_login_date = musu.last_login_date,
bon.last_retention_note_time = musu.last_retention_note_time,
bon.last_sales_note_time = musu.last_sales_note_time,
bon.customer_creation_time = musu.customer_creation_time,
bon.first_ret_agent_assignment_time = musu.first_ret_agent_assignment_time,
bon.crmEncodedID = musu.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = musu.first_ret_agent_assignment_time_dateonly,
bon.last_name  = musu.last_name,
bon.param1 = musu.param1,
bon.param2 = musu.param2,
bon.param3 = musu.param3,
bon.param4 = musu.param4,
bon.param5 = musu.param5,
bon.param6 = musu.param6;

# Insert into control table
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 1, 'dwh_customers', @Brand, @runId);
#insert into control (last_update_time, flag, object, brand, runId) values (@Update_time, 1, 'dwh_customers', @Brand, @runId);
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;

COMMIT;   

-- *********************************** Go365 **********************************
-- set @runId=  UUID();
-- set @Update_time=CURRENT_TIMESTAMP;
SET FOREIGN_KEY_CHECKS=0;
set @Brand2='Go365';
set @Update_time=CURRENT_TIMESTAMP;

#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand2, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @Brand2, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_go365:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = 'Go365'
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Go365
 select id as soureTransactionId from antelopeDbGo365.users where 
 /* ((antelopeDbGo365.users.is_test = 0)
            and (antelopeDbGo365.users.is_demo = 0)
            and (antelopeDbGo365.users.country_iso <> 'XX')
            and (not ((antelopeDbGo365.users.email like '%test%')))
            and (not ((antelopeDbGo365.users.email like '%qavova%')))
            and (not ((antelopeDbGo365.users.email like '%affiliate%')))
            and (not ((antelopeDbGo365.users.full_name like '%test%')))
            and (antelopeDbGo365.users.id not in (0)))  */
			-- email not like '%automation%' and 
            last_update_time >= @top_time_go365;
            
           
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableGo365
select us.id as id,
'Go365' as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test= 1 then us.is_test
when us.is_demo= 1 then 1
when ((us.country_iso = 'XX') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,
 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,
case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name
,case us.retention_desk_id
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_desk_id
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
 us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6

from DWH.TR_Go365 
left join antelopeDbGo365.users us on TR_Go365.soureTransactionId = us.id
left join antelopeDbGo365.affiliate aff on us.affiliate_id = aff.id 
left join antelopeDbGo365.operators opSales on us.sales_rep = opSales.id
left join antelopeDbGo365.operators opRetention on us.retention_rep = opRetention.id
left join antelopeDbGo365.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopeDbGo365.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopeDbGo365.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopeDbGo365.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopeDbGo365.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopeDbGo365.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopeDbGo365.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopeDbGo365.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopeDbGo365.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id; 
-- left join (select ap.advertisers_id adId, ap.crmUserID crmUserID, ap.crmEncodedID crmEncodedID, ad.name adName from Events.dwh_api ap left join  Events.dwh_advertisers ad on ap.advertisers_id = ad.id  where ad.name=@Brand ) dwhApi
-- 	on TR_Go365.soureTransactionId = dwhApi.crmUserID and dwhApi.adName=@Brand;






-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_Go365) and brand_name = 'Go365');


INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm , registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time,first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly
,last_name, param1, param2, param3, param4, param5, param6)

select * from DWH.TempTableGo365;

-- sync customer field on dwh_payment row
update dwh_payments pay right join DWH.TempTableGo365 go on pay.customer_id = go.id and 
pay.brand_name = go.brand_name
set pay.customer_last_update_time = go.last_update_time,
pay.country_iso = go.country_iso,
pay.language_iso = go.language_iso,
pay.sales_status = go.sales_status,
pay.retention_status = go.retention_status,
pay.campaign_id = go.campaign_id,
pay.campaign_name = go.campaign_name,
pay.sales_rep_id = go.sales_rep_id,
pay.sales_rep_name = go.sales_rep_name,
pay.ret_rep_id = go.retention_rep_id,
pay.ret_rep_name = go.ret_rep_name,
pay.sales_desk_id = go.sales_desk_id,
pay.sales_desk_name = go.sales_desk_name,
pay.ret_desk_id = go.retention_desk_id,
pay.ret_desk_name = go.ret_desk_name,
pay.is_demo = go.is_demo,
pay.is_test = go.is_test,
pay.ftd_time = go.ftd_time,
pay.actual_rep_id = go.actual_rep_id,
pay.actual_rep_name = go.actual_rep_name,
pay.email = go.email,
pay.telephone = go.telephone,
pay.first_name = go.first_name,
pay.source= go.source,
pay.registration_ip = go.registration_ip,
pay.kyc_status = go.kyc_status,
pay.kyc_note = go.kyc_note,
pay.kyc_date = go.kyc_date,
pay.first_convertion_agent_id = go.first_convertion_agent_id,
pay.first_convertion_agent_name = go.first_convertion_agent_name,
pay.first_convertion_desk_id = go.first_convertion_desk_id,
pay.first_convertion_desk_name = go.first_convertion_desk_name,
pay.first_retention_agent_id = go.first_retention_agent_id,
pay.first_retention_agent_name = go.first_retention_agent_name,
pay.first_retention_desk_id = go.first_retention_desk_id,
pay.first_retention_desk_name = go.first_retention_desk_name,
pay.last_login_date = go.last_login_date,
pay.last_retention_note_time = go.last_retention_note_time,
pay.last_sales_note_time = go.last_sales_note_time,
pay.customer_creation_time = go.customer_creation_time,
pay.first_ret_agent_assignment_time = go.first_ret_agent_assignment_time,
pay.crmEncodedID = go.crmEncodedID,
pay.first_ret_agent_assignment_time_dateonly = go.first_ret_agent_assignment_time_dateonly,
pay.last_name  = go.last_name,
pay.param1 = go.param1,
pay.param2 = go.param2,
pay.param3 = go.param3,
pay.param4 = go.param4,
pay.param5 = go.param5,
pay.param6 = go.param6;

-- sync customer field on dwh_bonus row
update dwh_bonus bon1 right join DWH.TempTableGo365 go on bon1.customer_id = go.id and 
bon1.brand_name = go.brand_name
set bon1.customer_last_update_time = go.last_update_time,
bon1.country_iso = go.country_iso,
bon1.language_iso = go.language_iso,
bon1.sales_status = go.sales_status,
bon1.retention_status = go.retention_status,
bon1.campaign_id = go.campaign_id,
bon1.campaign_name = go.campaign_name,
bon1.sales_rep_id = go.sales_rep_id,
bon1.sales_rep_name = go.sales_rep_name,
bon1.ret_rep_id = go.retention_rep_id,
bon1.ret_rep_name = go.ret_rep_name,
bon1.sales_desk_id = go.sales_desk_id,
bon1.sales_desk_name = go.sales_desk_name,
bon1.ret_desk_id = go.retention_desk_id,
bon1.ret_desk_name = go.ret_desk_name,
bon1.is_demo = go.is_demo,
bon1.is_test = go.is_test,
bon1.ftd_time = go.ftd_time,
bon1.actual_rep_id = go.actual_rep_id,
bon1.actual_rep_name = go.actual_rep_name,
bon1.is_ftd = go.is_ftd,
bon1.email = go.email,
bon1.telephone = go.telephone,
bon1.first_name = go.first_name,
bon1.source= go.source,
bon1.registration_ip = go.registration_ip,
bon1.kyc_status = go.kyc_status,
bon1.kyc_note = go.kyc_note,
bon1.kyc_date = go.kyc_date,
bon1.first_convertion_agent_id = go.first_convertion_agent_id,
bon1.first_convertion_agent_name = go.first_convertion_agent_name,
bon1.first_convertion_desk_id = go.first_convertion_desk_id,
bon1.first_convertion_desk_name = go.first_convertion_desk_name,
bon1.first_retention_agent_id = go.first_retention_agent_id,
bon1.first_retention_agent_name = go.first_retention_agent_name,
bon1.first_retention_desk_id = go.first_retention_desk_id,
bon1.first_retention_desk_name = go.first_retention_desk_name,
bon1.last_login_date = go.last_login_date,
bon1.last_retention_note_time = go.last_retention_note_time,
bon1.last_sales_note_time = go.last_sales_note_time,
bon1.customer_creation_time = go.customer_creation_time,
bon1.first_ret_agent_assignment_time = go.first_ret_agent_assignment_time,
bon1.crmEncodedID = go.crmEncodedID,
bon1.first_ret_agent_assignment_time_dateonly = go.first_ret_agent_assignment_time_dateonly,
bon1.last_name  = go.last_name,
bon1.param1 = go.param1,
bon1.param2 = go.param2,
bon1.param3 = go.param3,
bon1.param4 = go.param4,
bon1.param5 = go.param5,
bon1.param6 = go.param6;


# Update into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId  and brand = @Brand2;
COMMIT; 
-- ------------------*************************  Proftit
/*
set @Brand = 'Proftit';
set @crm = 'Proftit';

#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @crm, @runId, CURRENT_TIMESTAMP);


SELECT @top_time_proftit:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where crm = @crm 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Proftit
 select id as soureTransactionId from thedatabrainers.customers where 
   updated_at >= @top_time_proftit;
   
  -- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableProftit
select cu.id as id,
br.name as brand_name,
cu.created_at as creation_time,
cu.updated_at as last_update_time,
co.codeAlpha2 as country_iso,
concat(REPEAT('*', 3), SUBSTR(cu.email, 6, CHAR_LENGTH(cu.email)-5)) as email,
la.iso2 as language_iso,
concat(REPEAT('*', 3), SUBSTR(cu.phone, 6, CHAR_LENGTH(cu.phone)-5)) as telephone,
cu.firstName as first_name,
SUBSTRING(cu.marketingInfo,1,254) as source,
cu.isDemo as is_demo,
case 
when cu.isDemo= 1 then 1
when ((co.codeAlpha2 = 'XX') or (cu.email like '%test%') or (cu.firstName like '%test%') or (cu.lastName like '%test%') 
or (cu.email like '%qavova%') or (cu.email like '%affiliate%') ) then 1
else cu.isDemo end  as is_test,
gcs.name as sales_status,
gcs.name as retention_status,
cu.campaignId as campaign_id,
ca.name as campaign_name,
0 as sales_rep_id,
null as sales_rep_name,
0 as ret_rep_id,
null as ret_rep_name,
0 as sales_desk_id,
null as sales_desk_name,
0 as ret_desk_id,
null as ret_desk_name,
case when cu.ftdId  is null then 0
else 1 end  as has_ftd,
tad.created_at as ftd_time,
null as last_comment_date,
' ' as last_comment,
0 as last_comment_status,
cu.deskId as actual_desk_id,
de.name as actual_desk_name,
cu.userId as actual_rep_id,
concat(us.firstName, ' ' , us.lastName) as actual_rep_name,
case when cu.ftdId  is null then 0
else 1 end  as is_ftd,
'Proftit' as crm

-- *********************************
, '0:0:0:0' as registration_ip,
'no kyc' as  kyc_status,
' '  as kyc_note,
null as kyc_date,
IF(cu.ftdId IS NULL, 0,1) AS acquisition_status,
IF(cu.ftdId IS NULL,'Retention','Conversion') as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
0 as first_convertion_desk_id,
null as first_convertion_desk_name,
0 as first_retention_agent_id,
null as first_retention_agent_name,
0  as first_retention_desk_id,
null as first_retention_desk_name,
null as last_login_date,
null as last_retention_note_time,
null as last_sales_note_time,
cu.created_at as decision_time, 
cu.created_at as customer_creation_time

from  DWH.TR_Proftit pro left join thedatabrainers.customers cu on pro.soureTransactionId = cu.id left join thedatabrainers.campaigns ca on cu.campaignId = ca.id left join thedatabrainers.desks de on cu.deskId = de.id
left join thedatabrainers.brands br on cu.brandId = br.id left join thedatabrainers.countries co on cu.countryId = co.id left join thedatabrainers.languages la
on cu.languageId = la.id  left join thedatabrainers.general_customer_statuses gcs on  cu.general_status_id = gcs.id left join thedatabrainers.users us on
cu.userId = us.id left join thedatabrainers.trading_account_deposits tad on cu.ftdId = tad.id;

-- select * from DWH.TempTableProftit;

-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_Proftit) and crm = 'Proftit');


INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm 
, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time)
select * from DWH.TempTableProftit;


-- sync customer field on dwh_payment row
update dwh_payments pay right join DWH.TempTableProftit pro on pay.customer_id = pro.id and 
pay.crm = pro.crm
set pay.customer_last_update_time = pro.last_update_time,
pay.country_iso = pro.country_iso,
pay.language_iso = pro.language_iso,
pay.sales_status = pro.sales_status,
pay.retention_status = pro.retention_status,
pay.campaign_id = pro.campaign_id,
pay.campaign_name = pro.campaign_name,
pay.sales_rep_id = pro.sales_rep_id,
pay.sales_rep_name = pro.sales_rep_name,
pay.ret_rep_id = pro.ret_rep_id,
pay.ret_rep_name = pro.ret_rep_name,
pay.sales_desk_id = pro.sales_desk_id,
pay.sales_desk_name = pro.sales_desk_name,
pay.ret_desk_id = pro.ret_desk_id,
pay.ret_desk_name = pro.ret_desk_name,
pay.is_demo = pro.is_demo,
pay.is_test = pro.is_test,
pay.ftd_time = pro.ftd_time,
pay.actual_rep_id = pro.actual_rep_id,
pay.actual_rep_name = pro.actual_rep_name,
pay.email = pro.email,
pay.telephone = pro.telephone,
pay.first_name = pro.first_name,
pay.source= pro.source,
pay.registration_ip = pro.registration_ip,
pay.kyc_status = pro.kyc_status,
pay.kyc_note = pro.kyc_note,
pay.kyc_date = pro.kyc_date,
pay.first_convertion_agent_id = pro.first_convertion_agent_id,
pay.first_convertion_agent_name = pro.first_convertion_agent_name,
pay.first_convertion_desk_id = pro.first_convertion_desk_id,
pay.first_convertion_desk_name = pro.first_convertion_desk_name,
pay.first_retention_agent_id = pro.first_retention_agent_id,
pay.first_retention_agent_name = pro.first_retention_agent_name,
pay.first_retention_desk_id = pro.first_retention_desk_id,
pay.first_retention_desk_name = pro.first_retention_desk_name,
pay.last_login_date = pro.last_login_date,
pay.last_retention_note_time = pro.last_retention_note_time,
pay.last_sales_note_time = pro.last_sales_note_time,
pay.customer_creation_time = pro.customer_creation_time;



-- sync customer field on dwh_bonus row
update dwh_bonus bon1 right join DWH.TempTableProftit pro on bon1.customer_id = pro.id and 
bon1.crm = pro.crm
set bon1.customer_last_update_time = pro.last_update_time,
bon1.country_iso = pro.country_iso,
bon1.language_iso = pro.language_iso,
bon1.sales_status = pro.sales_status,
bon1.retention_status = pro.retention_status,
bon1.campaign_id = pro.campaign_id,
bon1.campaign_name = pro.campaign_name,
bon1.sales_rep_id = pro.sales_rep_id,
bon1.sales_rep_name = pro.sales_rep_name,
bon1.ret_rep_id = pro.ret_rep_id,
bon1.ret_rep_name = pro.ret_rep_name,
bon1.sales_desk_id = pro.sales_desk_id,
bon1.sales_desk_name = pro.sales_desk_name,
bon1.ret_desk_id = pro.ret_desk_id,
bon1.ret_desk_name = pro.ret_desk_name,
bon1.is_demo = pro.is_demo,
bon1.is_test = pro.is_test,
bon1.ftd_time = pro.ftd_time,
bon1.actual_rep_id = pro.actual_rep_id,
bon1.actual_rep_name = pro.actual_rep_name,
-- bon1.is_ftd = pro.is_ftd,
bon1.email = pro.email,
bon1.telephone = pro.telephone,
bon1.first_name = pro.first_name,
bon1.source= pro.source,
bon1.registration_ip = pro.registration_ip,
bon1.kyc_status = pro.kyc_status,
bon1.kyc_note = pro.kyc_note,
bon1.kyc_date = pro.kyc_date,
bon1.first_convertion_agent_id = pro.first_convertion_agent_id,
bon1.first_convertion_agent_name = pro.first_convertion_agent_name,
bon1.first_convertion_desk_id = pro.first_convertion_desk_id,
bon1.first_convertion_desk_name = pro.first_convertion_desk_name,
bon1.first_retention_agent_id = pro.first_retention_agent_id,
bon1.first_retention_agent_name = pro.first_retention_agent_name,
bon1.first_retention_desk_id = pro.first_retention_desk_id,
bon1.first_retention_desk_name = pro.first_retention_desk_name,
bon1.last_login_date = pro.last_login_date,
bon1.last_retention_note_time = pro.last_retention_note_time,
bon1.last_sales_note_time = pro.last_sales_note_time,
bon1.customer_creation_time = pro.customer_creation_time;


drop table DWH.TR_Proftit;
drop table DWH.TempTableProftit;


# Update into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId  and brand = @crm;
COMMIT; 
*/
-- *********************************** StarCapital **********************************
set @Brand='StarCapital';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_star:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = @Brand 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Star
 select id as soureTransactionId from antelopedb_StarCapital.users where 
   last_update_time >= @top_time_star;
          
           
 --  select count(*) from DWH.TR_Star;
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableStarCapital
select us.id as id,
@Brand as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.country_iso = 'IL') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name,
case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6


from DWH.TR_Star left join antelopedb_StarCapital.users us on TR_Star.soureTransactionId = us.id
 left join antelopedb_StarCapital.affiliate aff on us.affiliate_id = aff.id 
left join antelopedb_StarCapital.operators opSales on us.sales_rep = opSales.id
left join antelopedb_StarCapital.operators opRetention on us.retention_rep = opRetention.id
left join antelopedb_StarCapital.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopedb_StarCapital.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopedb_StarCapital.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopedb_StarCapital.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopedb_StarCapital.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopedb_StarCapital.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopedb_StarCapital.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopedb_StarCapital.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopedb_StarCapital.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id;
-- left join (select ap.advertisers_id adId, ap.crmUserID crmUserID, ap.crmEncodedID crmEncodedID, ad.name adName from Events.dwh_api ap left join  Events.dwh_advertisers ad on ap.advertisers_id = ad.id  where ad.name=@Brand ) dwhApi
-- 	on TR_Star.soureTransactionId = dwhApi.crmUserID and dwhApi.adName=@Brand;


-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_Star) and brand_name = @Brand);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableStarCapital;

-- sync customer field on dwh_payment row
update dwh_payments pay right join DWH.TempTableStarCapital star on pay.customer_id = star.id and 
pay.brand_name = star.brand_name
set pay.customer_last_update_time = star.last_update_time,
pay.country_iso = star.country_iso,
pay.language_iso = star.language_iso,
pay.sales_status = star.sales_status,
pay.retention_status = star.retention_status,
pay.campaign_id = star.campaign_id,
pay.campaign_name = star.campaign_name,
pay.sales_rep_id = star.sales_rep_id,
pay.sales_rep_name = star.sales_rep_name,
pay.ret_rep_id = star.retention_rep_id,
pay.ret_rep_name = star.ret_rep_name,
pay.sales_desk_id = star.sales_desk_id,
pay.sales_desk_name = star.sales_desk_name,
pay.ret_desk_id = star.retention_desk_id,
pay.ret_desk_name = star.ret_desk_name,
pay.is_demo = star.is_demo,
pay.is_test = star.is_test,
pay.ftd_time = star.ftd_time,
pay.actual_rep_id = star.actual_rep_id,
pay.actual_rep_name = star.actual_rep_name,
pay.email = star.email,
pay.telephone = star.telephone,
pay.first_name = star.first_name,
pay.source= star.source,
pay.registration_ip = star.registration_ip,
pay.kyc_status = star.kyc_status,
pay.kyc_note = star.kyc_note,
pay.kyc_date = star.kyc_date,
pay.first_convertion_agent_id = star.first_convertion_agent_id,
pay.first_convertion_agent_name = star.first_convertion_agent_name,
pay.first_convertion_desk_id = star.first_convertion_desk_id,
pay.first_convertion_desk_name = star.first_convertion_desk_name,
pay.first_retention_agent_id = star.first_retention_agent_id,
pay.first_retention_agent_name = star.first_retention_agent_name,
pay.first_retention_desk_id = star.first_retention_desk_id,
pay.first_retention_desk_name = star.first_retention_desk_name,
pay.last_login_date = star.last_login_date,
pay.last_retention_note_time = star.last_retention_note_time,
pay.last_sales_note_time = star.last_sales_note_time,
pay.customer_creation_time = star.customer_creation_time,
pay.first_ret_agent_assignment_time = star.first_ret_agent_assignment_time,
pay.crmEncodedID = star.crmEncodedID,
pay.first_ret_agent_assignment_time_dateonly = star.first_ret_agent_assignment_time_dateonly,
pay.last_name  = star.last_name,
pay.param1 = star.param1,
pay.param2 = star.param2,
pay.param3 = star.param3,
pay.param4 = star.param4,
pay.param5 = star.param5,
pay.param6 = star.param6;



-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTableStarCapital star on bon.customer_id = star.id and 
bon.brand_name = star.brand_name
set bon.customer_last_update_time = star.last_update_time,
bon.country_iso = star.country_iso,
bon.language_iso = star.language_iso,
bon.sales_status = star.sales_status,
bon.retention_status = star.retention_status,
bon.campaign_id = star.campaign_id,
bon.campaign_name = star.campaign_name,
bon.sales_rep_id = star.sales_rep_id,
bon.sales_rep_name = star.sales_rep_name,
bon.ret_rep_id = star.retention_rep_id,
bon.ret_rep_name = star.ret_rep_name,
bon.sales_desk_id = star.sales_desk_id,
bon.sales_desk_name = star.sales_desk_name,
bon.ret_desk_id = star.retention_desk_id,
bon.ret_desk_name = star.ret_desk_name,
bon.is_demo = star.is_demo,
bon.is_test = star.is_test,
bon.ftd_time = star.ftd_time,
bon.actual_rep_id = star.actual_rep_id,
bon.actual_rep_name = star.actual_rep_name,
-- bon.is_ftd = star.is_ftd,
bon.email = star.email,
bon.telephone = star.telephone,
bon.first_name = star.first_name,
bon.source= star.source,
bon.registration_ip = star.registration_ip,
bon.kyc_status = star.kyc_status,
bon.kyc_note = star.kyc_note,
bon.kyc_date = star.kyc_date,
bon.first_convertion_agent_id = star.first_convertion_agent_id,
bon.first_convertion_agent_name = star.first_convertion_agent_name,
bon.first_convertion_desk_id = star.first_convertion_desk_id,
bon.first_convertion_desk_name = star.first_convertion_desk_name,
bon.first_retention_agent_id = star.first_retention_agent_id,
bon.first_retention_agent_name = star.first_retention_agent_name,
bon.first_retention_desk_id = star.first_retention_desk_id,
bon.first_retention_desk_name = star.first_retention_desk_name,
bon.last_login_date = star.last_login_date,
bon.last_retention_note_time = star.last_retention_note_time,
bon.last_sales_note_time = star.last_sales_note_time,
bon.customer_creation_time = star.customer_creation_time,
bon.first_ret_agent_assignment_time = star.first_ret_agent_assignment_time,
bon.crmEncodedID = star.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = star.first_ret_agent_assignment_time_dateonly,
bon.param1 = star.param1,
bon.param2 = star.param2,
bon.param3 = star.param3,
bon.param4 = star.param4,
bon.param5 = star.param5,
bon.param6 = star.param6;


drop table DWH.TR_Star;
drop table DWH.TempTableStarCapital;


# Insert into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  


-- *********************************** 7Online **********************************
set @Brand='7Online';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_7online:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = @Brand 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_7Online
 select id as soureTransactionId from antelopedb_7Online.users where 
   last_update_time >= @top_time_7online;
          
           
 --  select count(*) from DWH.TR_7Online;
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTable7Online
select us.id as id,
@Brand as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.country_iso = 'IL') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name,
case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6


from DWH.TR_7Online left join antelopedb_7Online.users us on TR_7Online.soureTransactionId = us.id
 left join antelopedb_7Online.affiliate aff on us.affiliate_id = aff.id 
left join antelopedb_7Online.operators opSales on us.sales_rep = opSales.id
left join antelopedb_7Online.operators opRetention on us.retention_rep = opRetention.id
left join antelopedb_7Online.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopedb_7Online.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopedb_7Online.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopedb_7Online.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopedb_7Online.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopedb_7Online.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopedb_7Online.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopedb_7Online.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopedb_7Online.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id; 
-- left join (select ap.advertisers_id adId, ap.crmUserID crmUserID, ap.crmEncodedID crmEncodedID, ad.name adName from Events.dwh_api ap left join  Events.dwh_advertisers ad on ap.advertisers_id = ad.id  where ad.name=@Brand ) dwhApi
-- 	on TR_7Online.soureTransactionId = dwhApi.crmUserID and dwhApi.adName=@Brand;



-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_7Online) and brand_name = @Brand);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTable7Online;

-- sync customer field on dwh_payment row
UPDATE dwh_payments pay
        RIGHT JOIN
    DWH.TempTable7Online 7online ON pay.customer_id = 7online.id
        AND pay.brand_name = 7online.brand_name 
SET 
    pay.customer_last_update_time = 7online.last_update_time,
    pay.country_iso = 7online.country_iso,
    pay.language_iso = 7online.language_iso,
    pay.sales_status = 7online.sales_status,
    pay.retention_status = 7online.retention_status,
    pay.campaign_id = 7online.campaign_id,
    pay.campaign_name = 7online.campaign_name,
    pay.sales_rep_id = 7online.sales_rep_id,
    pay.sales_rep_name = 7online.sales_rep_name,
    pay.ret_rep_id = 7online.retention_rep_id,
    pay.ret_rep_name = 7online.ret_rep_name,
    pay.sales_desk_id = 7online.sales_desk_id,
    pay.sales_desk_name = 7online.sales_desk_name,
    pay.ret_desk_id = 7online.retention_desk_id,
    pay.ret_desk_name = 7online.ret_desk_name,
    pay.is_demo = 7online.is_demo,
    pay.is_test = 7online.is_test,
    pay.ftd_time = 7online.ftd_time,
    pay.actual_rep_id = 7online.actual_rep_id,
    pay.actual_rep_name = 7online.actual_rep_name,
    pay.email = 7online.email,
    pay.telephone = 7online.telephone,
    pay.first_name = 7online.first_name,
    pay.source = 7online.source,
    pay.registration_ip = 7online.registration_ip,
    pay.kyc_status = 7online.kyc_status,
    pay.kyc_note = 7online.kyc_note,
    pay.kyc_date = 7online.kyc_date,
    pay.first_convertion_agent_id = 7online.first_convertion_agent_id,
    pay.first_convertion_agent_name = 7online.first_convertion_agent_name,
    pay.first_convertion_desk_id = 7online.first_convertion_desk_id,
    pay.first_convertion_desk_name = 7online.first_convertion_desk_name,
    pay.first_retention_agent_id = 7online.first_retention_agent_id,
    pay.first_retention_agent_name = 7online.first_retention_agent_name,
    pay.first_retention_desk_id = 7online.first_retention_desk_id,
    pay.first_retention_desk_name = 7online.first_retention_desk_name,
    pay.last_login_date = 7online.last_login_date,
    pay.last_retention_note_time = 7online.last_retention_note_time,
    pay.last_sales_note_time = 7online.last_sales_note_time,
    pay.customer_creation_time = 7online.customer_creation_time,
    pay.first_ret_agent_assignment_time = 7online.first_ret_agent_assignment_time,
    pay.crmEncodedID = 7online.crmEncodedID,
    pay.first_ret_agent_assignment_time_dateonly = 7online.first_ret_agent_assignment_time_dateonly,
    pay.last_name  = 7online.last_name,
	pay.param1 = 7online.param1,
	pay.param2 = 7online.param2,
	pay.param3 = 7online.param3,
	pay.param4 = 7online.param4,
	pay.param5 = 7online.param5,
	pay.param6 = 7online.param6;



-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTable7Online 7online on bon.customer_id = 7online.id and 
bon.brand_name = 7online.brand_name
set bon.customer_last_update_time = 7online.last_update_time,
bon.country_iso = 7online.country_iso,
bon.language_iso = 7online.language_iso,
bon.sales_status = 7online.sales_status,
bon.retention_status = 7online.retention_status,
bon.campaign_id = 7online.campaign_id,
bon.campaign_name = 7online.campaign_name,
bon.sales_rep_id = 7online.sales_rep_id,
bon.sales_rep_name = 7online.sales_rep_name,
bon.ret_rep_id = 7online.retention_rep_id,
bon.ret_rep_name = 7online.ret_rep_name,
bon.sales_desk_id = 7online.sales_desk_id,
bon.sales_desk_name = 7online.sales_desk_name,
bon.ret_desk_id = 7online.retention_desk_id,
bon.ret_desk_name = 7online.ret_desk_name,
bon.is_demo = 7online.is_demo,
bon.is_test = 7online.is_test,
bon.ftd_time = 7online.ftd_time,
bon.actual_rep_id = 7online.actual_rep_id,
bon.actual_rep_name = 7online.actual_rep_name,
-- bon.is_ftd = 7online.is_ftd,
bon.email = 7online.email,
bon.telephone = 7online.telephone,
bon.first_name = 7online.first_name,
bon.source= 7online.source,
bon.registration_ip = 7online.registration_ip,
bon.kyc_status = 7online.kyc_status,
bon.kyc_note = 7online.kyc_note,
bon.kyc_date = 7online.kyc_date,
bon.first_convertion_agent_id = 7online.first_convertion_agent_id,
bon.first_convertion_agent_name = 7online.first_convertion_agent_name,
bon.first_convertion_desk_id = 7online.first_convertion_desk_id,
bon.first_convertion_desk_name = 7online.first_convertion_desk_name,
bon.first_retention_agent_id = 7online.first_retention_agent_id,
bon.first_retention_agent_name = 7online.first_retention_agent_name,
bon.first_retention_desk_id = 7online.first_retention_desk_id,
bon.first_retention_desk_name = 7online.first_retention_desk_name,
bon.last_login_date = 7online.last_login_date,
bon.last_retention_note_time = 7online.last_retention_note_time,
bon.last_sales_note_time = 7online.last_sales_note_time,
bon.customer_creation_time = 7online.customer_creation_time,
bon.first_ret_agent_assignment_time = 7online.first_ret_agent_assignment_time,
bon.crmEncodedID = 7online.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = 7online.first_ret_agent_assignment_time_dateonly,
bon.last_name  = 7online.last_name,
bon.param1 = 7online.param1,
bon.param2 = 7online.param2,
bon.param3 = 7online.param3,
bon.param4 = 7online.param4,
bon.param5 = 7online.param5,
bon.param6 = 7online.param6;

drop table DWH.TR_7Online;
drop table DWH.TempTable7Online;


# Insert into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  

-- *********************************** External Brand **********************************
set @crm='ExternalBrands';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @crm, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_External:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where crm = @crm 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_External
 select crmEncodedID as soureTransactionId from Events.external_customers where 
   updated_date >= @top_time_External;
          
           
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableExternal
select exCus.crmUserID as id,
exCus.brand_name as brand_name,
exCus.crm_registration_date as creation_time,
exCus.updated_date as last_update_time,
exCus.country as country_iso ,
concat(REPEAT('*', 3), SUBSTR(exCus.email, 6, CHAR_LENGTH(exCus.email)-5)) as email,
exCus.languageiso as language_iso,
concat(REPEAT('*', 3), SUBSTR(exCus.phone, 6, CHAR_LENGTH(exCus.phone)-5)) as telephone,
exCus.first_name as first_name,
exCus.source as source,
exCus.demo as is_demo,
case 
when exCus.demo=1 then '1'
when ((exCus.country  = 'XX') or (exCus.email like '%test%') or (exCus.first_name like '%test%') or (exCus.last_name like '%test%')
or (exCus.email like '%qavova%') or (exCus.email like '%affiliate%') ) then 1
else exCus.demo end  as is_test,
exCus.sales_status as sales_status,
'external' as retention_status,
exCus.affiliates_id as campaign_id,
exCus.campaign_name as campaign_name,
 
'-1' as sales_rep_id,
 'external' sales_rep_name,
 '-1' as retention_rep_id,
 'external' as ret_rep_name,
 '-1' as sales_desk_id,
 'external' as sales_desk_name,
 '-1' as retention_desk_id,
 'external' as ret_desk_name,
 
 exCus.is_ftd as has_ftd,
 exCus.ftd_time as ftd_time,
 null as last_comment_date,
 null as last_comment,
 null as last_comment_status,

'-1' as actual_desk_id,
 'external' as actual_desk_name,
'-1' as actual_rep_id, 
 'external' as actual_rep_name,
exCus.is_ftd is_ftd,
@crm as crm,
exCus.ip as registration_ip,
'external' as kyc_status,
null as kyc_note,
null as kyc_date,
exCus.is_ftd as acquisition_status,
case exCus.is_ftd
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
'-1' as first_convertion_agent_id,
'external' as first_convertion_agent_name,
'-1' as first_convertion_desk_id,
'external' as first_convertion_desk_name,
'-1' as first_retention_agent_id,
'external' as first_retention_agent_name,
'-1' as first_retention_desk_id,
'external' as first_retention_desk_name,
null as last_login_date,
null as last_retention_note_time,
null as last_sales_note_time,
exCus.crm_registration_date  as decision_time,
exCus.crm_registration_date  as customer_creation_time,
null  as first_ret_agent_assignment_time,
exCus.crmEncodedID as crmEncodedID,
-- null as crmEncodedID,
DATE_FORMAT(exCus.crm_registration_date, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(null, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(exCus.crm_registration_date, '%Y-%m-%d ') as decision_time_dateonly,
exCus.last_name as last_name,
exCus.param1 as param1,
exCus.param2 as param2,
exCus.param3 as param3,
exCus.param4 as param4,
exCus.param5 as param5,
exCus.param6 as param6

from DWH.TR_External left join  Events.external_customers exCus  on TR_External.soureTransactionId = exCus.crmEncodedID;

 -- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (crmEncodedID in (select soureTransactionId from DWH.TR_External) and crm = @crm);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableExternal;

-- sync customer field on dwh_payment row
UPDATE dwh_payments pay
        RIGHT JOIN
    DWH.TempTableExternal external ON pay.customer_id = external.id
        AND pay.brand_name = external.brand_name 
SET 
    pay.customer_last_update_time = external.last_update_time,
    pay.country_iso = external.country_iso,
    pay.language_iso = external.language_iso,
    pay.sales_status = external.sales_status,
    pay.retention_status = external.retention_status,
    pay.campaign_id = external.campaign_id,
    pay.campaign_name = external.campaign_name,
    pay.sales_rep_id = external.sales_rep_id,
    pay.sales_rep_name = external.sales_rep_name,
    pay.ret_rep_id = external.retention_rep_id,
    pay.ret_rep_name = external.ret_rep_name,
    pay.sales_desk_id = external.sales_desk_id,
    pay.sales_desk_name = external.sales_desk_name,
    pay.ret_desk_id = external.retention_desk_id,
    pay.ret_desk_name = external.ret_desk_name,
    pay.is_demo = external.is_demo,
    pay.is_test = external.is_test,
    pay.ftd_time = external.ftd_time,
    pay.actual_rep_id = external.actual_rep_id,
    pay.actual_rep_name = external.actual_rep_name,
    pay.email = external.email,
    pay.telephone = external.telephone,
    pay.first_name = external.first_name,
    pay.source = external.source,
    pay.registration_ip = external.registration_ip,
    pay.kyc_status = external.kyc_status,
    pay.kyc_note = external.kyc_note,
    pay.kyc_date = external.kyc_date,
    pay.first_convertion_agent_id = external.first_convertion_agent_id,
    pay.first_convertion_agent_name = external.first_convertion_agent_name,
    pay.first_convertion_desk_id = external.first_convertion_desk_id,
    pay.first_convertion_desk_name = external.first_convertion_desk_name,
    pay.first_retention_agent_id = external.first_retention_agent_id,
    pay.first_retention_agent_name = external.first_retention_agent_name,
    pay.first_retention_desk_id = external.first_retention_desk_id,
    pay.first_retention_desk_name = external.first_retention_desk_name,
    pay.last_login_date = external.last_login_date,
    pay.last_retention_note_time = external.last_retention_note_time,
    pay.last_sales_note_time = external.last_sales_note_time,
    pay.customer_creation_time = external.customer_creation_time,
    pay.first_ret_agent_assignment_time = external.first_ret_agent_assignment_time,
    pay.crmEncodedID = external.crmEncodedID,
    pay.first_ret_agent_assignment_time_dateonly = external.first_ret_agent_assignment_time_dateonly,
    pay.last_name  = external.last_name,
    pay.param1 = external.param1,
    pay.param2 = external.param2,
    pay.param3 = external.param3,
    pay.param4 = external.param4,
    pay.param5 = external.param5,
    pay.param6 = external.param6;

drop table DWH.TR_External;
drop table DWH.TempTableExternal;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @crm;

COMMIT;   

-- *********************************** Roimax **********************************
set @Brand='ROIMAX';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_Roimax:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = @Brand 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_Roimax
 select id as soureTransactionId from antelope_roimax.users where 
   last_update_time >= @top_time_Roimax;
          
           
 --  select count(*) from DWH.TR_Roimax;
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableRoimax
select us.id as id,
@Brand as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.country_iso = 'IL') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name,
case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6


from DWH.TR_Roimax left join antelope_roimax.users us on TR_Roimax.soureTransactionId = us.id
 left join antelope_roimax.affiliate aff on us.affiliate_id = aff.id 
left join antelope_roimax.operators opSales on us.sales_rep = opSales.id
left join antelope_roimax.operators opRetention on us.retention_rep = opRetention.id
left join antelope_roimax.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelope_roimax.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelope_roimax.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelope_roimax.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelope_roimax.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelope_roimax.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelope_roimax.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelope_roimax.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelope_roimax.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id; 
-- left join (select ap.advertisers_id adId, ap.crmUserID crmUserID, ap.crmEncodedID crmEncodedID, ad.name adName from Events.dwh_api ap left join  Events.dwh_advertisers ad on ap.advertisers_id = ad.id  where ad.name=@Brand ) dwhApi
-- 	on TR_Roimax.soureTransactionId = dwhApi.crmUserID and dwhApi.adName=@Brand;


-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_Roimax) and brand_name = @Brand);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableRoimax;

-- sync customer field on dwh_payment row
UPDATE dwh_payments pay
        RIGHT JOIN
    DWH.TempTableRoimax Roimax ON pay.customer_id = Roimax.id
        AND pay.brand_name = Roimax.brand_name 
SET 
    pay.customer_last_update_time = Roimax.last_update_time,
    pay.country_iso = Roimax.country_iso,
    pay.language_iso = Roimax.language_iso,
    pay.sales_status = Roimax.sales_status,
    pay.retention_status = Roimax.retention_status,
    pay.campaign_id = Roimax.campaign_id,
    pay.campaign_name = Roimax.campaign_name,
    pay.sales_rep_id = Roimax.sales_rep_id,
    pay.sales_rep_name = Roimax.sales_rep_name,
    pay.ret_rep_id = Roimax.retention_rep_id,
    pay.ret_rep_name = Roimax.ret_rep_name,
    pay.sales_desk_id = Roimax.sales_desk_id,
    pay.sales_desk_name = Roimax.sales_desk_name,
    pay.ret_desk_id = Roimax.retention_desk_id,
    pay.ret_desk_name = Roimax.ret_desk_name,
    pay.is_demo = Roimax.is_demo,
    pay.is_test = Roimax.is_test,
    pay.ftd_time = Roimax.ftd_time,
    pay.actual_rep_id = Roimax.actual_rep_id,
    pay.actual_rep_name = Roimax.actual_rep_name,
    pay.email = Roimax.email,
    pay.telephone = Roimax.telephone,
    pay.first_name = Roimax.first_name,
    pay.source = Roimax.source,
    pay.registration_ip = Roimax.registration_ip,
    pay.kyc_status = Roimax.kyc_status,
    pay.kyc_note = Roimax.kyc_note,
    pay.kyc_date = Roimax.kyc_date,
    pay.first_convertion_agent_id = Roimax.first_convertion_agent_id,
    pay.first_convertion_agent_name = Roimax.first_convertion_agent_name,
    pay.first_convertion_desk_id = Roimax.first_convertion_desk_id,
    pay.first_convertion_desk_name = Roimax.first_convertion_desk_name,
    pay.first_retention_agent_id = Roimax.first_retention_agent_id,
    pay.first_retention_agent_name = Roimax.first_retention_agent_name,
    pay.first_retention_desk_id = Roimax.first_retention_desk_id,
    pay.first_retention_desk_name = Roimax.first_retention_desk_name,
    pay.last_login_date = Roimax.last_login_date,
    pay.last_retention_note_time = Roimax.last_retention_note_time,
    pay.last_sales_note_time = Roimax.last_sales_note_time,
    pay.customer_creation_time = Roimax.customer_creation_time,
    pay.first_ret_agent_assignment_time = Roimax.first_ret_agent_assignment_time,
    pay.crmEncodedID = Roimax.crmEncodedID,
    pay.first_ret_agent_assignment_time_dateonly = Roimax.first_ret_agent_assignment_time_dateonly,
	pay.last_name  = Roimax.last_name,
	pay.param1 = Roimax.param1,
	pay.param2 = Roimax.param2,
	pay.param3 = Roimax.param3,
	pay.param4 = Roimax.param4,
	pay.param5 = Roimax.param5,
	pay.param6 = Roimax.param6;


-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTableRoimax Roimax on bon.customer_id = Roimax.id and 
bon.brand_name = Roimax.brand_name
set bon.customer_last_update_time = Roimax.last_update_time,
bon.country_iso = Roimax.country_iso,
bon.language_iso = Roimax.language_iso,
bon.sales_status = Roimax.sales_status,
bon.retention_status = Roimax.retention_status,
bon.campaign_id = Roimax.campaign_id,
bon.campaign_name = Roimax.campaign_name,
bon.sales_rep_id = Roimax.sales_rep_id,
bon.sales_rep_name = Roimax.sales_rep_name,
bon.ret_rep_id = Roimax.retention_rep_id,
bon.ret_rep_name = Roimax.ret_rep_name,
bon.sales_desk_id = Roimax.sales_desk_id,
bon.sales_desk_name = Roimax.sales_desk_name,
bon.ret_desk_id = Roimax.retention_desk_id,
bon.ret_desk_name = Roimax.ret_desk_name,
bon.is_demo = Roimax.is_demo,
bon.is_test = Roimax.is_test,
bon.ftd_time = Roimax.ftd_time,
bon.actual_rep_id = Roimax.actual_rep_id,
bon.actual_rep_name = Roimax.actual_rep_name,
-- bon.is_ftd = Roimax.is_ftd,
bon.email = Roimax.email,
bon.telephone = Roimax.telephone,
bon.first_name = Roimax.first_name,
bon.source= Roimax.source,
bon.registration_ip = Roimax.registration_ip,
bon.kyc_status = Roimax.kyc_status,
bon.kyc_note = Roimax.kyc_note,
bon.kyc_date = Roimax.kyc_date,
bon.first_convertion_agent_id = Roimax.first_convertion_agent_id,
bon.first_convertion_agent_name = Roimax.first_convertion_agent_name,
bon.first_convertion_desk_id = Roimax.first_convertion_desk_id,
bon.first_convertion_desk_name = Roimax.first_convertion_desk_name,
bon.first_retention_agent_id = Roimax.first_retention_agent_id,
bon.first_retention_agent_name = Roimax.first_retention_agent_name,
bon.first_retention_desk_id = Roimax.first_retention_desk_id,
bon.first_retention_desk_name = Roimax.first_retention_desk_name,
bon.last_login_date = Roimax.last_login_date,
bon.last_retention_note_time = Roimax.last_retention_note_time,
bon.last_sales_note_time = Roimax.last_sales_note_time,
bon.customer_creation_time = Roimax.customer_creation_time,
bon.first_ret_agent_assignment_time = Roimax.first_ret_agent_assignment_time,
bon.crmEncodedID = Roimax.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = Roimax.first_ret_agent_assignment_time_dateonly,
bon.last_name  = Roimax.last_name,
bon.param1 = Roimax.param1,
bon.param2 = Roimax.param2,
bon.param3 = Roimax.param3,
bon.param4 = Roimax.param4,
bon.param5 = Roimax.param5,
bon.param6 = Roimax.param6;

drop table DWH.TR_Roimax;
drop table DWH.TempTableRoimax;


# Insert into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  

-- *********************************** AlphaLive **********************************
set @Brand='AlphaLive';
set @Update_time=CURRENT_TIMESTAMP;
#insert into control (last_update_time, flag, object, brand, runId) values (CURRENT_TIMESTAMP, 0, 'dwh_customers', @Brand, @runId);
insert into control (last_update_time, flag, object, brand, runId, start_time) values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_AlphaLive:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = @Brand 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_AlphaLive
 select id as soureTransactionId from antelopedb_alphalive.users where 
   last_update_time >= @top_time_AlphaLive;
          
           
 --  select count(*) from DWH.TR_AlphaLive;
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTableAlphaLive
select us.id as id,
@Brand as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.country_iso = 'IL') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name,
case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6


from DWH.TR_AlphaLive left join antelopedb_alphalive.users us on TR_AlphaLive.soureTransactionId = us.id
 left join antelopedb_alphalive.affiliate aff on us.affiliate_id = aff.id 
left join antelopedb_alphalive.operators opSales on us.sales_rep = opSales.id
left join antelopedb_alphalive.operators opRetention on us.retention_rep = opRetention.id
left join antelopedb_alphalive.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopedb_alphalive.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopedb_alphalive.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopedb_alphalive.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopedb_alphalive.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopedb_alphalive.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopedb_alphalive.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopedb_alphalive.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopedb_alphalive.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id;
-- left join (select ap.advertisers_id adId, ap.crmUserID crmUserID, ap.crmEncodedID crmEncodedID, ad.name adName from Events.dwh_api ap left join  Events.dwh_advertisers ad on ap.advertisers_id = ad.id  where ad.name=@Brand) dwhApi
-- 	on TR_AlphaLive.soureTransactionId = dwhApi.crmUserID and dwhApi.adName=@Brand;


-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_AlphaLive) and brand_name = @Brand);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTableAlphaLive;

-- sync customer field on dwh_payment row
UPDATE dwh_payments pay
        RIGHT JOIN
    DWH.TempTableAlphaLive AlphaLive ON pay.customer_id = AlphaLive.id
        AND pay.brand_name = AlphaLive.brand_name 
SET 
    pay.customer_last_update_time = AlphaLive.last_update_time,
    pay.country_iso = AlphaLive.country_iso,
    pay.language_iso = AlphaLive.language_iso,
    pay.sales_status = AlphaLive.sales_status,
    pay.retention_status = AlphaLive.retention_status,
    pay.campaign_id = AlphaLive.campaign_id,
    pay.campaign_name = AlphaLive.campaign_name,
    pay.sales_rep_id = AlphaLive.sales_rep_id,
    pay.sales_rep_name = AlphaLive.sales_rep_name,
    pay.ret_rep_id = AlphaLive.retention_rep_id,
    pay.ret_rep_name = AlphaLive.ret_rep_name,
    pay.sales_desk_id = AlphaLive.sales_desk_id,
    pay.sales_desk_name = AlphaLive.sales_desk_name,
    pay.ret_desk_id = AlphaLive.retention_desk_id,
    pay.ret_desk_name = AlphaLive.ret_desk_name,
    pay.is_demo = AlphaLive.is_demo,
    pay.is_test = AlphaLive.is_test,
    pay.ftd_time = AlphaLive.ftd_time,
    pay.actual_rep_id = AlphaLive.actual_rep_id,
    pay.actual_rep_name = AlphaLive.actual_rep_name,
    pay.email = AlphaLive.email,
    pay.telephone = AlphaLive.telephone,
    pay.first_name = AlphaLive.first_name,
    pay.source = AlphaLive.source,
    pay.registration_ip = AlphaLive.registration_ip,
    pay.kyc_status = AlphaLive.kyc_status,
    pay.kyc_note = AlphaLive.kyc_note,
    pay.kyc_date = AlphaLive.kyc_date,
    pay.first_convertion_agent_id = AlphaLive.first_convertion_agent_id,
    pay.first_convertion_agent_name = AlphaLive.first_convertion_agent_name,
    pay.first_convertion_desk_id = AlphaLive.first_convertion_desk_id,
    pay.first_convertion_desk_name = AlphaLive.first_convertion_desk_name,
    pay.first_retention_agent_id = AlphaLive.first_retention_agent_id,
    pay.first_retention_agent_name = AlphaLive.first_retention_agent_name,
    pay.first_retention_desk_id = AlphaLive.first_retention_desk_id,
    pay.first_retention_desk_name = AlphaLive.first_retention_desk_name,
    pay.last_login_date = AlphaLive.last_login_date,
    pay.last_retention_note_time = AlphaLive.last_retention_note_time,
    pay.last_sales_note_time = AlphaLive.last_sales_note_time,
    pay.customer_creation_time = AlphaLive.customer_creation_time,
    pay.first_ret_agent_assignment_time = AlphaLive.first_ret_agent_assignment_time,
    pay.crmEncodedID = AlphaLive.crmEncodedID,
    pay.first_ret_agent_assignment_time_dateonly = AlphaLive.first_ret_agent_assignment_time_dateonly,
    pay.last_name  = AlphaLive.last_name,
	pay.param1 = AlphaLive.param1,
	pay.param2 = AlphaLive.param2,
	pay.param3 = AlphaLive.param3,
	pay.param4 = AlphaLive.param4,
	pay.param5 = AlphaLive.param5,
	pay.param6 = AlphaLive.param6;


-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTableAlphaLive AlphaLive on bon.customer_id = AlphaLive.id and 
bon.brand_name = AlphaLive.brand_name
set bon.customer_last_update_time = AlphaLive.last_update_time,
bon.country_iso = AlphaLive.country_iso,
bon.language_iso = AlphaLive.language_iso,
bon.sales_status = AlphaLive.sales_status,
bon.retention_status = AlphaLive.retention_status,
bon.campaign_id = AlphaLive.campaign_id,
bon.campaign_name = AlphaLive.campaign_name,
bon.sales_rep_id = AlphaLive.sales_rep_id,
bon.sales_rep_name = AlphaLive.sales_rep_name,
bon.ret_rep_id = AlphaLive.retention_rep_id,
bon.ret_rep_name = AlphaLive.ret_rep_name,
bon.sales_desk_id = AlphaLive.sales_desk_id,
bon.sales_desk_name = AlphaLive.sales_desk_name,
bon.ret_desk_id = AlphaLive.retention_desk_id,
bon.ret_desk_name = AlphaLive.ret_desk_name,
bon.is_demo = AlphaLive.is_demo,
bon.is_test = AlphaLive.is_test,
bon.ftd_time = AlphaLive.ftd_time,
bon.actual_rep_id = AlphaLive.actual_rep_id,
bon.actual_rep_name = AlphaLive.actual_rep_name,
-- bon.is_ftd = AlphaLive.is_ftd,
bon.email = AlphaLive.email,
bon.telephone = AlphaLive.telephone,
bon.first_name = AlphaLive.first_name,
bon.source= AlphaLive.source,
bon.registration_ip = AlphaLive.registration_ip,
bon.kyc_status = AlphaLive.kyc_status,
bon.kyc_note = AlphaLive.kyc_note,
bon.kyc_date = AlphaLive.kyc_date,
bon.first_convertion_agent_id = AlphaLive.first_convertion_agent_id,
bon.first_convertion_agent_name = AlphaLive.first_convertion_agent_name,
bon.first_convertion_desk_id = AlphaLive.first_convertion_desk_id,
bon.first_convertion_desk_name = AlphaLive.first_convertion_desk_name,
bon.first_retention_agent_id = AlphaLive.first_retention_agent_id,
bon.first_retention_agent_name = AlphaLive.first_retention_agent_name,
bon.first_retention_desk_id = AlphaLive.first_retention_desk_id,
bon.first_retention_desk_name = AlphaLive.first_retention_desk_name,
bon.last_login_date = AlphaLive.last_login_date,
bon.last_retention_note_time = AlphaLive.last_retention_note_time,
bon.last_sales_note_time = AlphaLive.last_sales_note_time,
bon.customer_creation_time = AlphaLive.customer_creation_time,
bon.first_ret_agent_assignment_time = AlphaLive.first_ret_agent_assignment_time,
bon.crmEncodedID = AlphaLive.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = AlphaLive.first_ret_agent_assignment_time_dateonly,
bon.last_name  = AlphaLive.last_name,
bon.param1 = AlphaLive.param1,
bon.param2 = AlphaLive.param2,
bon.param3 = AlphaLive.param3,
bon.param4 = AlphaLive.param4,
bon.param5 = AlphaLive.param5,
bon.param6 = AlphaLive.param6;

drop table DWH.TR_AlphaLive;
drop table DWH.TempTableAlphaLive;


# Insert into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  


-- *********************************** superfive **********************************
set @Brand='SuperFive';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_superfive:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = @Brand 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_superfive
 select id as soureTransactionId from antelopedb_superfive.users where 
   last_update_time >= @top_time_superfive;
          
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablesuperfive
select us.id as id,
@Brand as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.country_iso = 'IL') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name,
case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6
from DWH.TR_superfive left join antelopedb_superfive.users us on TR_superfive.soureTransactionId = us.id
 left join antelopedb_superfive.affiliate aff on us.affiliate_id = aff.id 
left join antelopedb_superfive.operators opSales on us.sales_rep = opSales.id
left join antelopedb_superfive.operators opRetention on us.retention_rep = opRetention.id
left join antelopedb_superfive.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopedb_superfive.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopedb_superfive.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopedb_superfive.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopedb_superfive.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopedb_superfive.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopedb_superfive.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopedb_superfive.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopedb_superfive.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id;

-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_superfive) and brand_name = @Brand);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTablesuperfive;

-- sync customer field on dwh_payment row
UPDATE dwh_payments pay
        RIGHT JOIN
    DWH.TempTablesuperfive superfive ON pay.customer_id = superfive.id
        AND pay.brand_name = superfive.brand_name 
SET 
    pay.customer_last_update_time = superfive.last_update_time,
    pay.country_iso = superfive.country_iso,
    pay.language_iso = superfive.language_iso,
    pay.sales_status = superfive.sales_status,
    pay.retention_status = superfive.retention_status,
    pay.campaign_id = superfive.campaign_id,
    pay.campaign_name = superfive.campaign_name,
    pay.sales_rep_id = superfive.sales_rep_id,
    pay.sales_rep_name = superfive.sales_rep_name,
    pay.ret_rep_id = superfive.retention_rep_id,
    pay.ret_rep_name = superfive.ret_rep_name,
    pay.sales_desk_id = superfive.sales_desk_id,
    pay.sales_desk_name = superfive.sales_desk_name,
    pay.ret_desk_id = superfive.retention_desk_id,
    pay.ret_desk_name = superfive.ret_desk_name,
    pay.is_demo = superfive.is_demo,
    pay.is_test = superfive.is_test,
    pay.ftd_time = superfive.ftd_time,
    pay.actual_rep_id = superfive.actual_rep_id,
    pay.actual_rep_name = superfive.actual_rep_name,
    pay.email = superfive.email,
    pay.telephone = superfive.telephone,
    pay.first_name = superfive.first_name,
    pay.source = superfive.source,
    pay.registration_ip = superfive.registration_ip,
    pay.kyc_status = superfive.kyc_status,
    pay.kyc_note = superfive.kyc_note,
    pay.kyc_date = superfive.kyc_date,
    pay.first_convertion_agent_id = superfive.first_convertion_agent_id,
    pay.first_convertion_agent_name = superfive.first_convertion_agent_name,
    pay.first_convertion_desk_id = superfive.first_convertion_desk_id,
    pay.first_convertion_desk_name = superfive.first_convertion_desk_name,
    pay.first_retention_agent_id = superfive.first_retention_agent_id,
    pay.first_retention_agent_name = superfive.first_retention_agent_name,
    pay.first_retention_desk_id = superfive.first_retention_desk_id,
    pay.first_retention_desk_name = superfive.first_retention_desk_name,
    pay.last_login_date = superfive.last_login_date,
    pay.last_retention_note_time = superfive.last_retention_note_time,
    pay.last_sales_note_time = superfive.last_sales_note_time,
    pay.customer_creation_time = superfive.customer_creation_time,
    pay.first_ret_agent_assignment_time = superfive.first_ret_agent_assignment_time,
    pay.crmEncodedID = superfive.crmEncodedID,
    pay.first_ret_agent_assignment_time_dateonly = superfive.first_ret_agent_assignment_time_dateonly,
    pay.last_name  = superfive.last_name,
	pay.param1 = superfive.param1,
	pay.param2 = superfive.param2,
	pay.param3 = superfive.param3,
	pay.param4 = superfive.param4,
	pay.param5 = superfive.param5,
	pay.param6 = superfive.param6;


-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTablesuperfive superfive on bon.customer_id = superfive.id and 
bon.brand_name = superfive.brand_name
set bon.customer_last_update_time = superfive.last_update_time,
bon.country_iso = superfive.country_iso,
bon.language_iso = superfive.language_iso,
bon.sales_status = superfive.sales_status,
bon.retention_status = superfive.retention_status,
bon.campaign_id = superfive.campaign_id,
bon.campaign_name = superfive.campaign_name,
bon.sales_rep_id = superfive.sales_rep_id,
bon.sales_rep_name = superfive.sales_rep_name,
bon.ret_rep_id = superfive.retention_rep_id,
bon.ret_rep_name = superfive.ret_rep_name,
bon.sales_desk_id = superfive.sales_desk_id,
bon.sales_desk_name = superfive.sales_desk_name,
bon.ret_desk_id = superfive.retention_desk_id,
bon.ret_desk_name = superfive.ret_desk_name,
bon.is_demo = superfive.is_demo,
bon.is_test = superfive.is_test,
bon.ftd_time = superfive.ftd_time,
bon.actual_rep_id = superfive.actual_rep_id,
bon.actual_rep_name = superfive.actual_rep_name,
-- bon.is_ftd = superfive.is_ftd,
bon.email = superfive.email,
bon.telephone = superfive.telephone,
bon.first_name = superfive.first_name,
bon.source= superfive.source,
bon.registration_ip = superfive.registration_ip,
bon.kyc_status = superfive.kyc_status,
bon.kyc_note = superfive.kyc_note,
bon.kyc_date = superfive.kyc_date,
bon.first_convertion_agent_id = superfive.first_convertion_agent_id,
bon.first_convertion_agent_name = superfive.first_convertion_agent_name,
bon.first_convertion_desk_id = superfive.first_convertion_desk_id,
bon.first_convertion_desk_name = superfive.first_convertion_desk_name,
bon.first_retention_agent_id = superfive.first_retention_agent_id,
bon.first_retention_agent_name = superfive.first_retention_agent_name,
bon.first_retention_desk_id = superfive.first_retention_desk_id,
bon.first_retention_desk_name = superfive.first_retention_desk_name,
bon.last_login_date = superfive.last_login_date,
bon.last_retention_note_time = superfive.last_retention_note_time,
bon.last_sales_note_time = superfive.last_sales_note_time,
bon.customer_creation_time = superfive.customer_creation_time,
bon.first_ret_agent_assignment_time = superfive.first_ret_agent_assignment_time,
bon.crmEncodedID = superfive.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = superfive.first_ret_agent_assignment_time_dateonly,
bon.last_name  = superfive.last_name,
bon.param1 = superfive.param1,
bon.param2 = superfive.param2,
bon.param3 = superfive.param3,
bon.param4 = superfive.param4,
bon.param5 = superfive.param5,
bon.param6 = superfive.param6;

drop table DWH.TR_superfive;
drop table DWH.TempTablesuperfive;


# Insert into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  


-- *********************************** coinlife **********************************
set @Brand='CoinLife';
set @Update_time=CURRENT_TIMESTAMP;
insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_customers', @Brand, @runId, CURRENT_TIMESTAMP);

SELECT @top_time_coinlife:=DATE_SUB(last_update_time, INTERVAL @lag HOUR)
 FROM DWH.dwh_customers
 Where brand_name = @Brand 
 order by last_update_time desc limit 1;

-- fetch customers id to be added/updated
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TR_coinlife
 select id as soureTransactionId from antelopedb_coinlife.users where 
   last_update_time >= @top_time_coinlife;
          
-- create in memory table - prepare the data 
CREATE TEMPORARY TABLE IF NOT EXISTS DWH.TempTablecoinlife
select us.id as id,
@Brand as brand_name,
us.creation_time as creation_time,
us.last_update_time as last_update_time,
us.country_iso as country_iso,
concat(REPEAT('*', 3), SUBSTR(us.email, 6, CHAR_LENGTH(us.email)-5)) as email,
us.language_iso as language_iso,
concat(REPEAT('*', 3), SUBSTR(us.telephone, 6, CHAR_LENGTH(us.telephone)-5)) as telephone,
us.first_name as first_name,
us.source as source,
us.is_demo as is_demo,
case 
when us.is_test=1 then us.is_test
when us.is_demo=1 then '1'
when ((us.country_iso = 'XX') or (us.country_iso = 'IL') or (us.email like '%test%') or (us.full_name like '%test%')
or (us.email like '%qavova%') or (us.email like '%affiliate%') ) then 1
else us.is_test end  as is_test,
selSalesStat.display_value as sales_status,
selRetStat.display_value as retention_status,

 us.affiliate_id as campaign_id,
 aff.name as campaign_name,
 us.sales_rep as sales_rep_id,
 opSales.full_name sales_rep_name,
 us.retention_rep as retention_rep_id,
 opRetention.full_name as ret_rep_name,
 us.sales_desk_id as sales_desk_id,
 salesDesk.name as sales_desk_name,
 us.retention_desk_id as retention_desk_id,
  retDesk.name as ret_desk_name,
  us.has_ftd as has_ftd,
  us.ftd_time as ftd_time,
  null as last_comment_date,
  ' ' as last_comment,
  ' ' as last_comment_status,
  case us.retention_desk_id
when 0 then us.sales_desk_id
else us.retention_desk_id
end as actual_desk_id,

case us.retention_desk_id
when 0 then salesDesk.name
else retDesk.name 
end as actual_desk_name,
case us.retention_rep
when 0 then us.sales_rep
else us.retention_rep
end as actual_rep_id,

case us.retention_rep
when 0 then opSales.full_name
else opRetention.full_name
end as actual_rep_name,
case WHEN us.ftd_time IS NULL then 0 
else 1
end as is_ftd,
'Cryptency' as crm,
us.registration_ip as registration_ip,
selKycStat.display_value as kyc_status,
us.kyc_note as kyc_note,
null as kyc_date,
us.acquisition_status as acquisition_status,
case us.acquisition_status
	when 1 then 'Retention'
    when 0 then 'Conversion'
end as acquisition_status_name,
0 as first_convertion_agent_id,
null as first_convertion_agent_name,
us.first_sales_desk_id as first_convertion_desk_id,
firstSalesDesk.name as first_convertion_desk_name,
us.first_retention_rep_id as first_retention_agent_id,
firstOpRet.full_name as first_retention_agent_name,
us.first_retention_desk_id as first_retention_desk_id,
firstRetDesk.name as first_retention_desk_name,
us.last_logon_time as last_login_date,
us.last_retention_note_time as last_retention_note_time,
us.last_sales_note_time as last_sales_note_time,
us.creation_time as decision_time,
us.creation_time as customer_creation_time,
ocl.first_ret_agent_assignment_time  as first_ret_agent_assignment_time,
-- dwhApi.crmEncodedID as crmEncodedID,
null as crmEncodedID,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
us.last_name as last_name,
us.param1 as param1,
us.param2 as param2,
us.param3 as param3,
us.param4 as param4,
us.param5 as param5,
us.param6 as param6
from DWH.TR_coinlife left join antelopedb_coinlife.users us on TR_coinlife.soureTransactionId = us.id
 left join antelopedb_coinlife.affiliate aff on us.affiliate_id = aff.id 
left join antelopedb_coinlife.operators opSales on us.sales_rep = opSales.id
left join antelopedb_coinlife.operators opRetention on us.retention_rep = opRetention.id
left join antelopedb_coinlife.desk salesDesk on us.sales_desk_id  = salesDesk.id
left join antelopedb_coinlife.desk retDesk on us.retention_desk_id  = retDesk.id
left join antelopedb_coinlife.desk firstSalesDesk  on  us.first_sales_desk_id =firstSalesDesk.id 
left join antelopedb_coinlife.operators firstOpRet on   us.first_retention_rep_id = firstOpRet.id
left join antelopedb_coinlife.desk  firstRetDesk on us.first_retention_desk_id = firstRetDesk.id
left join antelopedb_coinlife.selection selSalesStat on us.sales_status = selSalesStat.selection_key and selSalesStat.type=1
left join antelopedb_coinlife.selection selRetStat on us.sales_status = selRetStat.selection_key and selRetStat.type=2
left join antelopedb_coinlife.selection selKycStat on us.sales_status = selKycStat.selection_key and selKycStat.type=7
left join (select user_id, new_operator_id, min(creation_time) as first_ret_agent_assignment_time 
from antelopedb_coinlife.operator_change_log where type=1 group by user_id, new_operator_id ) ocl
on us.first_retention_rep_id = ocl.new_operator_id and us.id = ocl.user_id;

-- ---  ************************
-- delete rows to be updated/ on target table
delete from DWH.dwh_customers where (id in (select soureTransactionId from DWH.TR_coinlife) and brand_name = @Brand);

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
crmEncodedID, creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly,
last_name, param1, param2, param3, param4, param5, param6)
select * from DWH.TempTablecoinlife;

-- sync customer field on dwh_payment row
UPDATE dwh_payments pay
        RIGHT JOIN
    DWH.TempTablecoinlife coinlife ON pay.customer_id = coinlife.id
        AND pay.brand_name = coinlife.brand_name 
SET 
    pay.customer_last_update_time = coinlife.last_update_time,
    pay.country_iso = coinlife.country_iso,
    pay.language_iso = coinlife.language_iso,
    pay.sales_status = coinlife.sales_status,
    pay.retention_status = coinlife.retention_status,
    pay.campaign_id = coinlife.campaign_id,
    pay.campaign_name = coinlife.campaign_name,
    pay.sales_rep_id = coinlife.sales_rep_id,
    pay.sales_rep_name = coinlife.sales_rep_name,
    pay.ret_rep_id = coinlife.retention_rep_id,
    pay.ret_rep_name = coinlife.ret_rep_name,
    pay.sales_desk_id = coinlife.sales_desk_id,
    pay.sales_desk_name = coinlife.sales_desk_name,
    pay.ret_desk_id = coinlife.retention_desk_id,
    pay.ret_desk_name = coinlife.ret_desk_name,
    pay.is_demo = coinlife.is_demo,
    pay.is_test = coinlife.is_test,
    pay.ftd_time = coinlife.ftd_time,
    pay.actual_rep_id = coinlife.actual_rep_id,
    pay.actual_rep_name = coinlife.actual_rep_name,
    pay.email = coinlife.email,
    pay.telephone = coinlife.telephone,
    pay.first_name = coinlife.first_name,
    pay.source = coinlife.source,
    pay.registration_ip = coinlife.registration_ip,
    pay.kyc_status = coinlife.kyc_status,
    pay.kyc_note = coinlife.kyc_note,
    pay.kyc_date = coinlife.kyc_date,
    pay.first_convertion_agent_id = coinlife.first_convertion_agent_id,
    pay.first_convertion_agent_name = coinlife.first_convertion_agent_name,
    pay.first_convertion_desk_id = coinlife.first_convertion_desk_id,
    pay.first_convertion_desk_name = coinlife.first_convertion_desk_name,
    pay.first_retention_agent_id = coinlife.first_retention_agent_id,
    pay.first_retention_agent_name = coinlife.first_retention_agent_name,
    pay.first_retention_desk_id = coinlife.first_retention_desk_id,
    pay.first_retention_desk_name = coinlife.first_retention_desk_name,
    pay.last_login_date = coinlife.last_login_date,
    pay.last_retention_note_time = coinlife.last_retention_note_time,
    pay.last_sales_note_time = coinlife.last_sales_note_time,
    pay.customer_creation_time = coinlife.customer_creation_time,
    pay.first_ret_agent_assignment_time = coinlife.first_ret_agent_assignment_time,
    pay.crmEncodedID = coinlife.crmEncodedID,
    pay.first_ret_agent_assignment_time_dateonly = coinlife.first_ret_agent_assignment_time_dateonly,
    pay.last_name  = coinlife.last_name,
	pay.param1 = coinlife.param1,
	pay.param2 = coinlife.param2,
	pay.param3 = coinlife.param3,
	pay.param4 = coinlife.param4,
	pay.param5 = coinlife.param5,
	pay.param6 = coinlife.param6;


-- sync customer field on dwh_bonus row
update dwh_bonus bon right join DWH.TempTablecoinlife coinlife on bon.customer_id = coinlife.id and 
bon.brand_name = coinlife.brand_name
set bon.customer_last_update_time = coinlife.last_update_time,
bon.country_iso = coinlife.country_iso,
bon.language_iso = coinlife.language_iso,
bon.sales_status = coinlife.sales_status,
bon.retention_status = coinlife.retention_status,
bon.campaign_id = coinlife.campaign_id,
bon.campaign_name = coinlife.campaign_name,
bon.sales_rep_id = coinlife.sales_rep_id,
bon.sales_rep_name = coinlife.sales_rep_name,
bon.ret_rep_id = coinlife.retention_rep_id,
bon.ret_rep_name = coinlife.ret_rep_name,
bon.sales_desk_id = coinlife.sales_desk_id,
bon.sales_desk_name = coinlife.sales_desk_name,
bon.ret_desk_id = coinlife.retention_desk_id,
bon.ret_desk_name = coinlife.ret_desk_name,
bon.is_demo = coinlife.is_demo,
bon.is_test = coinlife.is_test,
bon.ftd_time = coinlife.ftd_time,
bon.actual_rep_id = coinlife.actual_rep_id,
bon.actual_rep_name = coinlife.actual_rep_name,
-- bon.is_ftd = coinlife.is_ftd,
bon.email = coinlife.email,
bon.telephone = coinlife.telephone,
bon.first_name = coinlife.first_name,
bon.source= coinlife.source,
bon.registration_ip = coinlife.registration_ip,
bon.kyc_status = coinlife.kyc_status,
bon.kyc_note = coinlife.kyc_note,
bon.kyc_date = coinlife.kyc_date,
bon.first_convertion_agent_id = coinlife.first_convertion_agent_id,
bon.first_convertion_agent_name = coinlife.first_convertion_agent_name,
bon.first_convertion_desk_id = coinlife.first_convertion_desk_id,
bon.first_convertion_desk_name = coinlife.first_convertion_desk_name,
bon.first_retention_agent_id = coinlife.first_retention_agent_id,
bon.first_retention_agent_name = coinlife.first_retention_agent_name,
bon.first_retention_desk_id = coinlife.first_retention_desk_id,
bon.first_retention_desk_name = coinlife.first_retention_desk_name,
bon.last_login_date = coinlife.last_login_date,
bon.last_retention_note_time = coinlife.last_retention_note_time,
bon.last_sales_note_time = coinlife.last_sales_note_time,
bon.customer_creation_time = coinlife.customer_creation_time,
bon.first_ret_agent_assignment_time = coinlife.first_ret_agent_assignment_time,
bon.crmEncodedID = coinlife.crmEncodedID,
bon.first_ret_agent_assignment_time_dateonly = coinlife.first_ret_agent_assignment_time_dateonly,
bon.last_name  = coinlife.last_name,
bon.param1 = coinlife.param1,
bon.param2 = coinlife.param2,
bon.param3 = coinlife.param3,
bon.param4 = coinlife.param4,
bon.param5 = coinlife.param5,
bon.param6 = coinlife.param6;

drop table DWH.TR_coinlife;
drop table DWH.TempTablecoinlife;


# Insert into control table
UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
COMMIT;  

-- ****************************************************************************

analyze table dwh_customers;
analyze table dwh_payments;
analyze table dwh_bonus;

END$$
DELIMITER ;

