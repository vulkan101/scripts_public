title Publish Demo 64
call set_dotnet_env64.cmd
call setNewPathDotNet10.bat
call set_portable_dotnet64.bat
cd C:\xr_dev\x64Demo\Wasm64Demo\WebViewer
where dotnet

if "%~1"=="--clean" (
    echo Cleaning...
    dotnet clean
	rmdir /s /q builds
	set "NUGET_DIR=C:\Users\mike.hudson\.nuget\packages"

	echo Deleting microsoft.aspnetcore.* packages from %NUGET_DIR% ...

	for /d %%D in ("%NUGET_DIR%\microsoft.aspnetcore.*") do (
		echo Deleting folder: %%D
		rmdir /s /q "%%D"
	)
	
) else if "%~1"=="--build" (
    echo Building...
    dotnet build -c Debug -bl ^
        /p:WasmEnableThreads=false ^
        /p:WasmEnableMemory64=true ^
        /p:WasmCachePath=C:\xr_dev\cache ^
        /p:EmscriptenPythonToolsPath=C:\emsdk\python\3.9.2-nuget_64bit\ ^
        /p:EmscriptenNodeToolsPath=C:\emsdk\node\20.18.0_64bit\bin\ ^
        /p:EmscriptenCacheSdkCacheDir=C:\xr_dev\cache_sdk ^
        /p:EmscriptenCacheSdkToolsPath=C:\emsdk\upstream\emscripten\tools ^
        /p:EmscriptenUpstreamBinPath=C:\emsdk\upstream\emscripten
) else (
    echo Publishing...
    dotnet publish -c Debug -bl ^
        /p:WasmEnableThreads=false ^
        /p:WasmEnableMemory64=true ^
        /p:WasmCachePath=C:\xr_dev\cache ^
        /p:EmscriptenPythonToolsPath=C:\emsdk\python\3.9.2-nuget_64bit\ ^
        /p:EmscriptenNodeToolsPath=C:\emsdk\node\20.18.0_64bit\bin\ ^
        /p:EmscriptenCacheSdkCacheDir=C:\xr_dev\cache_sdk ^
        /p:EmscriptenCacheSdkToolsPath=C:\emsdk\upstream\emscripten\tools ^
        /p:EmscriptenUpstreamBinPath=C:\emsdk\upstream\emscripten
)
