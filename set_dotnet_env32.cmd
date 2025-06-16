echo *** .NET EMSDK path setup ***
set EM_CONFIG=C:/emsdk/emscripten.config
set EMSDK_INSTALL_ROOT=C:\emsdk
set EMSDK_PATH=%EMSDK_INSTALL_ROOT%\upstream\
set DOTNET_EMSCRIPTEN_LLVM_ROOT=%EMSDK_INSTALL_ROOT%\upstream\bin
set DOTNET_EMSCRIPTEN_NODE_JS=%EMSDK_INSTALL_ROOT%\node\20.18.0_64bit\bin
set DOTNET_EMSCRIPTEN_BINARYEN_ROOT=%EMSDK_INSTALL_ROOT%\upstream
set DOTNET_EMSCRIPTEN_NODE_PATH=%EMSDK_INSTALL_ROOT%\node\20.18.0_64bit\bin
set BINARYEN_ROOT=%DOTNET_EMSCRIPTEN_BINARYEN_ROOT%
set EMSDK_PYTHON=%EMSDK_INSTALL_ROOT%\python\3.9.2-nuget_64bit\python.exe
set EMSDK_NODE=%EMSDK_INSTALL_ROOT%\node\20.18.0_64bit\bin
set WasmEnableMemory64=False
set WasmCachePath=C:\xr_dev\cache32
:: these two are required for building wasm samples
set EmscriptenNodeToolsPath=C:\emsdk\node\20.18.0_64bit\bin\
set EmscriptenPythonToolsPath=C:\emsdk\python\3.9.2-nuget_64bit\