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
            Name = 'HTTP'
            Group = 'HTTP'
            Ensure = 'Present'
            Action = 'Allow'
            Enabled = 'True'
            Profile = 'Public'
            Direction = 'Inbound'
            Protocol = 'TCP'
            LocalPort = 80
        }
	}
}