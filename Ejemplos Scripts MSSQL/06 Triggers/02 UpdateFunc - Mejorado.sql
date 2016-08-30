USE Aromaterapia
IF EXISTS (SELECT name FROM sysobjects
      	   WHERE name = 'UpdateFunc' AND type = 'TR')
   DROP TRIGGER UpdateFunc
GO


CREATE TRIGGER UpdateFunc
ON Oils
AFTER UPDATE
AS
IF UPDATE(Descripcion)
	INSERT INTO TriggerMessages (TriggerName, MessageText)
	VALUES ('UpdateFunc', 'Descripcion Modificada')
IF UPDATE(OilName)
	INSERT INTO TriggerMessages (TriggerName, MessageText)
	VALUES ('UpdateFunc', 'OilName Modificado ')