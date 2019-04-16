
Get-PSSession
#Import Solution
$solutionFile = "C:\Users\sphillips\Desktop\Output\BulkInvoicing.zip" #The absolute path to the solution file zip to be imported
																													#org2be3e7e3
$employeeDevConnectionString = "AuthType=Office365;UserName=Dynamics-Admin@firstkeyhomes.com;Password=Welcome2FKH!;URL=https://firstkeyhomesemployeedev.crm.dynamics.com" #The target CRM organization connection string
[bool]$override = $true #If set to 1 will override the solution even if a solution with same version exists
[bool]$publishWorkflows = $true #Will publish workflows during importget
[bool]$overwriteUnmanagedCustomizations = $true #Will overwrite unmanaged customizations
[bool]$skipProductUpdateDependencies = $false #Will skip product update dependencies
[bool]$convertToManaged = $false #Direct the system to convert any matching unmanaged customizations into your managed solution. Optional.
[bool]$holdingSolution = $true
[string]$logsDirectory = "C:\Users\sphillips\Desktop\Output"


& "$scriptPath\Lib\xRMCIFramework\ImportSolution.ps1" -Verbose -solutionFile $solutionFile -crmConnectionString $employeeDevConnectionString -override $override -publishWorkflows $publishWorkflows -overwriteUnmanagedCustomizations $overwriteUnmanagedCustomizations -skipProductUpdateDependencies $skipProductUpdateDependencies -convertToManaged $convertToManaged -holdingSolution $holdingSolution -logsDirectory $logsDirectory



