Configuration webServer
{
	Import-DSCResource -ModuleName PSDesiredStateConfiguration, xNetworking
	
	Node localhost
	{
		WindowsFeature webServer
		{
			Ensure = 'Present'
			Name = 'Web-Server'
		}
		xFirewall HTTP
		{
			Name = 'IIS-WebServerRole-HTTP-In-TCP'
			Group = 'World Wide Web Services (HTTP)'
			Ensure = 'Present'
			Action = 'Allow'
			Enabled = 'True'
			Profile = 'Any'
			Direction = 'Inbound'
			Protocol = 'TCP'
			LocalPort = 80
		}
	}
}