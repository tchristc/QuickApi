CREATE TABLE [dbo].[ApiMetadata]
(
	[ApiMetadataId]					INT NOT NULL,
	[ApiName]						NVARCHAR(256) NOT NULL,
	[ApiMajorVersion]				INT NOT NULL,
	[ApiMinorVersion]				INT NOT NULL,
	[ApiPatchVersion]				INT NOT NULL,
	[ApiDatabaseEngine]				NVARCHAR(256) NULL,
	[ApiDatabaseServer]				NVARCHAR(256) NULL,
	[ApiDatabaseName]				NVARCHAR(256) NULL,
	[ApiDatabaseConnectionString]	NVARCHAR(256) NULL,
	[ApiCodeGenerationTool]			NVARCHAR(256) NULL,
	CONSTRAINT [PK_ApiMetadata] PRIMARY KEY ([ApiMetadataId])
)
