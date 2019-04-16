[CmdletBinding()]

#Testing GITHook

param
(
	#Export Solution
	[string]$devConnectionString = "AuthType=Office365;UserName=Dynamics-Admin@firstkeyhomes.com;Password=Welcome2FKH!;URL=https://firstkeyhomesdev.crm.dynamics.com",
	[string]$solutionName = "BulkInvoicing",
	[string]$exportSolutionOutputPath = "C:\Users\sphillips\Desktop\Output"
)

Write-Verbose "devConnection = " 
Test-Connection org5b2169f3.crm.dynamics.com -Count 1 -Quiet -InformationAction Continue


$ErrorActionPreference = "Stop"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$VerbosePreference = "Continue"

Write-Verbose "Script Path: $scriptPath"
Write-Verbose "ConnectionString = $devConnectionString"

& "$scriptPath\Lib\xRMCIFramework\ExportSolution.ps1" -Verbose -CrmConnectionString $devConnectionString -SolutionName $solutionName -ExportSolutionOutputPath $exportSolutionOutputPath

Write-Verbose "devConnection = " 
Test-Connection org5b2169f3.crm.dynamics.com -Count 1 -Quiet -InformationAction Continue


