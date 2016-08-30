USE Aromaterapia
IF EXISTS (SELECT name FROM sysobjects
      	   WHERE name = 'InsteadOf' AND type = 'TR')
   DROP TRIGGER afterUpdate
GO


CREATE TRIGGER insteadOf
ON Oils
INSTEAD OF UPDATE
AS
INSERT INTO TriggerMessages (TriggerName, MessageText)
VALUES ('insteadOf', 'Enviado por el desencadenador insteadOf')
