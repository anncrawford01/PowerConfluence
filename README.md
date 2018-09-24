# PowerConfluence
This code was developed by Justin Mead to create a confluence documentation.
The code was updated by Ann Crawford to allow documenting all packages in a give project.  

Before executing the code you must create a credentials.ps1 file with valid values. The Credentials.ps1 must be saved in the root directory for power shell execution. See the path specified at the PS prmompt PS C:\Users\crawford-a>

See references to generate a valid api key. 

Here is an example of credential valuesfor the data services team site DST:
    SqlAgentServerDev="app1.sa.ucsb.edu,2433"
    UserName= lastname-firstintial@sa.ucsb.edu"
    ApiToken="hjasdfhjkhdajkfhjkhjkfdahjk"
    HostName="https://ucsb-sist.atlassian.net/wiki/spaces/DST"

To generate documentation for SSIS package.
 1. Edit Credentials.Template and save as Credentials.ps1.
 2. Edit \Data\JustinsSSISCode\PowerConfluence\demos\IntegrationServicesConfluenceHelperDemo.ps1 and set the project name $projectname = "Ucsb.Sa.DataManagement.IntegrationServices.FinAid"
 3. Execute \Data\JustinsSSISCode\PowerConfluence\demos\IntegrationServicesConfluenceHelperDemo.ps
The page will be have the title of the pacakge.

# References

## link to ssis views and stored procuedures 
(https://blogs.msdn.microsoft.com/mattm/2011/08/12/ssis-t-sql-api-overview/)
## Jira REST APIs
(https://developer.atlassian.com/cloud/jira/platform/rest/v3/)
## SSIS Power Shell examples
(https://blogs.msdn.microsoft.com/dataaccesstechnologies/2013/10/07/ssis-2012-automation-part-2-create-environment-map-it-to-project-and-package-level-parameters-and-assign-reference-to-project/)
## How to create an api token in Atlassian
(https://confluence.atlassian.com/cloud/api-tokens-938839638.html)

