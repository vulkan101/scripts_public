title Build Runtime 32
call set_dotnet_env32.cmd
cd C:\xr_dev\dotnetFork32\runtime
which dotnet && build -bl /p:WasmEnableThreads=false /p:WasmEnableMemory64=false /p:WasmDebugLevel=0 -warnaserror 0 -os browser -subset mono+libs /p:WasmCachePath=C:\xr_dev\cache /p:EmscriptenPythonToolsPath=C:\emsdk\python\3.9.2-nuget_64bit\ /p:EmscriptenNodeToolsPath=C:\emsdk\node\20.18.0_64bit\bin\ /p:EmscriptenCacheSdkCacheDir=C:\xr_dev\cache_sdk  /p:EmscriptenCacheSdkToolsPath=C:\emsdk\upstream\emscripten\tools