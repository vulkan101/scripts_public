title Build Sample In-Tree 64
::call cleanAdvancedSample64.bat
call set_dotnet_env64.cmd
cd C:\xr_dev\dotnetFork\runtime
.\dotnet.cmd build -bl /p:WasmEnableThreads=false /p:WasmEnableMemory64=true /p:TargetOS=browser /p:TargetArchitecture=wasm /p:Configuration=Debug /t:RunSample .\src\mono\sample\wasm\browser-advanced