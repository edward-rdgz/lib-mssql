USE Aromatherapy
GO

-- Show the contents before the trigger is run
SELECT * from TriggerMessages

-- Issue the command that will invoke the trigger
UPDATE Oils
SET Description = 'New Description'
WHERE OilName = 'Clary Sage'

-- Show the contents after the trigger is run
SELECT * FROM TriggerMessages