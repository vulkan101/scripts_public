title Build Demo
call set_dotnet_env64.cmd
call setNewPathDotNet10.bat
call set_portable_dotnet64.bat
cd C:\xr_dev\Wasm64Demo\WebViewer
which dotnet && dotnet build -bl /p:WasmEnableThreads=false /p:WasmEnableMemory64=true /p:WasmCachePath=C:\xr_dev\cache /p:EmscriptenPythonToolsPath=C:\emsdk\python\3.9.2-nuget_64bit\ /p:EmscriptenNodeToolsPath=C:\emsdk\node\20.18.0_64bit\bin\ /p:EmscriptenCacheSdkCacheDir=C:\xr_dev\cache_sdk  /p:EmscriptenCacheSdkToolsPath=C:\emsdk\upstream\emscripten\tools /p:EmscriptenUpstreamBinPath=C:\emsdk\upstream\emscripten