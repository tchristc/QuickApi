CREATE TABLE [dbo].[DomainColumn]
(
	[DomainColumnId]		INT				NOT NULL,
	[DomainId]				INT				NOT NULL,
	[DomainColumnName]		VARCHAR(256)	NOT NULL,
	[DomainColumnTypeId]	INT				NOT NULL,
	CONSTRAINT [PK_DomainColumn] PRIMARY KEY ([DomainColumnId]),
	--CONSTRAINT [PK_DomainColumn_Domain] FOREIGN KEY ([DomainId]) REFERENCES [dbo].[Domain] ([DomainId]),
	CONSTRAINT [PK_DomainColumn_DomainColumnType] FOREIGN KEY ([DomainColumnTypeId]) REFERENCES [dbo].[DomainColumnType] ([DomainColumnTypeId])
)