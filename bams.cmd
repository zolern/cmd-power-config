@setlocal

@if [%BAMS_KEY%] == [] goto :notsetbams

@if [%1] == [] goto :notset

@curl -H "X-JFrog-Art-Api:%BAMS_KEY%" -X PUT -T "%~1" "https://bams-aws.refinitiv.com/artifactory/default.npm.cloud/office-platform/analytics-libraries/%~1"
@goto :eof

:notset
@echo.
@echo bams ^<package-name.tgz^>
@echo.
@goto :eof

:notsetbams
@echo.
@echo Please set BAMS_KEY to your BAMS security key
@echo.
@goto :eof
