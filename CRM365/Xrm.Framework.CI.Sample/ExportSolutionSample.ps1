[CmdletBinding()]

#Testing GITHook

param
(
	#Export Solution
	[string]$devConnectionString = "AuthType=Office365;UserName=Dynamics-Admin@firstkeyhomes.com;Password=Welcome2FKH!;URL=https://org5b2169f3.crm.dynamics.com",
	[string]$solutionName = "TestForDevOps",
	[string]$exportSolutionOutputPath = "C:\Users\sphillips\Desktop\Output"
)


get-date

$ErrorActionPreference = "Stop"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$VerbosePreference = "Continue"

Write-Verbose "Script Path: $scriptPath"
Write-Verbose "ConnectionString = $connectionString"

& "$scriptPath\Lib\xRMCIFramework\ExportSolution.ps1" -Verbose -CrmConnectionString $devConnectionString -SolutionName $solutionName -ExportSolutionOutputPath $exportSolutionOutputPath

get-date

#Import Solution
$solutionFile = "C:\Users\sphillips\Desktop\Output\TestForDevOps.zip" #The absolute path to the solution file zip to be imported
																													#org2be3e7e3
$employeeDevConnectionString = "AuthType=Office365;UserName=Dynamics-Admin@firstkeyhomes.com;Password=Welcome2FKH!;URL=https://firstkeyhomesemployeedev.crm.dynamics.com" #The target CRM organization connection string
[int]$override = 1 #If set to 1 will override the solution even if a solution with same version exists
[int]$publishWorkflows = 1 #Will publish workflows during importget
[int]$overwriteUnmanagedCustomizations = 1 #Will overwrite unmanaged customizations
[int]$skipProductUpdateDependencies = 0 #Will skip product update dependencies
[int]$convertToManaged = 0 #Direct the system to convert any matching unmanaged customizations into your managed solution. Optional.
[int]$holdingSolution = 1
[string]$logsDirectory = "C:\Users\sphillips\Desktop\Output"


& "$scriptPath\Lib\xRMCIFramework\ImportSolution.ps1" -Verbose -solutionFile $solutionFile -crmConnectionString $employeeDevConnectionString -override $override -publishWorkflows $publishWorkflows -overwriteUnmanagedCustomizations $overwriteUnmanagedCustomizations -skipProductUpdateDependencies $skipProductUpdateDependencies -convertToManaged $convertToManaged -holdingSolution $holdingSolution -logsDirectory $logsDirectory

get-date

