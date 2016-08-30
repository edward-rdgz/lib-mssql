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
	Begin
		Declare @u char(50)
		Select @u=OilName From deleted --http://msdn2.microsoft.com/en-us/library/ms191300.aspx
	INSERT INTO TriggerMessages (TriggerName, MessageText)
	VALUES ('UpdateFunc', 'OilName Modificado ' + @u) --¿Y como sabría cual era el valor anterior?
	End;

/*
Truncate Table TriggerMessages;
Select * From TriggerMessages;
*/