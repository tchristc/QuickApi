CREATE TABLE [dbo].[EntityColumn]
(
	[EntityColumnId]		INT				NOT NULL,
	[EntityTableId]			INT				NOT NULL,
	[EntityColumnName]		VARCHAR(50)		NOT NULL,
	[EntityColumnTypeId]	INT				NOT NULL,
	[EntityColumnSize]		INT				NULL,
    CONSTRAINT [PK_EntityColumn] PRIMARY KEY ([EntityColumnId]),
    CONSTRAINT [PK_EntityColumn_EntityTable] FOREIGN KEY ([EntityTableId]) REFERENCES [dbo].[EntityTable] ([EntityTableId]),
    CONSTRAINT [PK_EntityColumn_EntityColumnType] FOREIGN KEY ([EntityColumnTypeId]) REFERENCES [dbo].[EntityColumnType] ([EntityColumnTypeId])
)