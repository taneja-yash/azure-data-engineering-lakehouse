CREATE VIEW gold.calendar
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
) AS QUER1;

GO

CREATE VIEW gold.customers
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
) AS QUER2;

GO

CREATE VIEW gold.products
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
) AS QUER3;

GO

CREATE VIEW gold.returns
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) AS QUER4;

GO

CREATE VIEW gold.sales
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
) AS QUER5;

GO

CREATE VIEW gold.subcategories
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_SubCategories/',
    FORMAT = 'PARQUET'
) AS QUER6;

GO

CREATE VIEW gold.territories
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://awsytstorage.blob.core.windows.net/silver/AdventureWorks_Territories/',
    FORMAT = 'PARQUET'
) AS QUER7
