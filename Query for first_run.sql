use DWH;
-- coinlife -----------------------------------------

DELIMITER $$
CREATE PROCEDURE sync_bonus_coinlife_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback;
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_bonus_first_run-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

end;
set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** coinlife **********************************
set @Brand='coinlife';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_bonus_first_run', @Brand, @runId, CURRENT_TIMESTAMP);
delete from DWH.dwh_bonus where brand_name = @Brand;

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm, email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note
, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name
, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 creation_time_dateonly, decision_time_dateonly, is_frd )
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
-- - ----------------------------
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

 cu.creation_time as customer_creation_time,
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
' '  as user_withdrawal_reason,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd

 from antelopedb_coinlife.bonus bo 
 left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_coinlife.desk de on bo.desk_id = de.id 
 left join antelopedb_coinlife.operators op on bo.rep_id  = op.id
left join antelopedb_coinlife.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and  brand = @Brand;
   
COMMIT;    
  END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sync_comments_coinlife_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_date) 
    values (@Update_time, 0, 'dwh_comments_first_run- error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);
end;

set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** coinlife **********************************
set @Brand='coinlife';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_comments_first_run', @Brand, @runId, CURRENT_TIMESTAMP);

delete from DWH.dwh_comments where brand_name = @Brand;

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

FROM comms_coinlife.v_coinlife_communications cc left join comms_coinlife.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]';
-- *****************************

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;

analyze table dwh_comments;


COMMIT;    
    
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sync_payments_coinlife_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
        @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
	insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_payments_first_run-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

end;
set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** coinlife **********************************
set @Brand='coinlife';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_payments_first_run', @Brand, @runId, CURRENT_TIMESTAMP);

delete from DWH.dwh_payments where brand_name = @Brand;

-- broker_banking- payments
 INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm, email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name,psp_name, psp_transaction_id
,customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 creation_time_dateonly, decision_time_dateonly, is_frd)

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
	when bb.type = 1 then -1*bb.amount/100
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
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd
from antelopedb_coinlife.broker_banking bb  
 left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_coinlife.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_coinlife.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_coinlife.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_coinlife.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id
 where bb.normalized_amount/100 > 2 ;


-- ***************bonuses


-- -- ***************bonuses

-- delete non relevant customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);
analyze table dwh_payments;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and  brand = @Brand;
   
COMMIT;    

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sync_customers_coinlife_first_time_run()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_customers_first_run- error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);
end;

set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** coinlife **********************************
set @Brand='coinlife';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_customers_first_run', @Brand, @runId, CURRENT_TIMESTAMP);

delete from DWH.dwh_customers where brand_name = @Brand;

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly)
 
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
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly


from antelopedb_coinlife.users us  
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


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
   
analyze table dwh_customers;

COMMIT;    
    
END$$;
DELIMITER ;



-- Superfive -----------------------------------------

use DWH;
DELIMITER $$
CREATE PROCEDURE sync_bonus_superfive_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback;
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_bonus_first_run-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

end;
set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** superfive **********************************
set @Brand='superfive';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_bonus_first_run', @Brand, @runId, CURRENT_TIMESTAMP);
delete from DWH.dwh_bonus where brand_name = @Brand;

INSERT INTO DWH.dwh_bonus
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name
, actual_rep_id , actual_rep_name, crm, email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note
, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name, psp_name, psp_transaction_id, customer_creation_time, currency_name
, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 creation_time_dateonly, decision_time_dateonly, is_frd )
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
-- - ----------------------------
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

 cu.creation_time as customer_creation_time,
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
' '  as user_withdrawal_reason,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(bo.creation_time, '%Y-%m-%d ') as decision_time_dateonly,
0 as is_frd

 from antelopedb_superfive.bonus bo 
 left join DWH.dwh_customers cu ON bo.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_superfive.desk de on bo.desk_id = de.id 
 left join antelopedb_superfive.operators op on bo.rep_id  = op.id
left join antelopedb_superfive.operators tranOwnerRep on  bo.operator_Id= tranOwnerRep.id;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and  brand = @Brand;
   
COMMIT;    
  END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sync_comments_superfive_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_date) 
    values (@Update_time, 0, 'dwh_comments_first_run- error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);
end;

set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** superfive **********************************
set @Brand='superfive';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_comments_first_run', @Brand, @runId, CURRENT_TIMESTAMP);

delete from DWH.dwh_comments where brand_name = @Brand;

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

FROM comms_superfive.v_superfive_communications cc left join comms_superfive.autolut au on 
cc.COMM_TYPE= au.key  and  au.type = 'CommunicationType' where cc.STATUS=1
and CRM_ID regexp '^[0-9]';
-- *****************************

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;

analyze table dwh_comments;


COMMIT;    
    
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sync_customers_superfive_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
         @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
    insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_customers_first_run- error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);
end;

set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** superfive **********************************
set @Brand='superfive';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_customers_first_run', @Brand, @runId, CURRENT_TIMESTAMP);

delete from DWH.dwh_customers where brand_name = @Brand;

INSERT INTO DWH.dwh_customers
(id, brand_name, creation_time, last_update_time, country_iso, email, language_iso, telephone,  first_name,
source, is_demo, is_test, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, has_ftd, ftd_time,
last_comment_date, last_comment, last_comment_status, actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, is_ftd, crm, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,first_convertion_agent_id,
first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, 
first_retention_agent_id, first_retention_agent_name, first_retention_desk_id, first_retention_desk_name,
last_login_date, last_retention_note_time, last_sales_note_time, decision_time, customer_creation_time, first_ret_agent_assignment_time,
creation_time_dateonly, first_ret_agent_assignment_time_dateonly, decision_time_dateonly)
 
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
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
DATE_FORMAT(ocl.first_ret_agent_assignment_time, '%Y-%m-%d ') as first_ret_agent_assignment_time_dateonly,
DATE_FORMAT(us.creation_time, '%Y-%m-%d ') as decision_time_dateonly

from antelopedb_superfive.users us  
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


UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and brand = @Brand;
   
analyze table dwh_customers;

COMMIT;    
    
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sync_payments_superfive_first_time_run()
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 begin
	GET DIAGNOSTICS CONDITION 1
        @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	rollback; 
	insert into control (last_update_time, flag, object, brand, runId, errDesc, end_time) 
    values (@Update_time, 0, 'dwh_payments_first_run-error', @Brand, @runId, CONCAT(@p1, " - ", @p2), CURRENT_TIMESTAMP);

end;
set @runId= UUID();

SET FOREIGN_KEY_CHECKS=0;
-- *********************************** superfive **********************************
set @Brand='superfive';
set @Update_time=CURRENT_TIMESTAMP;

insert into control (last_update_time, flag, object, brand, runId, start_time) 
values (@Update_time, 0, 'dwh_payments_first_run', @Brand, @runId, CURRENT_TIMESTAMP);

delete from DWH.dwh_payments where brand_name = @Brand;

-- broker_banking- payments
 INSERT INTO DWH.dwh_payments
(id, brand_name, customer_id, creation_time, customer_last_update_time, last_update_time, country_iso,
language_iso, sales_status, retention_status, campaign_id, campaign_name, sales_rep_id, sales_rep_name,
ret_rep_id, ret_rep_name, sales_desk_id, sales_desk_name, ret_desk_id, ret_desk_name, is_ftd, is_demo,
is_test, ftd_time, type, type_name, status, status_name, amount, currency, base_amount, comment,  actual_desk_id, actual_desk_name,
actual_rep_id , actual_rep_name, crm, email, telephone, first_name, source, transaction_ip, registration_ip, kyc_status, kyc_note, kyc_date, acquisition_status, acquisition_status_name,
first_convertion_agent_id, first_convertion_agent_name, first_convertion_desk_id, first_convertion_desk_name, first_retention_agent_id,
first_retention_agent_name, first_retention_desk_id, first_retention_desk_name, last_login_date, decision_time, last_retention_note_time,
last_sales_note_time, transaction_conv_owner_id, transaction_conv_owner_name, transaction_conv_desk_id, transaction_conv_desk_name,
transaction_ret_owner_id, transaction_ret_owner_name, transaction_ret_desk_id, transaction_ret_desk_name, transaction_owner_id,
transaction_owner_name, transaction_desk_id, transaction_desk_name,psp_name, psp_transaction_id
,customer_creation_time, currency_name, transaction_method , transaction_method_name, psp_descriptor, sub_psp_name,
 sub_psp_transaction_id, card_expiry, card_number, card_type, comment_for_user, transaction_external_id, user_withdrawal_reason,
 creation_time_dateonly, decision_time_dateonly, is_frd)

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
	when bb.type = 1 then -1*bb.amount/100
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
DATE_FORMAT(bb.creation_time, '%Y-%m-%d ') as creation_time_dateonly,
case 
	when bb.type = 0 then DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
	when bb.type = 1 then DATE_FORMAT(bb.decision_time, '%Y-%m-%d ') 
    else DATE_FORMAT(bb.creation_time, '%Y-%m-%d ')
end as decision_time_dateonly,
bb.is_frd as is_frd
from antelopedb_superfive.broker_banking bb  
 left join DWH.dwh_customers cu ON bb.user_id = cu.id and cu.brand_name = @Brand
 left join antelopedb_superfive.operators tranConvOwner on  bb.sales_rep_id= tranConvOwner.id
 left join antelopedb_superfive.desk tranConvDesk on  bb.sales_desk_id  = tranConvDesk.id
 left join antelopedb_superfive.operators tranRetOwner on  bb.retention_rep_id= tranRetOwner.id
 left join antelopedb_superfive.desk tranRetDesk on  bb.retention_desk_id  = tranRetDesk.id
 where bb.normalized_amount/100 > 2 ;


-- ***************bonuses


-- -- ***************bonuses

-- delete non relevant customers
delete from DWH.dwh_payments where brand_name = @Brand and customer_id not in (select id from dwh_customers where brand_name = @Brand);
analyze table dwh_payments;

UPDATE control 
   SET flag = '1' , end_time = CURRENT_TIMESTAMP
   WHERE runId = @runId and  brand = @Brand;
   
COMMIT;    

END$$
DELIMITER ;


