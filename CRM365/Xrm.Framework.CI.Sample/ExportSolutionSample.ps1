[CmdletBinding()]

#Testing GITHook

param
(
	[string]$connectionString = "AuthType=Office365;UserName=Dynamics-Admin@firstkeyhomes.com;Password=Welcome2FKH!;URL=https://org5b2169f3.crm.dynamics.com",
	[string]$solutionName = "Announcements",
	[string]$exportSolutionOutputPath = "C:\Users\sphillips\Desktop\Output"
)

$ErrorActionPreference = "Stop"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$VerbosePreference = "Continue"

Write-Verbose "Script Path: $scriptPath"
Write-Verbose "ConnectionString = $connectionString"

& "$scriptPath\Lib\xRMCIFramework\ExportSolution.ps1" -Verbose -CrmConnectionString $connectionString -SolutionName $solutionName -ExportSolutionOutputPath $exportSolutionOutputPath	