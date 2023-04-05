-- To see all LandInfo recorded in the database 
--SELECT * FROM Property.vwLandInfo

-- To SEE LANDINFO NEEDED FOR THE PROJECT in a subkebele
EXECUTE Property.spLandInfo zebbye 

-- ProjectManager makes a request by inserting the appropraite information about the project LIKE the
--name of the project urgency, landrecoverability, reqArea, 
-- duration, and subkebele as input 


EXECUTE   Request.spMakeRequest [Non Governmental], urgent, recoverable, 267370, 6, zebbye, [YXX Project]

--Then notifier see the request 

SELECT * FROM Request.vwSeeRequest




--When  Notifiers  see the request  then they see options of lands to specify in which land the project is going 
-- to settle in by entering the sub-kebele address of the request

 SELECT * FROM Request.fnSelectsLand('Zebbye')

--Then Notifiers see the best land which is compatable to the requested land by entering the requsted area and THE SUB KEBELE
--of the request and select the land owners of the lands
--to notify them to discuss about the reason of the land


SELECT * FROM Request.fnSelectsAppropriateLand(267370,'zebbye') ORDER BY [Land Owner ID]

 -- make notification to landowner
 
EXECUTE Request.spNotifyLandOwner 2,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 4,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 18,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 20,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 22,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 23,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 25,[to discussion] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 26,[to discussion] ,[YXX Project]


--SEE NOTIFICATION

 EXEC Request.spSeeNotificaton [to discussion],[YXX project]
 -- Update the notification cofirmition wheather or not landowners has recieved notification for discusssion

EXECUTE Request.spUpdateAcceptance 2, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 4, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 18, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 20, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 22, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 23, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 25, [To Discussion],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 26, [To Discussion],[YXX Project], [Recieved] 

--SEE NOTIFICATION BY PASSING THE REASON OF THE NOTIFICATION AND THE PROJECT NAME

 EXEC Request.spSeeNotificaton [To Discussion],[YXX project]
-- make minute document by taking landownerid, project name, reason, checkpresence


EXECUTE CountProperty.spMakeMinuteDocument 2, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 4, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 18, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 20, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 22, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 23, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 25, [To Discussion], [YXX Project], present
EXECUTE CountProperty.spMakeMinuteDocument 26, [To Discussion], [YXX Project], present

--SEE THE MINNUTE DOCUMENT BY PASSING THE DOCUMENT TYPE AND THE PROJECT NAME

 EXECUTE CountProperty.spSeeMinuteDocument [To Discussion], [YXX Project]
 
 --WHERE [Document Type] = 'To Discussion'


-- make counting notification by entering the land owner ID ,the reason of the notification and also the project name
EXECUTE Request.spNotifyLandOwner 2,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 4,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 18,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 20,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 22,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 23,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 25,[to count] ,[YXX Project]
EXECUTE Request.spNotifyLandOwner 26,[to count] ,[YXX Project]

  EXECUTE Request.spSeeNotificaton [To count],[YXX project]

--CONFIRM THE COUNTING NOTIFICATION  

EXECUTE Request.spUpdateAcceptance 2, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 4, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 18, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 20, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 22, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 23, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 25, [To Count],[YXX Project], [Recieved] 
EXECUTE Request.spUpdateAcceptance 26, [To Count],[YXX Project], [Not Recieved] 


  EXEC Request.spSeeNotificaton [To count],[YXX project]

-- count: house, movableprop, produc, non produc plants, crop, buildingmaterial
-- Then the counters count and insert the counted crop ifo quantity of crops qperh of 2years ago, last, and this year 
EXECUTE CountProperty.spUpdateCropQuantity Wheat, 86, 30, 40, 2
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 56, 45, 2
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 45, 23, 2

EXECUTE CountProperty.spUpdateCropQuantity Wheat, 16, 30, 40, 4
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 34, 45, 4
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 30, 23, 4

EXECUTE CountProperty.spUpdateCropQuantity Wheat, 16, 30, 40, 18
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 34, 45, 18
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 30, 23, 18


EXECUTE CountProperty.spUpdateCropQuantity Wheat, 86, 30, 40, 20
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 56, 45, 20
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 45, 23, 20

EXECUTE CountProperty.spUpdateCropQuantity Wheat, 16, 30, 40, 22
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 34, 45, 22
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 30, 23, 22


EXECUTE CountProperty.spUpdateCropQuantity Wheat, 86, 30, 40, 23
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 56, 45, 23
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 45, 23, 23

EXECUTE CountProperty.spUpdateCropQuantity Wheat, 16, 30, 40, 25
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 34, 45, 25
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 30, 23, 25


EXECUTE CountProperty.spUpdateCropQuantity Wheat, 86, 30, 40, 26
EXECUTE CountProperty.spUpdateCropQuantity maize, 33, 56, 45, 26
EXECUTE CountProperty.spUpdateCropQuantity teff, 64, 45, 23, 26

--SEE THE COUNTED  CROP 
SELECT * FROM CountProperty.vwSeeCountedCrop ORDER  BY [Land Owner ID]
--EXEC DF
--CREATE PROCEDURE   CountProperty.spSeeCountedCrop
-- SELECT * FROM CountProperty.vwSeeCountedCrop WHERE PRO ORDER  BY [Land Owner ID]
--The counters count  and insert quantity of nonproductive plants byn entring the the plant name ,growth expense ,preservation expense and the land oreservation expense

EXECUTE CountProperty.spUpdateQuanNonProd mango, 73, 980.9, 456.9, 2
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 9234.9, 458.9, 2
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 64, 8756.9, 236.9, 2

EXECUTE CountProperty.spUpdateQuanNonProd mango, 23, 980.9, 456.9, 4
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 986.9, 458.9, 4
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 145, 890.9, 236.9, 4

EXECUTE CountProperty.spUpdateQuanNonProd mango, 23, 980.9, 456.9, 18
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 986.9, 458.9, 18
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 145, 890.9, 236.9, 18


EXECUTE CountProperty.spUpdateQuanNonProd mango, 73, 980.9, 456.9, 20
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 9234.9, 458.9, 20
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 64, 8756.9, 236.9, 20 

EXECUTE CountProperty.spUpdateQuanNonProd mango, 23, 980.9, 456.9, 22
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 986.9, 458.9, 22
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 145, 890.9, 236.9, 22


EXECUTE CountProperty.spUpdateQuanNonProd mango, 73, 980.9, 456.9, 23
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 9234.9, 458.9, 23
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 64, 8756.9, 236.9, 23

EXECUTE CountProperty.spUpdateQuanNonProd mango, 23, 980.9, 456.9, 25
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 986.9, 458.9, 25
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 145, 890.9, 236.9, 25


EXECUTE CountProperty.spUpdateQuanNonProd mango, 73, 980.9, 456.9, 26
EXECUTE CountProperty.spUpdateQuanNonProd gesho, 16, 9234.9, 458.9, 26
EXECUTE CountProperty.spUpdateQuanNonProd [bahir zaf], 64, 8756.9, 236.9, 26

--SEE THE COUNTED PLANT INFO
SELECT * FROM CountProperty.vwSeeCountedNonProd  ORDER BY [Land Owner ID]


-- Counters count and Update quantity of productive plants


EXECUTE CountProperty.spUpdateProdPlant mango, 35, 50,93, 980.9, 456.9, 2
EXECUTE CountProperty.spUpdateProdPlant gesho, 36,56, 69, 986.9, 458.9, 2
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],34, 64, 45, 890.9, 236.9, 2

EXECUTE CountProperty.spUpdateProdPlant mango, 44, 50,43, 980.9, 456.9, 4
EXECUTE CountProperty.spUpdateProdPlant gesho, 66,56, 43, 986.9, 458.9, 4
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],87, 164, 42, 890.9, 236.9, 4


EXECUTE CountProperty.spUpdateProdPlant mango, 44, 50,43, 980.9, 456.9, 18
EXECUTE CountProperty.spUpdateProdPlant gesho, 66,56, 43, 986.9, 458.9, 18
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],87, 164, 42, 890.9, 236.9, 18

EXECUTE CountProperty.spUpdateProdPlant mango, 35, 50,93, 980.9, 456.9, 20
EXECUTE CountProperty.spUpdateProdPlant gesho, 36,56, 69, 986.9, 458.9, 20
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],34, 64, 45, 890.9, 236.9, 20

EXECUTE CountProperty.spUpdateProdPlant mango, 44, 50,43, 980.9, 456.9, 22
EXECUTE CountProperty.spUpdateProdPlant gesho, 66,56, 43, 986.9, 458.9, 22
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],87, 164, 42, 890.9, 236.9, 22


EXECUTE CountProperty.spUpdateProdPlant mango, 35, 50,93, 980.9, 456.9, 23
EXECUTE CountProperty.spUpdateProdPlant gesho, 36,56, 69, 986.9, 458.9, 23
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],34, 64, 45, 890.9, 236.9, 23

EXECUTE CountProperty.spUpdateProdPlant mango, 44, 50,43, 980.9, 456.9, 25
EXECUTE CountProperty.spUpdateProdPlant gesho, 66,56, 43, 986.9, 458.9, 25
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],87, 164, 42, 890.9, 236.9, 25

EXECUTE CountProperty.spUpdateProdPlant mango, 35, 50,93, 980.9, 456.9, 26
EXECUTE CountProperty.spUpdateProdPlant gesho, 36,56, 69, 986.9, 458.9, 26
EXECUTE CountProperty.spUpdateProdPlant [bahir zaf],34, 64, 45, 890.9, 236.9, 26

SELECT * FROM CountProperty.vwSeeCountedPlant  ORDER  BY [Land Owner ID]
--The counters count and update the labour force quantity and cost the the given house consume E
EXECUTE CountProperty.spUpdatingHouse 1, 23
EXECUTE CountProperty.spUpdatingHouse 2, 24
EXECUTE CountProperty.spUpdatingHouse 3, 32
EXECUTE CountProperty.spUpdatingHouse 4, 54
EXECUTE CountProperty.spUpdatingHouse 5, 22
EXECUTE CountProperty.spUpdatingHouse 6, 89
EXECUTE CountProperty.spUpdatingHouse 7, 3
EXECUTE CountProperty.spUpdatingHouse 8, 30


SELECT * FROM CountProperty.vwSeeCountedHouse  ORDER  BY [Land Owner ID]


--The counters count and Update quantity of building material of the given  house

EXECUTE CountProperty.spUpdateQuaBM grass, 36, 1
EXECUTE CountProperty.spUpdateQuaBM tin, 56, 1
EXECUTE CountProperty.spUpdateQuaBM wood, 544, 1

EXECUTE CountProperty.spUpdateQuaBM grass, 33, 2
EXECUTE CountProperty.spUpdateQuaBM tin, 76, 2
EXECUTE CountProperty.spUpdateQuaBM wood, 234, 2

EXECUTE CountProperty.spUpdateQuaBM grass, 33, 3
EXECUTE CountProperty.spUpdateQuaBM tin, 76, 3
EXECUTE CountProperty.spUpdateQuaBM wood, 234, 3

EXECUTE CountProperty.spUpdateQuaBM grass, 36, 4
EXECUTE CountProperty.spUpdateQuaBM tin, 56, 4
EXECUTE CountProperty.spUpdateQuaBM wood, 544, 4


EXECUTE CountProperty.spUpdateQuaBM grass, 33, 5
EXECUTE CountProperty.spUpdateQuaBM tin, 76, 5
EXECUTE CountProperty.spUpdateQuaBM wood, 234, 5

EXECUTE CountProperty.spUpdateQuaBM grass, 36, 6
EXECUTE CountProperty.spUpdateQuaBM tin, 56, 6
EXECUTE CountProperty.spUpdateQuaBM wood, 544, 6

EXECUTE CountProperty.spUpdateQuaBM grass, 33, 7
EXECUTE CountProperty.spUpdateQuaBM tin, 76, 7
EXECUTE CountProperty.spUpdateQuaBM wood, 234, 7

EXECUTE CountProperty.spUpdateQuaBM grass, 36, 8
EXECUTE CountProperty.spUpdateQuaBM tin, 56, 8
EXECUTE CountProperty.spUpdateQuaBM wood, 544, 8


SELECT * FROM CountProperty.vwSeeCountedBLDG  ORDER  BY [House ID]


--the counters count  Update movable property on the given land

EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 2
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 4
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 18
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 20
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 22
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 23
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 25
EXECUTE CountProperty.spUpdatingMovableProperty mill, 1343.5, 9873.5, 123.2, 446.4, 26


SELECT * FROM Property.tblMovableProperty
SELECT * from request.tblProject

-- stored procedure to see all counted movable property for a specific project
EXECUTE CountProperty.spSeeMovableProperty [YXX Project]

-- stored procedure to see all counted movable property for a specific project and landowner id
EXECUTE CountProperty.spSeeMovablePropertyOne 22, [YXX Project]


-- To see all counted movable property 

SELECT * FROM CountProperty.vwSeeAllMovableProperty

--SEE ALL COUNTED 
EXECUTE CountProperty.spSeeCountedAll  [YXX Project]

EXECUTE CountProperty.spSeeCountedOne 20,[YXX Project]
-- check whether property has been counted or not

EXECUTE CountProperty.spCheckcounting Counted, 2, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 4, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 18, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 20, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 22, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 23, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 25, 1, 1
EXECUTE CountProperty.spCheckcounting Counted, 26, 1, 1

SELECT * FROM CountProperty.tblCountProperties

-- To see all counted property for a specific project

EXECUTE CountProperty.spCountedInfo [YXX Project]

-- To see all counted property 
SELECT * FROM CountProperty.vwCountedInfo

-- the estimator calculate total compensation for non productive plants, productive plants, house 

	PRINT (Compensation.fnTotalHouseComp(2))
	PRINT(Compensation.fnTotalMVExpComp(2))
	PRINT(Compensation.fnTotalProComp(2))
	PRINT(Compensation.fnTotalNonProductiveComp(2))
	PRINT(Compensation.fnCropCompenstation(2))

		
	PRINT(Compensation.fnTotalHouseComp(4))
	PRINT(Compensation.fnTotalMVExpComp(4))
	PRINT(Compensation.fnTotalProComp(4))
	PRINT(Compensation.fnTotalNonProductiveComp(4))
	PRINT(Compensation.fnCropCompenstation(4))
	PRINT(Compensation.fnTotalComp(4))

	PRINT(Compensation.fnTotalHouseComp(18))
	PRINT(Compensation.fnTotalMVExpComp(18))
	PRINT(Compensation.fnTotalProComp(18))
	PRINT(Compensation.fnTotalNonProductiveComp(18))
	PRINT(Compensation.fnCropCompenstation(18))


	
	PRINT(Compensation.fnTotalHouseComp(20))
	PRINT(Compensation.fnTotalMVExpComp(20))
	PRINT(Compensation.fnTotalProComp(20))
	PRINT(Compensation.fnTotalNonProductiveComp(20))
	PRINT(Compensation.fnCropCompenstation(20))
		

	PRINT(Compensation.fnTotalHouseComp(22))
	PRINT(Compensation.fnTotalMVExpComp(22))
	PRINT(Compensation.fnTotalProComp(22))
	PRINT(Compensation.fnTotalNonProductiveComp(22))
	PRINT(Compensation.fnCropCompenstation(22))
	

	PRINT(Compensation.fnTotalHouseComp(23))
	PRINT(Compensation.fnTotalMVExpComp(23))
	PRINT(Compensation.fnTotalProComp(23))
	PRINT(Compensation.fnTotalNonProductiveComp(23))
	PRINT(Compensation.fnCropCompenstation(23))
	PRINT(Compensation.fnTotalComp(23))

	PRINT(Compensation.fnTotalHouseComp(25))
	PRINT(Compensation.fnTotalMVExpComp(25))
	PRINT(Compensation.fnTotalProComp(25))
	PRINT(Compensation.fnTotalNonProductiveComp(25))
	PRINT(Compensation.fnCropCompenstation(25))

		
	PRINT(Compensation.fnTotalHouseComp(26))
	PRINT(Compensation.fnTotalMVExpComp(26))
	PRINT(Compensation.fnTotalProComp(26))
	PRINT(Compensation.fnTotalNonProductiveComp(26))
	PRINT(Compensation.fnCropCompenstation(26))

	   	  
--The estimators calcualte the total compensation for productive plants  
	PRINT(Compensation.fnTotalComp(2))
	PRINT(Compensation.fnTotalComp(4))
	PRINT(Compensation.fnTotalComp(18))	
	PRINT(Compensation.fnTotalComp(20))
	PRINT(Compensation.fnTotalComp(22))
	PRINT(Compensation.fnTotalComp(25))
	PRINT(Compensation.fnTotalComp(26))

--Updating whether estimation has been done or not


EXECUTE Compensation.spMakeEstimation  2,1
EXECUTE Compensation.spMakeEstimation  4,1
EXECUTE Compensation.spMakeEstimation  18,1

EXECUTE Compensation.spMakeEstimation  20,1
EXECUTE Compensation.spMakeEstimation  22,1
EXECUTE Compensation.spMakeEstimation  23,1
EXECUTE Compensation.spMakeEstimation  25,1

EXECUTE Compensation.spMakeEstimation  26,1

SELECT * FROM Compensation.tblEstimatePrice

-- To see all estimated price
SELECT * FROM Compensation.vwAllEstimatedPrice

-- To see all estimated price for a specific project
EXECUTE Compensation.spEstimatedPrice [YXX Project]

--Verify estimation
EXECUTE Compensation.spVerifyEstimation [Verified],2,1
EXECUTE Compensation.spVerifyEstimation [Verified],4,1
EXECUTE Compensation.spVerifyEstimation [Verified],18,1
EXECUTE Compensation.spVerifyEstimation [Verified],20,1
EXECUTE Compensation.spVerifyEstimation [Verified],22,1
EXECUTE Compensation.spVerifyEstimation [Verified],23,1	
EXECUTE Compensation.spVerifyEstimation [Verified],25,1
EXECUTE Compensation.spVerifyEstimation [Verified],26,1

-- To see all estimated price for a specific project
EXECUTE Compensation.spEstimatedPrice [YXX Project]

--See all total compensation of all projects
SELECT * FROM Compensation.vwSeeTotalCompensation

--execute STORE PROCEDURE TO SEE THE TOTAL COMPENSATION for prticular project


EXECUTE Compensation.spSeeTotalCompensation [YXX Project]
-- To see all estimated price for a specific project
EXECUTE Compensation.spEstimatedPrice [YXX Project]

-- CREATE ACCOUNT to landowners
EXECUTE Compensation.spAddAccount 2, 1, 10001
EXECUTE Compensation.spAddAccount 4, 1, 10002

EXECUTE Compensation.spAddAccount 18, 1, 10003
EXECUTE Compensation.spAddAccount 20, 1, 10004

EXECUTE Compensation.spAddAccount 22, 1, 10005
EXECUTE Compensation.spAddAccount 23, 1, 10006

EXECUTE Compensation.spAddAccount 25, 1, 10007
EXECUTE Compensation.spAddAccount 26, 1, 10008

SELECT * FROM  Compensation.tblAccount
SELECT * FROM  Compensation.tblProjPaysToLanOwn

--CREATE VIEW TO SEE THE ACCOUNT OF THE LAND OWNERS

SELECT * FROM Compensation.vwSeeAccount

--CREATE STORE PROCEDURE TO SEE THE ACCOUNT OF LANDOWNERS OF SPECIFIC PROJECT
EXECUTE Compensation.spSeeAllAcount [YXX Project]


-- PAY TO LAND OWNERS
EXECUTE Compensation.spPayToLandOwners 2,1
EXECUTE Compensation.spPayToLandOwners 4,1
EXECUTE Compensation.spPayToLandOwners 18,1

EXECUTE Compensation.spPayToLandOwners 20,1
EXECUTE Compensation.spPayToLandOwners 22,1

EXECUTE Compensation.spPayToLandOwners 23,1


EXECUTE Compensation.spPayToLandOwners 25,1
EXECUTE Compensation.spPayToLandOwners 26,1

SELECT * FROM Compensation.vwPaymentCheck

--EXECUTE  STORE PROCEDURE TO CHEDCK PAYMENT CHECK

EXECUTE Compensation.spPaymentCheck [YXX Project]


--SEE PAYMENT
SELECT * FROM Compensation.vwProjPaysToLanOwn


--SEE THE PAYMENT TABLE FOR PARTICULAR PROJECT

EXECUTE  Compensation.spSeePayment [YXX Project]

-- prioritizing evacuees by inserting valued to prioritize table


EXECUTE Rehabilitation.spInsertPriority 367, [By Inheritance], disable, 2 

EXECUTE Rehabilitation.spInsertPriority 230, [By Buying], none, 4

EXECUTE Rehabilitation.spInsertPriority 367, [By Inheritance], disable, 18

EXECUTE Rehabilitation.spInsertPriority 230, [By Buying], none, 20

EXECUTE Rehabilitation.spInsertPriority 367, [By Inheritance], disable, 22

EXECUTE Rehabilitation.spInsertPriority 230, [By Buying], none, 23

EXECUTE Rehabilitation.spInsertPriority 367, [By Inheritance], disable, 25

EXECUTE Rehabilitation.spInsertPriority 230, [By Buying], none, 26

-- see all priority table


SELECT * FROM Rehabilitation.vwSeePriority
-- see all priority table for specific project

EXECUTE Rehabilitation.spSeePriority [YXX Project]

-- check whether or not they're eligible to get city landL

PRINT (Rehabilitation.fnCityLanEligibile(2))

PRINT (Rehabilitation.fnCityLanEligibile(4))

PRINT (Rehabilitation.fnCityLanEligibile(18))

PRINT (Rehabilitation.fnCityLanEligibile(20))

PRINT (Rehabilitation.fnCityLanEligibile(22))

PRINT (Rehabilitation.fnCityLanEligibile(23))

PRINT (Rehabilitation.fnCityLanEligibile(25))

PRINT (Rehabilitation.fnCityLanEligibile(26))


--  prioririze based on age, disability, city land area
EXECUTE Rehabilitation.spPrioritizedLanOwner

SELECT * FROM Rehabilitation.tblPrioritizedLandOwner


--SEE THE PRIORITIZED LAND OWNER
SELECT * FROM Rehabilitation.vwPrioritizedLandowner

--SEE THE PRIORITIZED LAND OWNERS IN PARTICULAR PROJECT
EXECUTE Rehabilitation.spPrioritisedMember [YXX project]

-- Update interest request table

EXECUTE Rehabilitation.spRequestInterest [Chicken Farming], 2
EXECUTE Rehabilitation.spRequestInterest [Dairy Products], 4

EXECUTE Rehabilitation.spRequestInterest [Chicken Farming], 18
EXECUTE Rehabilitation.spRequestInterest [Dairy Products], 20

EXECUTE Rehabilitation.spRequestInterest [Chicken Farming], 22
EXECUTE Rehabilitation.spRequestInterest [Dairy Products], 23

EXECUTE Rehabilitation.spRequestInterest [Chicken Farming], 25
EXECUTE Rehabilitation.spRequestInterest [Dairy Products], 26





--SEE THE LAND OWNER INTEREST

SELECT * FROM  Rehabilitation.vwSeeLandOwersInterest 

-- Update private work table

EXECUTE Rehabilitation.spAddToPrivateWork [Chicken Farming], 6646, [chicken farming, raising of chicken domestically or commercially, primarily for meat and eggs
but also for feathers.], 2

EXECUTE Rehabilitation.spAddToPrivateWork [Chicken Farming], 6646, [chicken farming, raising of chicken domestically or commercially, primarily for meat and eggs
but also for feathers.], 18

EXECUTE Rehabilitation.spAddToPrivateWork [Chicken Farming], 6646, [chicken farming, raising of chicken domestically or commercially, primarily for meat and eggs
but also for feathers.], 22

EXECUTE Rehabilitation.spAddToPrivateWork [Chicken Farming], 6646, [chicken farming, raising of chicken domestically or commercially, primarily for meat and eggs
but also for feathers.], 25

select * from Rehabilitation.vwSeePrivateWorker

--Group forming 
 EXECUTE Rehabilitation.spFormTeam 4 ,[dairy farming, breeding, raising, and utilization of dairy animals primarily co] ,[Dairy Products] ,12133
 EXECUTE Rehabilitation.spFormTeam 20 ,[dairy farming, breeding, raising, and utilization of dairy animals primarily co] ,[Dairy Products] ,12133
 EXECUTE Rehabilitation.spFormTeam 23 ,[dairy farming, breeding, raising, and utilization of dairy animals primarily co] ,[Dairy Products] ,12133
 EXECUTE Rehabilitation.spFormTeam 26 ,[dairy farming, breeding, raising, and utilization of dairy animals primarily co] ,[Dairy Products] ,12133
 
 SELECT * FROM  Rehabilitation.tblTeamRehabilitatesOn
 SELECT * FROM Rehabilitation.tblTeam


 
 -- VIEWS LANDOWNER INFORMATION BY INSERTING sub kebele
  EXECUTE LandOwner.spLandOwnersInfo zebbye
 -- VIEW FAMILYMEMBER INFO
 EXECUTE LandOwner.spFamilyMembers 4
 -- VIEWS COUNTED PROPERTY TO CHECK WHETHER HIS PROPERTY HAS BEEN COUNTED CORRECTLY BY INSERTING HIS ID

  EXECUTE staff.spExpertsInfo [YXX Project]

 
