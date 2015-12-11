Configuration webServer
{
	Import-DSCResource -ModuleName PSDesiredStateConfiguration
	
	Node $AllNodes.NodeName
	{
		WindowsFeature webServer
		Ensure = 'Present'
		Name = 'Web-Server'
	}
}