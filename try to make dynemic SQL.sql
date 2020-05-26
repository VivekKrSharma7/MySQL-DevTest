USE DWH;
DELIMITER $$
DROP PROCEDURE IF EXISTS tempProc;
CREATE PROCEDURE tempProc()
BEGIN
  SET @count =0;
  set @DBName='';
  set @Brand='';
  set @v1 =1;
  DROP TEMPORARY TABLE IF EXISTS TableInfo;
  CREATE TEMPORARY TABLE TableInfo
  (
		id int auto_increment primary key, BrandName Varchar(100),DBName varchar(100)
  );
  
  DROP TEMPORARY TABLE IF EXISTS DWH.dwh_brands_desks_operators_temp;
  CREATE TEMPORARY TABLE DWH.dwh_brands_desks_operators_temp LIKE DWH.dwh_brands_desks_operators;
  
  insert into TableInfo(BrandName,DBName)
	select 'Cryptomusu','antelopedb' union all
	select 'Go365','antelopeDbGo365' union all
	select 'StarCapital','antelopedb_StarCapital' union all
	select '7Online','antelopedb_7Online' union all
	select 'ROIMAX','antelope_roimax' union all
	select 'AlphaLive','antelopedb_alphalive' union all
	select 'SuperFive','antelopedb_superfive' union all
	select 'CoinLife','antelopedb_coinlife' ;

	SET @count=(select count(*) from TableInfo);
    #select @count;
  WHILE @v1 <= @count DO
    SET @DBName=(SELECT DBName FROM TableInfo WHERE id=@v1);
    SET @Brand=(SELECT BrandName FROM TableInfo WHERE id=@v1);
		#SELECT @DBName=DBName,@Brand=BrandName FROM TableInfo WHERE id=@v1;
	SET @SQLText = CONCAT('
	  INSERT INTO DWH.dwh_brands_desks_operators_temp
	(
		brand_name,operator_id,country_iso,operator_full_name,operator_active
		,opertor_deleted,desk_id,desk_name,desk_type,desk_type_name,creation_time,Last_Update_Time
	)
		  SELECT 
				''',@Brand,''' AS brand_name,
				odr.operator_id AS operator_id,
				op.country_iso AS country_iso,
				op.full_name AS operator_full_name,
				op.is_active AS operator_active,
				op.is_deleted AS opertor_deleted,
				odr.desk_id AS desk_id,
				dsk.name AS desk_name,
				dsk.type AS desk_type,
				(CASE
					WHEN (dsk.type = 0) THEN ''Conversion''
					WHEN (dsk.type = 1) THEN ''Retention''
					WHEN (dsk.type = 2) THEN ''Ninja''
				END) AS desk_type_name,
				op.creation_time,
				op.Last_Update_Time
			FROM  ',@DBName,'.operator_desk_rel odr
					INNER JOIN ',@DBName,'.operators op ON odr.operator_id = op.id
					INNER JOIN ',@DBName,'.desk dsk ON odr.desk_id = dsk.id ;
	 '); 
	 
	 #select  @SQLText;
	 
	 PREPARE dynamic_statement FROM @SQLText;
	 EXECUTE dynamic_statement;
	 DEALLOCATE PREPARE dynamic_statement;
	 
    SET @v1 = @v1 + 1;
  END WHILE;
  
END$$
DELIMITER ;


#CALL tempProc;
#select brand_name,count(*) from DWH.dwh_brands_desks_operators_temp group by brand_name order by 1;
#select brand_name,count(*) from DWH.dwh_brands_desks_operators group by brand_name order by 1;
