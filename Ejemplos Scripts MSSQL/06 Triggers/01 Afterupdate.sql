USE Aromaterapia
IF EXISTS (SELECT name FROM sysobjects
      	   WHERE name = 'afterUpdate' AND type = 'TR')
   DROP TRIGGER afterUpdate
GO


CREATE TRIGGER afterUpdate
ON Oils
AFTER UPDATE
AS
INSERT INTO TriggerMessages (TriggerName, MessageText)
VALUES ('afterUpdate', 'Enviado por el desencadenador afterUpdate')
