Configuration webServer
{
	Import-DSCResource -ModuleName PSDesiredStateConfiguration, xNetworking
	
	Node $AllNodes.NodeName
	{
		WindowsFeature webServer
		{
			Ensure = 'Present'
			Name = 'Web-Server'
		}
		xFirewall HTTP
		{
            Name = 'HTTP'
            DisplayGroup = 'HTTP'
            Ensure = 'Present'
            Access = 'Allow'
            State = 'Enabled'
            Profile = 'Public'
            Direction = 'Inbound'
            Protocol = 'TCP'
            LocalPort = 80
        }
	}
}