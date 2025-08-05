title Build Tests 64
call set_dotnet_env64.cmd
call setNewPathDotNet10.bat
set RUNTIME_ROOT=C:\xr_dev\dotnetFork3runtime
cd %RUNTIME_ROOT%
which dotnet && build -bl -os browser -subset libs.tests -warnaserror 0 /p:WasmRunWasmOpt=false /p:WasmDebugLevel=0 /p:WasmEnableThreads=false /p:WasmEnableMemory64=true   /p:Configuration=Debug /p:WasmCachePath=C:\xr_dev\cache /p:EmscriptenPythonToolsPath=C:\emsdk\python\3.9.2-nuget_64bit\ /p:InvariantGlobalization=true /p:EmscriptenNodeToolsPath=C:\emsdk\node\20.18.0_64bit\bin\ /p:EmscriptenCacheSdkCacheDir=C:\xr_dev\cache_sdk  /p:EmscriptenCacheSdkToolsPath=C:\emsdk\upstream\emscripten\tools /p:EmccExtraCFlags=-sUSE_CLOSURE_COMPILER=1 /p:EmccExtraLDFlags=-sUSE_CLOSURE_COMPILER=1