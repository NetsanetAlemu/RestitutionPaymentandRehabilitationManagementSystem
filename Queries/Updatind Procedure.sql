-- to update land gives crop table
GO
CREATE PROCEDURE Compensation.spUpdate2LandGivesCrop(@cropName VARCHAR(23), @landID INT, @UpdateValue INT, @UpdateYear VARCHAR(30))
AS
BEGIN
	IF(@UpdateYear = 'this')
		UPDATE Property.tblLandGivesCrop SET [Hervest QPerH of This Year] = @UpdateValue WHERE [Land ID] = @landID AND [Crop Name] = @cropName
	ELSE IF(@UpdateYear = 'last')
		UPDATE Property.tblLandGivesCrop SET [Hervest QPerH of Last Year] = @UpdateValue WHERE [Land ID] = @landID AND [Crop Name] = @cropName
	ELSE 
		UPDATE Property.tblLandGivesCrop SET [Hervest QPerH Two Year Ago] = @UpdateValue WHERE [Land ID] = @landID AND [Crop Name] = @cropName
END
GO

-- to update non productive plants table

GO
CREATE PROCEDURE Compensation.spUpdate2LandGrowsNonProPlant(@Name VARCHAR(23), @landID INT, @UpdateValue INT, @UpdateType VARCHAR(23))
AS
BEGIN
	IF(@UpdateType = 'quantity')
		UPDATE Property.tblLandGrowsNonProPlants SET [Quantity] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
	ELSE IF(@UpdateType = 'growth')
		UPDATE Property.tblLandGrowsNonProPlants SET [Growth Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
	ELSE 
		UPDATE Property.tblLandGrowsNonProPlants SET [Preservation Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
END
GO
-- EXECUTE spUpdate2LandGrowsNonProPlant gesho, 2, 3553, quantity
-- SELECT * FROM Property.tblLandGrowsNonProPlants
-- SELECT * FROM tblTotalCompensation

GO
CREATE PROCEDURE Compensation.spUpdate2LandGrowsProdPlant(@Name VARCHAR(23), @landID INT, @UpdateValue INT, @UpdateType VARCHAR(23))
AS
BEGIN
	IF(@UpdateType = ' low')
		UPDATE Property.tblLandGrowsProdPlants SET [Low Level Quantity] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
	ELSE IF(@UpdateType = 'mid')
		UPDATE Property.tblLandGrowsProdPlants SET  [Middle Level Quantity] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
	ELSE IF (@UpdateType = 'high')
		UPDATE Property.tblLandGrowsProdPlants SET [High Level Quantity] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
	ELSE IF(@UpdateType = 'growth')
		UPDATE Property.tblLandGrowsProdPlants SET [Growth Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
	ELSE 
		UPDATE Property.tblLandGrowsProdPlants SET [Preservation Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Plant Name] = @Name
END
GO

-- EXECUTE Compensation.spUpdate2LandGrowsProdPlant gesho, 2, 3553, low

-- SELECT * FROM Property.tblLandGrowsProdPlants

-- SELECT * FROM tblTotalCompensation

GO

-- updates movable property table
CREATE PROCEDURE Compensation.spUpdate2MovProp(@Name VARCHAR(23), @landID INT, @UpdateValue INT, @UpdateType VARCHAR(23))
AS
BEGIN
	IF(@UpdateType = ' uproot')
		UPDATE Property.tblMovableProperty SET [Uprooting Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Property Name] = @Name
	ELSE IF(@UpdateType = 'transport')
		UPDATE Property.tblMovableProperty SET  [Transportation Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Property Name] = @Name
	ELSE IF (@UpdateType = 'install')
		UPDATE Property.tblMovableProperty SET [Installation Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Property Name] = @Name
	ELSE 
		UPDATE Property.tblMovableProperty SET [Recovery Expense] = @UpdateValue WHERE [Land ID] = @landID AND [Property Name] = @Name
END
GO


-- EXECUTE Compensation.spUpdate2MovProp mill, 2, 7685, uproot
-- SELECT * FROM tblMovableProperty 
-- SELECT * FROM Compensation.tblTotalCompensation ORDER BY [Land Owner ID]
GO
 -- updates table house

CREATE PROCEDURE Compensation.spUpdate2LabourQuan(@houseID INT, @landID INT, @UpdateValue INT)
AS
BEGIN
	UPDATE Property.tblHouse SET [Labour Quantity] = @UpdateValue WHERE [Land ID] = @landID AND [House ID] = @houseID
END
-- GO
-- EXECUTE Compensation.spUpdate2LabourQuan 1, 2, 350

-- SELECT * FROM Property.tblHouse

-- SELECT * FROM Compensation.tblTotalCompensation
GO
-- create trigger to update the total comopensation when building material is updated


CREATE PROCEDURE Compensation.spUpdate2BMQuan(@houseID INT, @BMname VARCHAR(30), @UpdateValue INT)
AS
BEGIN
	UPDATE Property.tblBLDGMaterialBuildsHouse SET [Quantity] = @UpdateValue WHERE [BLDGMterial Name] = @BMname AND [House ID] = @houseID
END
-- GO
-- EXECUTE Compensation.spUpdate2BMQuan 2, grass, 355

-- update tblPaymentCheck SET [Total Compensation] = 10 
-- SELECT * FROM tblBLDGMaterialBuildsHouse
-- SELECT * FROM tblTotalCompensation
-- SELECT * FROM tblPaymentCheck
