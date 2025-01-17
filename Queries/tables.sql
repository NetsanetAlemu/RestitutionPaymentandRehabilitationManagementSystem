
--CREATE ADDRESS TABLE
CREATE TABLE LandOwner.tblAddress ( 
	[Region] VARCHAR(23) DEFAULT 'Amhara',
	[Zone] VARCHAR(23),
	[Wereda] VARCHAR(23),
	[Kebele] VARCHAR(23),
	[Sub Kebele] VARCHAR(23) CONSTRAINT tblAddressPK PRIMARY KEY )

--CREATE LAND OWNER TABLE 
CREATE TABLE LandOwner.tblLandOwner(
	[Land Owner ID] INT CONSTRAINT tblLandOwnerPK PRIMARY KEY,
	[First Name] VARCHAR(23),
	[Last Name] VARCHAR (23),
	[Gender] CHAR,
	[Birth Date] DATE,
	[Phone Number] INT UNIQUE,
	[Photo] VARBINARY(MAX),
	[Sub Kebele] VARCHAR (23) CONSTRAINT tblLandOwnerFK1 FOREIGN KEY REFERENCES LandOwner.tblAddress([Sub Kebele]))

--CREATING LAND TABLE
CREATE TABLE Property.tblLand (
	[Land ID] INT CONSTRAINT tblLandPK PRIMARY KEY,
	[Land Type] VARCHAR(23),
	[Land Use] VARCHAR(23),
	[Land Area] FLOAT ,
	[Sub Kebele]VARCHAR(23) CONSTRAINT tblLandFK1  FOREIGN KEY REFERENCES LandOwner.tblAddress([Sub Kebele]),
	[Land Owner ID] INT CONSTRAINT tblLandFK2 FOREIGN KEY REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	)

--CREATING CROP TABLE
  CREATE TABLE Property.tblCrop( 
	[Crop Name] VARCHAR(23) CONSTRAINT cropPK PRIMARY KEY ([Crop Name]) ,
	[Current Price] FLOAT )

	CREATE TABLE Property.tblLandGivesCrop( 
	[Crop Name] VARCHAR(23)  CONSTRAINT tblLandGivesCropFK1 FOREIGN KEY REFERENCES Property.tblCrop([Crop Name]),
	[Hervest QPerH of This Year] FLOAT ,
	[Hervest QPerH of Last Year] FLOAT ,
	[Hervest QPerH Two Year Ago] FLOAT ,
	[Land ID]INT CONSTRAINT tblLandGivesCropFK2 FOREIGN KEY REFERENCES Property.tblLand([Land ID]),
	CONSTRAINT tblLandGivesCropcropPK PRIMARY KEY ([Crop Name],[Land ID])
	)
	
	
--CREATING NON PRODUCTIVE PLANT TABLE
CREATE TABLE Property.tblNonProductivePlants( 
	[Plant Name] VARCHAR(23) CONSTRAINT tblNonProductivePlantsPK PRIMARY KEY,
	[Current Price] FLOAT)

--CREATING NON PRODUCTIVE PLANT TABLE
CREATE TABLE Property.tblLandGrowsNonProPlants( 
	[Plant Name] VARCHAR(23) CONSTRAINT tblLandGrowsNonProPlantsFK1 FOREIGN KEY REFERENCES
	Property.tblNonProductivePlants([Plant Name]),
	[Quantity] INT ,
	[Growth Expense] FLOAT , 
	[Preservation Expense] FLOAT ,
	[Land ID]INT CONSTRAINT tblLandGrowsNonProPlantsFK2 FOREIGN KEY REFERENCES Property.tblLand([Land ID]),
	CONSTRAINT tblLandGrowsNonProPlantsPK PRIMARY KEY([Plant Name],[land ID]))

--CREATING PRODUCTIVE PLANTS TABLE

CREATE TABLE Property.tblProductivePlants(
	[Plant Name] VARCHAR(23) CONSTRAINT tblProductivePlantsPK PRIMARY KEY,
	[High Level Current Price] FLOAT ,
	[Middel Level Current Price] FLOAT ,
	[low Level Current Price] FLOAT	)

--CREATING LAND GIVES PRODUCTIVE PLANTS TABLE

CREATE TABLE Property.tblLandGrowsProdPlants(
	[Plant Name] VARCHAR(23) CONSTRAINT tblLandGrowsProPlantsFK1 FOREIGN KEY REFERENCES Property.tblProductivePlants([Plant Name]) ,
	[High Level Quantity] INT,
	[Middle Level Quantity] INT,
	[Low Level Quantity] INT,
	[Growth Expense] FLOAT, 
	[Preservation Expense] FLOAT,
	[Land ID] INT CONSTRAINT tblLandGrowsProdPlantsFK2 FOREIGN KEY REFERENCES Property.tblLand([Land ID]),
	CONSTRAINT tblLandGrowsProdPlantsPK PRIMARY KEY([Plant Name],[Land ID]))

--CREATET MOVABLE PROPERTY TABLE

CREATE TABLE Property.tblMovableProperty(
	[Property Name] VARCHAR(23) ,
	[Uprooting Expense] FLOAT ,
	[Transportation Expense] FLOAT ,
	[Installation Expense] FLOAT ,
	[Recovery Expense] FLOAT ,
	[Land ID] INT CONSTRAINT tblMovablePropertyFK FOREIGN KEY REFERENCES Property.tblLand([Land ID]),
	CONSTRAINT tblMovablePropertyPK PRIMARY KEY ([Land ID] ,[Property Name]))


--CREATE HOUSE TABLE
CREATE TABLE Property.tblHouse(
	[House ID] INT CONSTRAINT tblHousePK PRIMARY KEY ,
	[Labour Quantity] INT ,
	[Current labour Cost] FLOAT ,
	[Land ID] INT CONSTRAINT tblHouseFK FOREIGN KEY REFERENCES Property.tblLand([Land ID]))
	
--CREATE BUILDING MATERIAL TABLE
CREATE TABLE Property.tblBLDGMaterial( 
	[BLDGMterial Name] VARCHAR(23) CONSTRAINT tblBLDGMaterialPK PRIMARY KEY ,
	[Current Price] FLOAT)

--CREATE BUILDING MATERIAL BUILDS HOUSE TABLE
CREATE TABLE Property.tblBLDGMaterialBuildsHouse( 
	[BLDGMterial Name] VARCHAR(23)  CONSTRAINT tblBLDGMaterialBuildsHouseFK1 FOREIGN KEY REFERENCES Property.tblBLDGMaterial([BLDGMterial Name]),
	[Quantity] INT,
	[House ID] INT CONSTRAINT tblBLDGMaterialBuildsHouseFK2 FOREIGN KEY REFERENCES Property.tblHouse([House ID]),
	CONSTRAINT tblBLDGMaterialBuildsHousePK PRIMARY KEY ([BLDGMterial Name],[House ID]))

--CREATE PROJECT TABLE
CREATE TABLE Request.tblProject(
	[Project ID ]INT CONSTRAINT tblProjectPK PRIMARY KEY IDENTITY(1, 1),
	[Project Name] VARCHAR(23),
	[Project Type] VARCHAR(25))

--CREATE Responsibility TABLE

CREATE TABLE Staff.tblResponsibility([Job Title] VARCHAR(23) CONSTRAINT tblResponsibilityPK PRIMARY KEY )


--CREATE FAMILY MEMEBER TABLE
CREATE TABLE LandOwner.tblFamilyMember(
	[Member ID] INT ,
	[First Name] VARCHAR(23),
	[Last Name] VARCHAR (23),
	[Gender] CHAR,
	[Relationship] VARCHAR (23),
	[Birth Date] DATE,
	[Phone Number] INT UNIQUE,
	[Photo] VARBINARY(MAX),
	[Land Owner ID] INT CONSTRAINT tblFamilyMemberFK FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	CONSTRAINT tblFamilyMemberPK PRIMARY KEY([Member ID],[Land Owner ID]))

--CREATE PRIVATE WORK TABLE question: if pinterested isn't a foreing key, why is it included in this table
CREATE TABLE Rehabilitation.tblPrivateWork (
	[PIntersted Job Type] VARCHAR(23),
	[Governmental Budget Support] FLOAT ,
	[Expert Advice] VARCHAR(MAX) ,
	[Land Owner ID] INT CONSTRAINT tblPrivateWorkFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Managed By] VARCHAR(23) CONSTRAINT tblPrivateWorkFK2 FOREIGN KEY REFERENCES staff.tblResponsibility ([Job Title]),
	CONSTRAINT tblPrivateWorkPK PRIMARY KEY ([Land Owner ID]) )

--CREATE RPRDIRACTORATE
CREATE TABLE staff.tblRPRDirectorate (
[RPR Directorate Name] VARCHAR(70) CONSTRAINT tblRPRDirectoratePK PRIMARY KEY ,
[Email] VARCHAR(70) UNIQUE,
[Phone Number] INT UNIQUE)


--CREATE EMPLOYEE TABLE
CREATE TABLE  staff.tblEmployee(
	[Employee ID] INT CONSTRAINT tblEpmloyee PRIMARY KEY ,
	[First Name] VARCHAR(23),
	[Last Name] VARCHAR (23),
	[Gender] CHAR,
	[Phone Number] INT UNIQUE,
	[Photo] VARBINARY(MAX),
	[Email] VARCHAR(23) UNIQUE,
	[RPR Director Name] VARCHAR(70) CONSTRAINT tblEpmloyeeFK1 FOREIGN KEY REFERENCES staff.tblRPRDirectorate([RPR Directorate Name]),
	[Job Title] VARCHAR(23) CONSTRAINT tblEpmloyeeFK2 FOREIGN KEY REFERENCES staff.tblResponsibility ([Job Title]))


--CREATE PROJECT REQUEST TO LAND
CREATE TABLE Request.tblProReqToLand(
	[Request ID] INT CONSTRAINT tblProReqToLandPK PRIMARY KEY  IDENTITY(1,1),
	[Urgency] VARCHAR(20),
	[Land Recoverability] VARCHAR(20),
	[Request Date] DATE ,
	[Requested Area] FLOAT ,
	[Project Duration] FLOAT ,
	[Sub Kebele] VARCHAR(23) CONSTRAINT tblProReqToLandFK1 FOREIGN KEY REFERENCES LandOwner.tblAddress([Sub Kebele]),
	[Responsed By] VARCHAR(23) CONSTRAINT tblProReqToLandFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Project ID] INT CONSTRAINT tblProReqToLandFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]))


--CREATE PAYMENT CHECK TABLE
CREATE TABLE Compensation.tblPaymentCheck(
	[Land Owner ID] INT CONSTRAINT tblPaymentCheckFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Checked By] VARCHAR(23) CONSTRAINT tblPaymentCheckFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Project ID] INT CONSTRAINT tblPaymentCheckFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]),
	[Compensation Date] DATE,
	[Check Payment] VARCHAR(23),
	[Amount] FLOAT,
	CONSTRAINT tblPaymentCheckPK PRIMARY KEY ([Land Owner ID],[Project ID]) )


--CREATE NOTIFY LAND OWNER TABLE
CREATE TABLE Request.tblNotifyLandOwner (
	[Notification Date] DATE,
	[Recieved Or Not] VARCHAR(23),
	[Notification Reason] VARCHAR(23),
	[Land Owner ID] INT CONSTRAINT tblNotifyLandOwnerFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Notified By] VARCHAR(23) CONSTRAINT tblNotifyLandOwnerFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Project ID] INT CONSTRAINT tblNotifyLandOwnerFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]),
	CONSTRAINT tblNotifyLandOwnerPK PRIMARY KEY ([Land Owner ID],[Notification Reason],[Project ID]) )


--CREATE MINUTE DOCUMNEENT TABLE
CREATE TABLE CountProperty.tblMinuteDocument(
	[Check Presense] VARCHAR (23),
	[Discussion Date] DATE,
	[Document Type] VARCHAR(32),
	[Land Owner ID] INT CONSTRAINT tblMinuteDocumentFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Held By] VARCHAR(23) CONSTRAINT tblMinuteDocumentFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Project ID] INT CONSTRAINT tblMinuteDocumentFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]),
	CONSTRAINT tblMinuteDocumentPK PRIMARY KEY ([Land Owner ID],[Document Type],[Project ID]))
	
--CREATE COUNT PROPERTY TABLE
CREATE TABLE CountProperty.tblCountProperties(
	[Counting Date] DATE,
	[Check Counting] VARCHAR(23),
	[Land Owner ID] INT CONSTRAINT tblCountPropertiesFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Counted By] VARCHAR(23) CONSTRAINT tblCountPropertiesFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Project ID] INT CONSTRAINT tblCountPropertiesFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]),
	[Representative ID] INT CONSTRAINT tblCountPropertiesFK4 FOREIGN KEY REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	CONSTRAINT tblCountPropertiesPK PRIMARY KEY ([Land Owner ID],[Project ID]) )

--CREATE ESTIMATE PRICE TABLE
CREATE TABLE Compensation.tblEstimatePrice(
	[Estimation Date] DATE,
	[Check Estiamtion ] VARCHAR(23),
	[Amount] FLOAT,
	[Land Owner ID] INT CONSTRAINT tblEstimatePriceFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Estimated by] VARCHAR(23) CONSTRAINT tblEstimatePriceFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Project ID] INT CONSTRAINT tblEstimatePriceFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]),
	CONSTRAINT tblEstimatePricesPK PRIMARY KEY ([Land Owner ID],[Project ID]))

--CREATE TABLE PRIORITY LAND OWNERS

CREATE TABLE Rehabilitation.tblPriority(
	[City Land Area] FLOAT ,
	[Reason for City Land] VARCHAR(23),
	[Disability] VARCHAR(23),
	[Land Owner ID] INT CONSTRAINT tblPriorityFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID])
	CONSTRAINT tblPriorityPK PRIMARY KEY ([Land Owner ID])
)

--CREATE GROUP WORK
CREATE TABLE Rehabilitation.tblTeam(
	[Team Name] VARCHAR(23) CONSTRAINT tblGroupWorkPK PRIMARY KEY ,
	[Number of Member] 	INT	
	 )


--CREATE GroupRehabilitatesOn TABLE 
CREATE TABLE Rehabilitation.tblTeamRehabilitatesOn(
    [Land Owner ID] INT CONSTRAINT tblGroupRehabilitatesOnFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Managed By] VARCHAR(23) CONSTRAINT tblGroupRehabilitatesOnFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	[Team Name] VARCHAR(23) CONSTRAINT tblGroupRehabilitatesOnFK3 FOREIGN KEY REFERENCES Rehabilitation.tblTeam([Team Name]),
	[Expert Advice] VARCHAR(MAX),
	[Governmental Budget Support] FLOAT,
	CONSTRAINT tblTeamRehabilitatesOnPK PRIMARY KEY ([Land Owner ID], [Team Name]))



--CREATE TotalCompensation TABLE
CREATE TABLE Compensation.tblTotalCompensation(
   [Amount] FLOAT ,
   [Compensation Date] DATE ,
   [Land Owner ID] INT CONSTRAINT tblTotalCompensationFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
   [Project ID] INT CONSTRAINT tblTotalCompensationFK3 FOREIGN KEY REFERENCES Request.tblProject([Project ID]), 
   CONSTRAINT tblTotalCompensationPK PRIMARY KEY ([Land Owner ID],[Project ID]))

--CREATE InterestRequest TABLE
CREATE TABLE Rehabilitation.tblInterestRequest(
	[Interest Name] VARCHAR(23) ,
	[Land Owner ID] INT CONSTRAINT InterestRequestFK1 FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([land Owner ID]),
	[Requested By] VARCHAR(23) CONSTRAINT InterestRequestFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]), 
	CONSTRAINT tblInterestRequestPK PRIMARY KEY ([Land Owner ID],[Interest Name]))

--CREATE PRIORITIZEDLANDOWNER TABLE
CREATE TABLE Rehabilitation.tblPrioritizedLandOwner(
	[Priority ID] INT IDENTITY(1, 1),
	[Land Owner ID] INT CONSTRAINT tblPrioritizedLandOwnerFK1  FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([land Owner ID]),
	[Compensated Area of City Land] INT,
	[Prioritized By] VARCHAR(23) CONSTRAINT tblPrioritizedLandOwnerFK2 FOREIGN KEY REFERENCES staff.tblresponsibility([Job Title]),
	CONSTRAINT tblPrioritizedLandOwnerPK   PRIMARY KEY ([land Owner ID])
	)

--CREATE ACCOUNT TABLE
CREATE TABLE Compensation.tblAccount(
	[Land Owner ID] INT CONSTRAINT tblAccountFK1  FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Account Number] INT UNIQUE,
	CONSTRAINT tblAccountPK  PRIMARY KEY ([Land Owner ID])
)

-- CREATE TABLE PROJECT PAYS TO LAND
CREATE TABLE Compensation.tblProjPaysToLanOwn(
	[Land Owner ID] INT CONSTRAINT tblProjPaysToLanOwnFK1  FOREIGN KEY  REFERENCES LandOwner.tblLandOwner([Land Owner ID]),
	[Project ID] INT CONSTRAINT tblProjPaysToLanOwnFK2 FOREIGN KEY REFERENCES Request.tblProject([Project ID]),
	[Deposited Date] DATE,
	[Amount] FLOAT,
	CONSTRAINT tblProjPaysToLanOwnPK  PRIMARY KEY ([Land Owner ID], [Project ID]))


