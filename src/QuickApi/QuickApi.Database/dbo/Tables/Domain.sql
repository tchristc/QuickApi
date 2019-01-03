CREATE TABLE [dbo].[Domain]
(
	[DomainId]		INT				NOT NULL,
	[DomainTypeId]	INT				NOT NULL,
	[DomainName]	VARCHAR(50)		NOT NULL, 
    CONSTRAINT [PK_Domain] PRIMARY KEY ([DomainId]),
	CONSTRAINT [PK_Domain_DomainType] FOREIGN KEY ([DomainTypeId]) REFERENCES [dbo].[DomainType] ([DomainTypeId])
)
