Install-Package Microsoft.EntityFrameworkCore.Tools
Scaffold-DbContext "Server=.;Database=QuickApi.Database;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models