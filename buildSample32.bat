title Build Sample In-Tree 32
call set_dotnet_env32.cmd
cd C:\xr_dev\dotnetFork32\runtime
.\dotnet.cmd build -bl /p:WasmEnableThreads=false /p:WasmEnableMemory64=true /p:TargetOS=browser /p:TargetArchitecture=wasm /p:Configuration=Debug /t:RunSample .\src\mono\sample\wasm\browser