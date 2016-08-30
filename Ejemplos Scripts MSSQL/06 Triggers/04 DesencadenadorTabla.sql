USE Aromaterapia
IF EXISTS (SELECT name FROM sysobjects
      	   WHERE name = 'tableTrigger' AND type = 'TR')
   DROP TRIGGER desencadenadorTabla
GO


CREATE TRIGGER desencadenadorTabla
ON Oils
AFTER UPDATE
AS
DECLARE @count char(10)
SET @count = CONVERT(char, @@ROWCOUNT)

INSERT INTO TriggerMessages (TriggerName, MessageText)
VALUES ('tableTrigger', @count + ' filas modificadas')

