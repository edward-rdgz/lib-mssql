-- xtreme_es


ALTER TABLE dbo.Cliente
ALTER COLUMN [ID del cliente] INTEGER NOT NULL

ALTER TABLE dbo.Cliente
ADD CONSTRAINT PK_Cliente PRIMARY KEY CLUSTERED 
(
	[ID del cliente] ASC
) ON [PRIMARY]



-- Borrar llave...
ALTER TABLE dbo.Cliente DROP CONSTRAINT PK_Cliente