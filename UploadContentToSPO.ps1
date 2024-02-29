
$cred = (Get-Credential admin@YOUR_DOMAIN.onmicrosoft.com)
$sourceFiles = '\\FILE_SHARE\migration'
$sourcePackage = 'c:\migration\source'
$targetPackage = 'c:\migration\target'
$targetWeb = 'https://mngenvmcap648104.sharepoint.com/sites/Migration'
$targetDocLib = 'Test'

New-SPOMigrationPackage -SourceFilesPath $sourceFiles -OutputPackagePath $sourcePackage -TargetWebUrl $targetWeb -TargetDocumentLibraryPath $targetDocLib -NoAzureADLookup

ConvertTo-SPOMigrationTargetedPackage -ParallelImport -SourceFilesPath $sourceFiles -SourcePackagePath $sourcePackage -OutputPackagePath $targetPackage -Credentials $cred -TargetWebUrl $targetWeb -TargetDocumentLibraryPath $targetDocLib -NoAzureADLookup

$job = Invoke-SPOMigrationEncryptUploadSubmit -SourceFilesPath $sourceFiles -SourcePackagePath $targetPackage -Credentials $cred -TargetWebUrl $targetWeb
