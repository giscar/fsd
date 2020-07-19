CREATE LOGIN [fsd] WITH PASSWORD = 'Fsd1234567@', CHECK_POLICY = ON, CHECK_EXPIRATION = OFF
GO

EXEC sp_addsrvrolemember @loginame='fsd', @rolename = N'sysadmin'
GO

USE master
GO

GRANT CONNECT SQL TO [fsd]