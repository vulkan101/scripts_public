title Build Test Debug Sample 64
call set_dotnet_env64.cmd
cd C:\xr_dev\dotnetFork\runtime
set project=.\src\mono\sample\wasm\browser-test-debug

.\dotnet.cmd build -bl /p:WasmEnableThreads=false /p:InvariantGlobalization=true /p:WasmEnableMemory64=true /p:TargetOS=browser /p:TargetArchitecture=wasm /p:Configuration=Debug /t:RunSample %project%