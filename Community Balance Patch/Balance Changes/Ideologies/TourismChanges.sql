
UPDATE PostDefines
SET Key = 'ERA_MODERN'
WHERE Name = 'IDEOLOGY_START_ERA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

-- New Resolutions
INSERT INTO Resolutions
	(Type, Description, Help, VoterDecision, ProposerDecision, TourismMod, TechPrereqAnyMember)
VALUES
	('RESOLUTION_TOURISM_PENALTY', 'TXT_KEY_RESOLUTION_TOURISM_PENALTY', 'TXT_KEY_RESOLUTION_TOURISM_PENALTY_HELP', 'RESOLUTION_DECISION_YES_OR_NO', 'RESOLUTION_DECISION_NONE', -35, 'TECH_FLIGHT'),
	('RESOLUTION_TOURISM_BONUS', 'TXT_KEY_RESOLUTION_TOURISM_BONUS', 'TXT_KEY_RESOLUTION_TOURISM_BONUS_HELP', 'RESOLUTION_DECISION_YES_OR_NO', 'RESOLUTION_DECISION_NONE', 50, 'TECH_FLIGHT');

-- Ideologies


UPDATE PolicyBranchTypes
SET FirstAdopterFreePolicies = '1'
WHERE Type = 'POLICY_BRANCH_FREEDOM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE PolicyBranchTypes
SET FirstAdopterFreePolicies = '1'
WHERE Type = 'POLICY_BRANCH_ORDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE PolicyBranchTypes
SET FirstAdopterFreePolicies = '1'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Lose more tenets when you switch.
UPDATE Defines
SET Value = '5'
WHERE Name = 'SWITCH_POLICY_BRANCHES_TENETS_LOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '3'
WHERE Name = 'SWITCH_POLICY_BRANCHES_ANARCHY_TURNS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

-- Tourism stuff

UPDATE Defines
SET Value = '5'
WHERE Name = 'CULTURE_LEVEL_EXOTIC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
		
UPDATE Defines
SET Value = '25'
WHERE Name = 'CULTURE_LEVEL_FAMILIAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
		
UPDATE Defines
SET Value = '50'
WHERE Name = 'CULTURE_LEVEL_POPULAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '3'
WHERE Name = 'BASE_CULTURE_PER_GREAT_WORK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '4'
WHERE Name = 'BASE_TOURISM_PER_GREAT_WORK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '25'
WHERE Name = 'TOURISM_MODIFIER_SHARED_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '15'
WHERE Name = 'TOURISM_MODIFIER_OPEN_BORDERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '10'
WHERE Name = 'TOURISM_MODIFIER_TRADE_ROUTE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '-10'
WHERE Name = 'TOURISM_MODIFIER_DIFFERENT_IDEOLOGIES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Defines
SET Value = '10'
WHERE Name = 'TOURISM_MODIFIER_DIPLOMAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

--- These 5 values change the amount of science earned from trade routes with influence civs. Each is adding to an incremental value (so Familiar is already 1, Popular already 2, etc.)
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SCIENCE_INFLUENCE_LEVEL_EXOTIC', '2'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SCIENCE_INFLUENCE_LEVEL_FAMILIAR', '4'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SCIENCE_INFLUENCE_LEVEL_POPULAR', '6'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SCIENCE_INFLUENCE_LEVEL_INFLUENTIAL', '8'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SCIENCE_INFLUENCE_LEVEL_DOMINANT', '10'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
--- Reduce turns for conquest of cities. Base is 25 for each level of influence, this adds to it.

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_CONQUEST_REDUCTION_BOOST', '5'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

--- Set turns for spies to est. in cities based on influence.

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SPY_BOOST_INFLUENCE_EXOTIC', '5'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SPY_BOOST_INFLUENCE_FAMILIAR', '4'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SPY_BOOST_INFLUENCE_POPULAR', '3'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SPY_BOOST_INFLUENCE_INFLUENTIAL', '2'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_SPY_BOOST_INFLUENCE_DOMINANT', '1'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

--- These 5 values change the amount of gold earned from trade routes with influenced civs. Higher influence = more gold (trade-off for higher influence).
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GOLD_INFLUENCE_LEVEL_EXOTIC', '200'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GOLD_INFLUENCE_LEVEL_FAMILIAR', '400'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GOLD_INFLUENCE_LEVEL_POPULAR', '600'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GOLD_INFLUENCE_LEVEL_INFLUENTIAL', '800'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GOLD_INFLUENCE_LEVEL_DOMINANT', '1000'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GROWTH_INFLUENCE_LEVEL_EXOTIC', '5'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GROWTH_INFLUENCE_LEVEL_FAMILIAR', '10'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GROWTH_INFLUENCE_LEVEL_POPULAR', '15'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GROWTH_INFLUENCE_LEVEL_INFLUENTIAL', '20'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
	
INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_GROWTH_INFLUENCE_LEVEL_DOMINANT', '25'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

-- Theming Bonuses increased in all buildings
		
UPDATE Building_ThemingBonuses
SET Bonus = '8'
WHERE BuildingType = 'BUILDING_UFFIZI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
		
UPDATE Building_ThemingBonuses
SET Bonus = '6'
WHERE BuildingType = 'BUILDING_GLOBE_THEATER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
		
UPDATE Building_ThemingBonuses
SET Bonus = '16'
WHERE BuildingType = 'BUILDING_BROADWAY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );
		
UPDATE Building_ThemingBonuses
SET Bonus = '8'
WHERE BuildingType = 'BUILDING_HERMITAGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '6'
WHERE BuildingType = 'BUILDING_OXFORD_UNIVERSITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '6'
WHERE BuildingType = 'BUILDING_SISTINE_CHAPEL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '10'
WHERE BuildingType = 'BUILDING_LOUVRE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '6'
WHERE BuildingType = 'BUILDING_GREAT_LIBRARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '20'
WHERE BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '5'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '5'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '4'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '4'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_4' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '4'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_5' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '4'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_6' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '4'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_7' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );

UPDATE Building_ThemingBonuses
SET Bonus = '4'
WHERE BuildingType = 'BUILDING_MUSEUM' AND Description = 'TXT_KEY_THEMING_BONUS_MUSEUM_8' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_TOURISM_CHANGES' AND Value= 1 );




