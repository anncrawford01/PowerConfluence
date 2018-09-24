Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \..\PowerConfluence.psm1) -Force
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \..\helpers\IntegrationServicesConfluenceHelper.psm1) -Force
Import-Module .\Credentials.psm1 -Force

#######################################################
#                                                     #
#    DEMOS OF INTEGRATIONSERVICESCONFLUENCEHELPER     #
#                                                     #
#######################################################

$ConfluenceConnection = Get-ConfluenceConnection -UserName $Credentials.UserName -ApiToken $Credentials.ApiToken -HostName $Credentials.HostName
$SqlAgentServerDev = $Credentials.SqlAgentServerDev
$spaceKey = "DST"


########################################################
#      PUBLISH PACKAGE PROFILE PAGE                       #
########################################################


$catalog = (Get-IntegrationServicesCatalog -ServerName $SqlAgentServerDev)
$foldername = "Ucsb.Sa.DataManagement.IntegrationServices"
$projectname = "Ucsb.Sa.DataManagement.IntegrationServices.FinAid"
$ssisFolder = $catalog.Folders.Item($foldername)

$ssisProject = $ssisFolder.Projects.Item($projectname)


# Loop trough all Packages in the Project
  foreach ($p in $ssisProject.Packages) { 
   
      $package = $catalog.Folders[$foldername].Projects[$projectname].Packages[$p.Name]

      Publish-IntegrationServicesPackageConfluencePage -ConfluenceConnection $ConfluenceConnection -SpaceKey $spaceKey -Package $package -Catalog $catalog
 }

########################################################
#      TOP 100 RECENT EXECUTIONS MANIFEST              #
########################################################

<#
$catalog = (Get-IntegrationServicesCatalog -ServerName $SqlAgentServerDev)
$executions = Get-IntegrationServicesRecentExecutions -Executions $catalog.Executions -Count 100
Publish-IntegrationServicesExecutionManifestConfluencePage -ConfluenceConnection $ConfluenceConnection -SpaceKey $spaceKey -Title "Integration Services - 100 Most Recent Executions" -Executions $executions
#>

########################################################
#      OLD JUNK                                        #
########################################################

# Get-SsisPackageList -ServerName $SqlAgentServerDev -FolderName "Ucsb.Sa.DataManagement.IntegrationService" -ProjectName "Ucsb.Sa.DataManagement.IntegrationServices.GradDiv" | Format-Table -Property PackageId,NameSqlAgentServerDev