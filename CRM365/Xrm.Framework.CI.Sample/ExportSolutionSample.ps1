[CmdletBinding()]

#Testing GITHook

param
(
	[string]$connectionString = "URL=https://org5b2169f3.crm.dynamics.com; UserName=sphillips@firstkeyhomes.com; Password=Pokemonprs1221!; AuthType=Office365" #The connection string as per CRM Sdk
)

$ErrorActionPreference = "Stop"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$VerbosePreference = "Continue"

Write-Verbose "Script Path: $scriptPath"
Write-Verbose "ConnectionString = $connectionString"

& "$scriptPath\Lib\xRMCIFramework\ExportSolution.ps1" -Verbose -CrmConnectionString $connectionString -SolutionName "Announcements" -ExportSolutionOutputPath "C:\Users\sphillips\Desktop\Output"