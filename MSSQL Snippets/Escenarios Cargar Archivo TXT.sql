USE Test
GO

-- Escenario 1
Truncate Table [tmp].[CostosProducto]
GO
INSERT INTO [tmp].[CostosProducto]
SELECT *
FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.15.0',
                         'Text;Database=Z:\Upload\;HDR=Yes;')...[CostosProducto#txt]
WHERE ID_Material IS NULL
GO
Select Count(*) From [tmp].[CostosProducto]	--217858



-- Escenario 2
Truncate Table [tmp].[CostosProducto]
GO
INSERT INTO [tmp].[CostosProducto]
SELECT *
FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.15.0',
						'Data Source=Z:\Upload\;Extended Properties="Text;HDR=YES;"')...[CostosProducto#txt]
GO
Select Count(*) From [tmp].[CostosProducto]	--?


-- Escenario 3
Truncate Table [tmp].[CostosProducto]
GO
BULK INSERT [tmp].[CostosProducto]
FROM 'Z:\Upload\CostosProducto.txt'
WITH
        (
        DATAFILETYPE = 'char'
        ,CODEPAGE = 'ACP'
        ,FIRSTROW = 2
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '\n'
        ,KEEPIDENTITY
        ,KEEPNULLS
        ,TABLOCK
        --,ERRORFILE = 'Z:\Upload\CostosProducto.txt.log'
        ,MAXERRORS = 1000000
        )
GO
Select Count(*) From [tmp].[CostosProducto]	--217536