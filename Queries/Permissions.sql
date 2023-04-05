-- Granting permissions for role SYSTEM ADMIN

 GRANT CONTROL TO systemAdmins
--GRANT SELECT ON Property.vwLandInfo TO projectManagers
GRANT EXECUTE ON Property.spLandInfo TO projectManagers
GRANT EXECUTE ON Request.spMakeRequest TO projectManagers
GRANT EXECUTE ON Compensation.spPayToLandOwners TO projectManagers
 
-- Granting permissions for role Land Owner

GRANT EXECUTE ON CountProperty.spSeeMovablePropertyOne TO landOwners
GRANT EXECUTE ON CountProperty.spSeeCountedOne TO landOwners
GRANT EXECUTE ON LandOwner.spFamilyMembers TO landOwners



-- Granting permissions for role Notifier
GRANT SELECT ON Request.vwSeeRequest TO notifiers
GRANT EXECUTE ON Request.spProjectInfo TO notifiers
GRANT EXECUTE ON Request.spSeeNotificaton TO notifiers
GRANT EXECUTE ON Property.spLandInfo TO notifiers
GRANT SELECT ON Request.vwSeeRequest TO projectManagers
GRANT SELECT ON Request.fnSelectsAppropriateLand TO notifiers
GRANT EXECUTE ON Request.spUpdateAcceptance TO notifiers
GRANT SELECT ON Request.fnSelectsLand TO notifiers
GRANT SELECT ON Request.vwNotification TO notifiers
GRANT EXECUTE ON Request.spNotifyLandOwner TO notifiers

-- Granting permissions for role Minute Document Holder
GRANT EXECUTE ON CountProperty.spMakeMinuteDocument  TO minDocHolders
GRANT EXECUTE ON CountProperty.spSeeMinuteDocument  TO minDocHolders
GRANT SELECT ON CountProperty.vwMinutedocument TO minDocHolders

-- Granting permissions for role Property Counter

GRANT EXECUTE ON CountProperty.spUpdateCropQuantity TO propCounters
GRANT SELECT ON CountProperty.vwSeeCountedCrop TO propCounters
GRANT EXECUTE ON  CountProperty.spUpdateQuanNonProd TO propCounters
GRANT SELECT ON CountProperty.vwSeeCountedNonProd TO propCounters
GRANT EXECUTE ON CountProperty.spUpdateProdPlant TO propCounters
GRANT SELECT ON CountProperty.vwSeeCountedPlant TO propCounters
GRANT EXECUTE ON CountProperty.spUpdatingHouse TO propCounters
GRANT SELECT ON CountProperty.vwSeeCountedHouse TO propCounters
GRANT EXECUTE ON CountProperty.spUpdateQuaBM TO propCounters
GRANT SELECT ON CountProperty.vwSeeCountedBLDG TO propCounters
GRANT EXECUTE ON CountProperty.spUpdatingMovableProperty TO propCounters
GRANT SELECT ON CountProperty.vwSeeAllMovableProperty TO propCounters
GRANT EXECUTE ON CountProperty.spCheckcounting TO propCounters
GRANT EXECUTE ON CountProperty.spSeeCountedAll TO propCounters
GRANT EXECUTE ON CountProperty.spSeeCountedOne TO propCounters
GRANT SELECT ON CountProperty.vwCountedInfo TO propCounters
GRANT EXECUTE ON CountProperty.spCountedInfo TO propCounters

-- Granting permissions for role Estimator

GRANT EXECUTE ON Compensation.fnTotalHouseComp  TO estimators
GRANT EXECUTE ON Compensation.fnTotalBMComp TO estimators
GRANT EXECUTE ON Compensation.fnTotalMVExpComp TO estimators
GRANT EXECUTE ON Compensation.fnTotalProComp TO estimators
GRANT EXECUTE ON Compensation.fnTotalNonProductiveComp TO estimators
GRANT EXECUTE ON Compensation.fnCropCompenstation TO estimators
GRANT EXECUTE ON Compensation.fnTotalComp TO estimators

--GRANT EXECUTE ON Compensation.spUpdateEstimation TO estimators 
GRANT EXECUTE ON Compensation.spMakeEstimation TO estimators 
GRANT EXECUTE ON Compensation.spEstimatedPrice TO estimators 
GRANT SELECT ON Compensation.vwAllEstimatedPrice TO estimators
GRANT SELECT ON Compensation.vwSeeTotalCompensation TO estimators
GRANT EXECUTE ON Compensation.spSeeTotalCompensation TO estimators
GRANT EXECUTE ON Compensation.spVerifyEstimation TO estimators


-- Granting permissions for role Payment checker
GRANT SELECT ON Compensation.vwSeeTotalCompensation TO payCheckers
GRANT SELECT ON Compensation.vwSeeAccount TO payCheckers
GRANT EXECUTE ON Compensation.spSeeAllAcount TO payCheckers

GRANT SELECT ON Compensation.vwPaymentCheck TO payCheckers
GRANT EXECUTE ON Compensation.spPaymentCheck TO payCheckers
GRANT SELECT ON Compensation.vwProjPaysToLanOwn TO payCheckers
GRANT EXECUTE ON Compensation.spSeePayment TO payCheckers

GRANT EXECUTE ON Compensation.spAddAccount TO payCheckers

-- Granting permissions for role Rehabilitator

GRANT EXECUTE ON Rehabilitation.spInsertPriority TO rehabilitators
GRANT SELECT ON Rehabilitation.vwSeePriority TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spSeePriority TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spAddToPrivateWork TO rehabilitators

GRANT EXECUTE ON Rehabilitation.fnCityLanEligibile TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spPrioritizedLanOwner TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spRequestInterest TO rehabilitators
GRANT SELECT ON Rehabilitation.vwPrioritizedLandowner TO rehabilitators
GRANT SELECT ON Rehabilitation.vwSeeLandOwersInterest TO rehabilitators
GRANT SELECT ON Rehabilitation.vwSeePrivateWorker TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spRequestInterest TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spFormTeam TO rehabilitators
GRANT EXECUTE ON Rehabilitation.spAddToPrivateWork TO rehabilitators


