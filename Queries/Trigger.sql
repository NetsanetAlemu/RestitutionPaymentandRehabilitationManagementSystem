
--Create trigger to update the total compensation when the crop quantity is updated
GO
CREATE TRIGGER Property.trigUpdateTotalCrop ON Property.tblLandGivesCrop
AFTER UPDATE
AS
IF ( UPDATE([Hervest QPerH of This Year]) OR UPDATE([Hervest QPerH of Last Year]) OR UPDATE([Hervest QPerH Two Year Ago]) )
  BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT Compensation.fnTotalComp ([Land ID]) FROM INSERTED)
  SELECT @temp2 = ( SELECT [Land Owner ID] from Property.tblLand WHERE [Land ID] = (SELECT [Land ID] FROM INSERTED))
  UPDATE Compensation.tblTotalCompensation SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
  END
GO



-- create trigger to update the total comopensation when non productive plant quantity is updated
GO
CREATE TRIGGER Property.trigUpdateTotalByNonPro ON Property.tblLandGrowsNonProPlants 
AFTER UPDATE
AS
IF(UPDATE ([Quantity])) OR (UPDATE ([Growth Expense])) OR (UPDATE ([Preservation Expense])) 
  BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT Compensation.fnTotalComp ([Land ID]) FROM INSERTED)
  SELECT @temp2 = ( SELECT [Land Owner ID] from Property.tblLand WHERE [Land ID] = (SELECT [Land ID] FROM INSERTED))
  UPDATE Compensation.tblTotalCompensation SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
END
GO

-- create trigger to update the total comopensation when non productive plant quantity is updated
GO
CREATE TRIGGER Property.trigUpdateTotalByPro ON Property.tblLandGrowsProdPlants 
AFTER UPDATE
AS
IF(UPDATE ([Growth Expense]) OR UPDATE ([Preservation Expense]) OR UPDATE ([High Level Quantity]) OR UPDATE( [Middle Level Quantity])
OR UPDATE ([Low Level Quantity]))
BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT Compensation.fnTotalComp ([Land ID]) FROM INSERTED)
  SELECT @temp2 = ( SELECT [Land Owner ID] from Property.tblLand WHERE [Land ID] = (SELECT [Land ID] FROM INSERTED))
  UPDATE Compensation.tblTotalCompensation SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
END
GO
-- create trigger to update the total comopensation when movable property quantity is updated
GO
CREATE TRIGGER Property.trigUpdateMoveProp ON Property.tblMovableProperty 
AFTER UPDATE
AS
IF(UPDATE ([Uprooting Expense]) OR UPDATE ([Transportation Expense]) OR UPDATE ([Installation Expense]) OR UPDATE( [Recovery Expense]))
BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT Compensation.fnTotalComp ([Land ID]) FROM INSERTED)
  SELECT @temp2 = ( SELECT [Land Owner ID] from Property.tblLand WHERE [Land ID] = (SELECT [Land ID] FROM INSERTED))
  UPDATE Compensation.tblTotalCompensation SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
END
GO


-- create trigger to update the total comopensation when labour force is updated
GO
CREATE TRIGGER Property.trigUpdateTotalLabour ON Property.tblHouse 
AFTER UPDATE
AS
IF(UPDATE ([Labour Quantity]))
BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT Compensation.fnTotalComp ([Land ID]) FROM INSERTED)
  SELECT @temp2 = ( SELECT [Land Owner ID] from Property.tblLand WHERE [Land ID] = (SELECT [Land ID] FROM INSERTED))
  UPDATE Compensation.tblTotalCompensation SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
END
GO

-- create trigger to update the total comopensation when building material is updated
GO
CREATE TRIGGER Property.trigUpdateTotalBM ON Property.tblBLDGMaterialBuildsHouse 
AFTER UPDATE
AS
IF(UPDATE ([Quantity]))
BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT Compensation.fnTotalComp ([Land ID]) FROM tblHouse WHERE [House ID] = (SELECT [House ID] FROM INSERTED))
  SELECT @temp2 = ( SELECT [Land Owner ID] from Property.tblLand WHERE [Land ID] = (SELECT [House ID] FROM tblHouse WHERE [House ID] = (SELECT [House ID] FROM INSERTED)))
  UPDATE Compensation.tblTotalCompensation SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
END
GO


-- CREATE TRIGGERT TO update totalcomp when estimate price is correct
GO
alter TRIGGER Compensation.trigToUpdateTotalComp on   Compensation.tblEstimatePrice
AFTER UPDATE
AS

BEGIN
	IF( UPDATE ([Check Estiamtion ]))
	INSERT INTO Compensation.tblTotalCompensation SELECT [Amount], GETDATE(), [land Owner ID], [Project ID] FROM INSERTED 
END
GO
GO
CREATE TRIGGER Compensation.trigToUpdateTotalCom on   Compensation.tblEstimatePrice
AFTER UPDATE
AS

BEGIN
	IF( UPDATE ([Amount]))
	update Compensation.tblTotalCompensation set [Amount] = (SELECT [Amount] FROM INSERTED )
END
GO
-- create trigger to update amount on tblPaymentCheck when amount is updated on tblTotalCompensation
GO
create TRIGGER Compensation.trigUpdateEstimaTot ON  Compensation.tblTotalCompensation
AFTER UPDATE
AS
IF(UPDATE ([Amount]) )
BEGIN
  DECLARE @temp1 INT ,@temp2 INT
  SELECT @temp1 = (SELECT [Amount] FROM INSERTED)
  SELECT @temp2 = ( SELECT [Land Owner ID]  FROM INSERTED)
  UPDATE Compensation.tblPaymentCheck SET [Amount] = @temp1 WHERE [Land Owner ID] = @temp2
END
GO
-- trigger to update payment check when money is transferred to account
GO
CREATE TRIGGER Compensation.trigUpdateCheckPay on Compensation.tblProjPaysToLanOwn
AFTER UPDATE
AS
IF UPDATE ([Amount])
	BEGIN
	INSERT INTO tblPaymentCheck SELECT [Land Owner ID], 'Payment checker', [Project ID], GETDATE(), 'Paid', [Amount] FROM INSERTED
	END
GO
-- trigger to update responsed by when notifylandowner table is updated
GO
CREATE TRIGGER Request.trigUpdatesResposedBy ON Request.tblNotifyLandOwner
AFTER INSERT
AS
BEGIN
	DECLARE @PRID INT
	SELECT @PRID = (SELECT [Project ID] FROM INSERTED)
UPDATE tblProReqToLand SET [Responsed By] = 'Notifier' WHERE [Project ID] = @PRID
END
GO
--CREATE TRIGGER TO COUNT TEAM MEMBER
GO
CREATE TRIGGER Rehabilitation.trigCountTeamMember ON Rehabilitation.tblTeamRehabilitatesOn
AFTER INSERT 
AS
BEGIN 
	DECLARE @LID INT
	SELECT @LID = (SELECT [Land Owner ID] FROM inserted )
	DECLARE @teamName VARCHAR(23)
	SELECT @teamName = (SELECT [Team Name] FROM Rehabilitation.tblTeamRehabilitatesOn  WHERE [Land Owner ID] = @LID)
UPDATE Rehabilitation.tblTeam SET [Number of Member] = (SELECT COUNT(*) FROM Rehabilitation.tblTeamRehabilitatesOn R   WHERE R.[Team Name]IN (SELECT [Team Name] FROM inserted)) WHERE [Team Name]IN (SELECT [Team Name] FROM inserted)
END
GO

	--CREATE TRIGGER TO GIVE PRIVELAGE TO THE EMPLOYEE WHEN WE ADD NEW EMPLOYEE
	CREATE TRIGGER Employee.trigGivePrivieledge ON Employee.tblEmployee
	AFTER INSERT ,UPDATE
	AS
	BEGIN
		DECLARE @NAME VARCHAR(23)
		SELECT @NAME = (SELECT [First Name] from INSERTED)
		DECLARE @ROLE VARCHAR(23)
		SELECT @ROLE = (SELECT [Job Title] from INSERTED)
		CREATE LOGIN [@NAME ] WITH PASSWORD = '12345'
		CREATE USER [@NAME ] FOR LOGIN [@NAME ] 
		sp_addrolemember @ROLE

UPDATE tblBLDGMaterialBuildsHouse SET [Quantity] = 435 where [House ID] = 2 and [BLDGMterial Name]= 'grass'



UPDATE tblHouse SET [Labour Quantity] = 435 where [House ID] = 2 and [Land ID]= 2


SELECT * FROM SELECT * FROM tblTotalCompensation ORDER BY [Land Owner ID]


UPDATE tblMovableProperty SET [Installation Epense] = 4238 where [Name] = 'mill' and [Land ID]= 4

SELECT * FROM tblMovableProperty 
SELECT * FROM tblTotalCompensation ORDER BY [Land Owner ID]


UPDATE tblHouse SET [Labour Quantity] = 435 where [House ID] = 2 and [Land ID]= 2


SELECT * FROM SELECT * FROM tblTotalCompensation ORDER BY [Land Owner ID]


UPDATE Property.tblLandGrowsProdPlants SET [Growth Expense] = 435 where [Name] = 'Gesho' and [Land ID]= 2

SELECT * FROM Property.tblLandGrowsProdPlants 
SELECT * FROM tblTotalCompensation ORDER BY [Land Owner ID]


UPDATE Property.tblLandGrowsNonProPlants SET [Growth Expense] = 423 where [Plant Name] = 'mango' and [Land ID]= 2

SELECT * FROM Property.tblLandGrowsNonProPlants 
SELECT * FROM Compensation.tblTotalCompensation ORDER BY [Land Owner ID]

UPDATE Property.tblLandGrowsNonProPlants SET [Growth Expense] = 423 where [Plant Name] = 'mango' and [Land ID]= 2

UPDATE Property.tblLandGrowsNonProPlants SET [Growth Expense] = 423 where [Plant Name] = 'mango' and [Land ID]= 2

UPDATE Property.tblLandGivesCrop SET [Hervest QPerH of This Year] = 42 where [Crop Name] = 'WHEAT'and [Land ID]= 2
