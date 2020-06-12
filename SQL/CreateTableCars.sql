CREATE TABLE CARS_HEAD( UID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						REG_SYMBOL VARCHAR(15) Null,
						VIN VARCHAR(20) Null,
						MODEL VARCHAR(50) NULL,
						TYPE_TC VARCHAR(30) NULL,
						CATEGORY VARCHAR(5),
						MADEYEAR int DEFAULT 0,
						CARCASS varchar(12) Null,
						COLOR VARCHAR(40) Null,
						MOTOR_POWER float DEFAULT 0,
						ECOLOGY VARCHAR(30) NULL,
						RESERVE bit Null,	
						DOC_NUM int Not Null,
						DOC_SERIAL int NOT NULL	  			    			 	
						)

CREATE TABLE CARS_DETAIL (ROWID int identity(1,1) PRIMARY KEY Not Null,
						  UID_CAR int Not Null,
						  PASSPORT_NUM int Null,
						  PASSPORT_SERIAL int Null,
						  MASS_MAX float Null,
						  MASS_LOADOUT float Null,
			  
						  INS_NUM int Null,
						  INS_SERIAL int Null,
						  BEG_DATE smalldatetime Null,
						  END_DATE smalldatetime,
						  
						  SHASSIS varchar(15) Null,
						  WORKSTATE	VARCHAR(30) Null,
						  PRIMECH VARCHAR(200) Null
						  )
