--DATA INSRTING INTO THE ADDRESS TABLE
INSERT INTO LandOwner.tblAddress VALUES ('Amhara','South Gonder','Estie','Dinkussa','Zebbye')
INSERT INTO LandOwner.tblAddress VALUES ('Amhara','South Gonder','Estie','Kokit','Kokit')
INSERT INTO LandOwner.tblAddress VALUES ('Amhara','South Gonder','Estie','Mikrie','Rufael')

--INSERTING DATA INTO LAND OWNER TABLE
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (1,'Demlew','Bogale','M','1956-3-4',0912344,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (2,'Kibrom','Tewelde','M','1965-3-3',0912544,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (3,'Debebe','Yigezu','M','1956-3-1',0912244,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (4,'Yilma','Kurabachew','M','1936-6-3',0932344,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (5,'Feleke','Yitagesu','M','1956-3-23',0923444,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (6,'Tilahun','Yitagesu','M','1956-3-23',0957264,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (7,'Mulatu','Taddesee','M','1956-3-23',0988378,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (8,'Chalachew','Andargie','M','1956-3-23',0934474,'Kokit')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (9,'Melaku','Bezabih','M','1956-3-23',0944532,'Kokit')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (10,'Work','Yehualashet','M','1926-3-23',0943425,'Kokit')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (11,'Muhamed','Mulat','M','1926-3-23',09465425,'Kokit')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (12,'Ahimed','Mustofa','M','1926-3-23',09345425,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (13,'Grirma','weldeyesus','M','1926-3-23',0923425,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (14,'G/slasie','Yehualashet','M','1926-3-23',0965425,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (15,'Hunachew','Hulgizie','M','1926-3-23',093425,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (16,'Eyayu','Yibekal','M','1926-3-23',0934825,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (17,'Beletu','Yehualashet','f','1926-3-23',09235525,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (18,'Truneh','Mulatie','M','1926-3-23',09436545,'Zebbye')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (19,'Asichenaki','Meshesha','M','1926-3-23',094425,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (20,'Ayalew','Yehualashet','M','1926-3-23',0953225,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (21,'Birku','Work','M','1926-3-23',0245425,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (22,'Sisay','Birku','M','1926-3-23',09245425,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (23,'Abebech','Mulatie','F','1926-3-23',0953425,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (24,'Zeleke','Yehualashet','M','1926-3-23',09256425,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (25,'Aletsehay','Seged','F','1926-3-23',09563425,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (26,'Muhamed','Werkie','M','1926-3-23',0942455,'Rufael')
INSERT INTO LandOwner.tblLandOwner([Land Owner ID],[First Name],[Last Name],[Gender],[Birth Date],[Phone Number],[Sub Kebele]) VALUES (27,'Workwha','Agegnehu','F','1926-3-23',09456425,'Rufael')

UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\1.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 1
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\2.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 2
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\3.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 3
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\4.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 4
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\5.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 5
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 6
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\7.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 7
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\8.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 8
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\9.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 9
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\10.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 10
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\1.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 11
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\2.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 12
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\3.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 13
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\4.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 14
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\5.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 15
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 16
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\7.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 17
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\8.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 18
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\9.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 19
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\1.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 20
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\1.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 21
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\10.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 22
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\3.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 23
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\4.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 24
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\5.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 25
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 26
UPDATE LandOwner.tblLandOwner SET [Photo] = (SELECT * FROM OPENROWSET(BULK N'C:\image\7.png', SINGLE_BLOB) as T1) WHERE [Land Owner ID] = 27

--INSERTING DATA INTO LAND LABLE
INSERT INTO Property.tblLand VALUES (1,'plain','Farming',23145,'Zebbye',1) 
INSERT INTO Property.tblLand VALUES (2,'plain','Farming',45165,'Zebbye',2) 
INSERT INTO Property.tblLand VALUES (3,'mountainous','Farming',8995,'Zebbye',3) 
INSERT INTO Property.tblLand VALUES (4,'plain','Farming',35245,'Zebbye',4) 
INSERT INTO Property.tblLand VALUES (5,'plain','Farming',54645,'Rufael',5) 
INSERT INTO Property.tblLand VALUES (6,'mountainous','Farming',67545,'Rufael',6) 
INSERT INTO Property.tblLand VALUES (7,'mountainous','Farming',8935,'Rufael',7) 
INSERT INTO Property.tblLand VALUES (8,'plain','Farming',9358,'Kokit',8) 
INSERT INTO Property.tblLand VALUES (9,'mountainous','Farming',9484,'Kokit',9) 
INSERT INTO Property.tblLand VALUES (10,'mountainous','Farming',94578,'Kokit',10) 
INSERT INTO Property.tblLand VALUES (11,'plain','Farming',1258,'Kokit',11) 
INSERT INTO Property.tblLand VALUES (12,'plain','Farming',13258,'Zebbye',12) 
INSERT INTO Property.tblLand VALUES (13,'plain','Farming',6543,'Zebbye',13) 
INSERT INTO Property.tblLand VALUES (14,'mountainous','Farming',1258,'Kokit',14) 
INSERT INTO Property.tblLand VALUES (15,'mountainous','Farming',64348,'Zebbye',15) 
INSERT INTO Property.tblLand VALUES (16,'plain','Farming',9238,'Kokit',16) 
INSERT INTO Property.tblLand VALUES (17,'mountainous','Farming',23434,'Kokit',17) 
INSERT INTO Property.tblLand VALUES (18,'plain','Farming',34524,'Zebbye',18) 
INSERT INTO Property.tblLand VALUES (19,'plain','Farming',94323,'Kokit',19) 
INSERT INTO Property.tblLand VALUES (20,'plain','Farming',32345,'Zebbye',20) 
INSERT INTO Property.tblLand VALUES (21,'mountainous','Farming',4321,'Kokit',21) 
INSERT INTO Property.tblLand VALUES (22,'plain','Farming',45454,'Zebbye',22) 
INSERT INTO Property.tblLand VALUES (23,'plain','Farming',45134,'Zebbye',23) 
INSERT INTO Property.tblLand VALUES (24,'mountainous','Farming',74328,'Kokit',24) 
INSERT INTO Property.tblLand VALUES (25,'plain','Farming',24544,'Zebbye',25) 
INSERT INTO Property.tblLand VALUES (26,'plain','Farming',24458,'Zebbye',26) 
INSERT INTO Property.tblLand VALUES (27,'plain','Farming',42514,'Kokit',27) 

-- DATA INSERTING INTO THE CROP TABLE
INSERT INTO  Property.tblCrop VALUES ('Barley',23.4 )
INSERT INTO  Property.tblCrop VALUES('Wheat',22.4 )
INSERT INTO  Property.tblCrop VALUES('Maize',33.4 )
INSERT INTO  Property.tblCrop VALUES('Teff',43.4 )
--DATA INERTING INTO  non PRODUCTIVE PLANTS
INSERT INTO Property.tblNonProductivePlants VALUES ('Bahir Zaf',567.6)
INSERT INTO Property.tblNonProductivePlants VALUES ('Mango',823.6)
INSERT INTO Property.tblNonProductivePlants VALUES ('Gesho',727.6)

--INSERTING DATA INTO  Property.tblProductivePlants TABLE
INSERT INTO Property.tblProductivePlants VALUES('Bahir zaf', 345.5, 1523.4, 2341.5)
INSERT INTO Property.tblProductivePlants VALUES('Mango', 345.5, 1523.4, 2341.5)
INSERT INTO Property.tblProductivePlants VALUES('Gesho', 345.5, 1523.4, 2341.5)

--DATA INERTING INTO HOUSE TABLE
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(1,2, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(2,4, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(3,18, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(4,20, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(5,22, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(6,23, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(7,25, 234)
INSERT INTO Property.tblHouse([House ID],[Land ID], [Current labour Cost]) VALUES(8,26, 234)


--Data INSERTING INTO BUILDING MATERIAL PROPERTY TABLE
INSERT INTO Property.tblBLDGMaterial VALUES ('Wood',342.2)
INSERT INTO Property.tblBLDGMaterial VALUES ('Grass',122.2)
INSERT INTO Property.tblBLDGMaterial VALUES ('Tin',732.2)

--DATA INSERTING INTO RESPONSIBILITY TABLE
INSERT INTO Staff.tblResponsibility VALUES('Notifier')
INSERT INTO Staff.tblResponsibility VALUES('Minute Document Holder')
INSERT INTO Staff.tblResponsibility VALUES('Property Counter')
INSERT INTO Staff.tblResponsibility VALUES('Estimator')
INSERT INTO Staff.tblResponsibility VALUES('Rehabilitator')
INSERT INTO Staff.tblResponsibility VALUES('Payment checker')

--DATA INSERTING INTO FAMILY MEMBER TABLE
INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Yitagesu','Bogale','M','Son','1979-3-4',0913444,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),1)
INSERT INTO LandOwner.tblFamilyMember VALUES(2,'Tigst','Bogale','F','Wife','1976-12-4',091344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),1)
INSERT INTO LandOwner.tblFamilyMember VALUES(3,'Meseret','Bogale','F','Daughter','1982-2-4',0913644,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),1)

INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Gebre','Tewelde','M','Son','1982-2-4',0912344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),2)
INSERT INTO LandOwner.tblFamilyMember VALUES (2,'Berhe','Tewelde','M','Son','1978-6-4',0912644,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),2)
INSERT INTO LandOwner.tblFamilyMember VALUES (3,'Aregay','Tewelde','M','Son','1985-4-4',0912544,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),2)

INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Betselot','Yigezu','F','Wife','1985-4-4',0921344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),3)
INSERT INTO LandOwner.tblFamilyMember VALUES (2,'Bekalu','Yigezu','M','Son','1981-6-7',0921354,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),3)
INSERT INTO LandOwner.tblFamilyMember VALUES (3,'Hul Gizie','Yigezu','M','Son','1989-5-4',0921544,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),3)

INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Hul Gizie','Kurabachew','M','Son','1984-5-4',0923344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),4)
INSERT INTO LandOwner.tblFamilyMember VALUES (2,'Selam','Kurabachew','M','Son','1985-3-4',09213434,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),4)
INSERT INTO LandOwner.tblFamilyMember VALUES (3,'Behaylu','Kurabachew','M','Son','1787-4-4',09256344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),4)

INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Behaylu','Kurabachew','M','Son','1782-5-4',0957344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),5)

INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Behaylu','Bezabih','M','Son','1768-5-4',0925644,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),6)
INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Hul gizie','Yitagesu','M','Son','1798-4-3',09561344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),7)
INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Tigist','Yitagesu','F','Wife','1787-4-4',0921564,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),8)
INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Behaylu','Taddess','M','Son','1767-3-2',09213464,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),9)
INSERT INTO LandOwner.tblFamilyMember VALUES (1,'Behaylu','Andargie','M','Son','1777-6-8',0923644,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),10)

--INSERT DATA ITNO RPRGirectorate Table
INSERT INTO Staff.tblRPRDirectorate  VALUES('Compensation and Rehabilitation Directorate','feleke@gmail.com',9489347) 


--INSERT DATA INTO EMPLOYEE TABLE
INSERT INTO staff.tblEmployee VALUES (1,'Kefyalew','Derese','M',98825344,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),'kefyalew@Gmail.con','Compensation and Rehabilitation Directorate','Payment Checker')
INSERT INTO staff.tblEmployee VALUES (3,'Tamrat','Asseme','M',9885342,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),'tamrat@Gmail.con', 'Compensation and Rehabilitation Directorate','Minute Document Holder')
INSERT INTO staff.tblEmployee VALUES (4,'Eyob','G/Meskel','M',988353394,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),'eyobw@Gmail.con', 'Compensation and Rehabilitation Directorate','Property Counter')
INSERT INTO staff.tblEmployee VALUES (5,'Dawud','Usman','M',988233454,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),'dawud@Gmail.con', 'Compensation and Rehabilitation Directorate','Rehabilitator')
INSERT INTO staff.tblEmployee VALUES (6,'Hawa','Muhhamed','f',988523394,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),'hawaw@Gmail.con','Compensation and Rehabilitation Directorate','Estimator')
INSERT INTO staff.tblEmployee VALUES (7,'Hewan','legesse','f',98455694,(SELECT * FROM OPENROWSET(BULK N'C:\image\6.png', SINGLE_BLOB) as T1),'hewan@Gmail.con', 'Compensation and Rehabilitation Directorate','Notifier')

