Configuration webServer
{
param(
	[Parameter(Mandatory=$true)]
	[string]$WorkspaceID,
	[Parameter(Mandatory=$true)]
	[string]$WorkspaceKey
)
	Import-DSCResource -ModuleName PSDesiredStateConfiguration, xNetworking, cMMAgent
	
	Node localhost
	{
		WindowsFeature webServer
		{
			Ensure = 'Present'
			Name = 'Web-Server'
		}
		xFirewall HTTP
		{
			Name = 'WebServer-HTTP-In-TCP'
			Group = 'Web Server'
			Ensure = 'Present'
			Action = 'Allow'
			Enabled = 'True'
			Profile = 'Any'
			Direction = 'Inbound'
			Protocol = 'TCP'
			LocalPort = 80
			DependsOn = '[WindowsFeature]webServer'
		}
		cMMAgentInstall MMASetup
		{
			Path = 'http://go.microsoft.com/fwlink/?LinkID=517476'
			Ensure = 'Present'
			WorkspaceID = $WorkspaceID
			WorkspaceKey = $WorkspaceKey
		}
	}
}