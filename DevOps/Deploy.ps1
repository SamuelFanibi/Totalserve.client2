$sourcePath = $Env:SourcePath

Write-Host "Deploying web application using MSDeploy..."
# Import the Web Deploy module

Import-Module WebAdministration

& "C:\Program Files\IIS\Microsoft Web Deploy V3\msdeploy.exe" -verb:sync -EnableRule:DoNotDelete -source:contentPath=$sourcePath -dest:contentPath=$Env:SiteName,computerName=$Env:ServiceUrl,userName=$Env:UserName,password=$Env:Password,authtype='Basic',includeAcls='False' -allowUntrusted -disableLink:AppPoolExtension -disableLink:ContentExtension -disableLink:CertificateExtension -verbose

Write-Host "Deployment completed."