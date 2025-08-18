title Build AspNetCore 64
:: NOTE currently just building the components
@echo off
set "COREROOT=C:\xr_dev\AspNetCore64"
cd %COREROOT%
:: Require a flag for restore
if "%~1"=="--restore" (
    echo Running restore...
    call ./restore.cmd
	:: make restore a separate step
	exit 
	) else (
    echo Skipping restore. Pass --restore to run it.
)
if "%~1"=="--all" (
    echo Building All...
    call .\eng\build.cmd -all -pack -arch x64
	call .\eng\build.cmd -bl -projects src\Components\**\*.*proj -pack -arch x64
) else if "%~1"=="--clean" (
    echo Cleaning....
	rmdir /s /q artifacts
) else (    
	call .\eng\build.cmd -bl -projects src\Components\**\*.*proj -pack -arch x64
)

