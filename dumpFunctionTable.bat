C:\emsdk\upstream\bin\wasm-dis C:\xr_dev\dotnetFork\runtime\src\mono\sample\wasm\browser\bin\Debug\AppBundle\_framework\dotnet.native.wasm -o dotnet.native.wast
python3 C:\xr_Dev\scripts\printWasmFunctionTable.py dotnet.native.wast > dotnet.native.wast.functionTable.txt

