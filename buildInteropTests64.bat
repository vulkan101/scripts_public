title Build Interop Tests 64
call set_dotnet_env64.cmd
call setNewPathDotNet10.bat
call set_portable_dotnet64.bat
set RUNTIME_ROOT=C:\xr_dev\dotnetFork\runtime
cd %RUNTIME_ROOT%
.\dotnet.cmd build -bl %RUNTIME_ROOT%\src\libraries\System.Runtime.InteropServices.JavaScript\tests\System.Runtime.InteropServices.JavaScript.UnitTests\System.Runtime.InteropServices.JavaScript.Tests.csproj /p:InvariantGlobalization=true /p:TargetOS=browser /p:TargetArchitecture=wasm /p:Scenario=WasmTestOnChrome /p:EmccExtraCFlags=-sUSE_CLOSURE_COMPILER=1 /p:EmccExtraLDFlags=-sUSE_CLOSURE_COMPILER=1