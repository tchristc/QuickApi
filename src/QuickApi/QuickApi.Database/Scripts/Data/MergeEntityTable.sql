MERGE INTO [dbo].[ApiMetadata] AS Target
USING (VALUES
  (1, 'Identity', 0, 1, 0, 'SQL Server', '', 'T4')
)
AS Source ([ApiMetadataId], [ApiName], [ApiMajorVersion], [ApiMinorVersion], [ApiPatchVersion], [ApiDatabase], [ApiDatabaseConnectionString], [ApiCodeGenerationTool])
ON Target.[ApiMetadataId] = Source.[ApiMetadataId]
WHEN MATCHED THEN
UPDATE SET
         [ApiName]						= Source.[ApiName]						
        ,[ApiMajorVersion]				= Source.[ApiMajorVersion]				
        ,[ApiMinorVersion]				= Source.[ApiMinorVersion]				
        ,[ApiPatchVersion]				= Source.[ApiPatchVersion]				
        ,[ApiDatabase]					= Source.[ApiDatabase]					
        ,[ApiDatabaseConnectionString]	= Source.[ApiDatabaseConnectionString]	
        ,[ApiCodeGenerationTool]		= Source.[ApiCodeGenerationTool]			
WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ApiMetadataId], [ApiName], [ApiMajorVersion], [ApiMinorVersion], [ApiPatchVersion], [ApiDatabase], [ApiDatabaseConnectionString], [ApiCodeGenerationTool])
        VALUES ([ApiMetadataId], [ApiName], [ApiMajorVersion], [ApiMinorVersion], [ApiPatchVersion], [ApiDatabase], [ApiDatabaseConnectionString], [ApiCodeGenerationTool])
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;

---------------------------------------------------------
MERGE INTO [dbo].[DomainType] AS Target
USING (VALUES
  (1, 'Entity')
 ,(2, 'Descriptor')
 ,(3, 'Array')
 ,(4, 'Extension')
)
AS Source ([DomainTypeId], [DomainTypeName])
ON Target.[DomainTypeId] = Source.[DomainTypeId]
WHEN MATCHED THEN
UPDATE SET
        [DomainTypeName] = Source.[DomainTypeName]
WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DomainTypeId], [DomainTypeName])
        VALUES ([DomainTypeId], [DomainTypeName])
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;

---------------------------------------------------------
MERGE INTO [dbo].[Domain] AS Target
USING (VALUES
 (1, 1, 'Person')
)
AS Source ([DomainId], [DomainTypeId], [DomainName])
ON Target.[DomainId] = Source.[DomainId]
WHEN MATCHED THEN
UPDATE SET
         [DomainTypeId] = Source.[DomainTypeId]
        ,[DomainName] = Source.[DomainName]
WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DomainId], [DomainTypeId], [DomainName])
        VALUES ([DomainId], [DomainTypeId], [DomainName])
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;

---------------------------------------------------------
MERGE INTO [dbo].[DomainColumnType] AS Target
USING (VALUES
  (1, 'Descriptor')
 ,(2, 'Text')
 ,(3, 'Number')
)
AS Source ([DomainColumnTypeId], [DomainColumnTypeName])
ON Target.[DomainColumnTypeId] = Source.[DomainColumnTypeId]
WHEN MATCHED THEN
UPDATE SET
        [DomainColumnTypeName] = Source.[DomainColumnTypeName]
WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DomainColumnTypeId], [DomainColumnTypeName])
        VALUES ([DomainColumnTypeId], [DomainColumnTypeName])
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;

---------------------------------------------------------
MERGE INTO [dbo].[DomainColumn] AS Target
USING (VALUES
  (1, 1, 'FirstName', 2)
 ,(2, 1, 'LastName', 2)
)
AS Source ([DomainColumnId], [DomainId], [DomainColumnName], [DomainColumnTypeId])
ON Target.[DomainColumnId] = Source.[DomainColumnId]
WHEN MATCHED THEN
UPDATE SET
         [DomainId] = Source.[DomainId]
        ,[DomainColumnName] = Source.[DomainColumnName]
        ,[DomainColumnTypeId] = Source.[DomainColumnTypeId]
WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DomainColumnId], [DomainId], [DomainColumnName], [DomainColumnTypeId])
        VALUES ([DomainColumnId], [DomainId], [DomainColumnName], [DomainColumnTypeId])
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;