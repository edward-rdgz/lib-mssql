/*
Habilitar xp_cmdshell
https://msdn.microsoft.com/en-us/library/ms190693.aspx

-- To allow advanced options to be changed.
EXEC sp_configure 'show advanced options', 1;
GO
-- To update the currently configured value for advanced options.
RECONFIGURE;
GO
-- To enable the feature.
EXEC sp_configure 'xp_cmdshell', 1;
GO
-- To update the currently configured value for this feature.
RECONFIGURE;
GO

*/

/*
Uso de xp_cmdshell
https://msdn.microsoft.com/en-us/library/ms175046.aspx
*/

EXEC xp_cmdshell 'dir *.exe';
GO