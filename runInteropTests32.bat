title Run Tests 32
call set_dotnet_env32.cmd
call setNewPathDotNet10.bat
call set_portable_dotnet32.bat
set RUNTIME_ROOT=C:\xr_dev\dotnetFork32\runtime
cd %RUNTIME_ROOT%
.\dotnet.cmd build -bl %RUNTIME_ROOT%\src\libraries\System.Runtime.InteropServices.JavaScript\tests\System.Runtime.InteropServices.JavaScript.UnitTests\System.Runtime.InteropServices.JavaScript.Tests.csproj /t:Test /p:TargetOS=browser /p:TargetArchitecture=wasm /p:Scenario=WasmTestOnChrome /p:EmccExtraCFlags=-sUSE_CLOSURE_COMPILER=1 /p:EmccExtraLDFlags=-sUSE_CLOSURE_COMPILER=1