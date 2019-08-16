@echo off
setlocal

set PATH=C:\Aplicaciones\Desarrollo\swigwin\4.0.0;%PATH%
set JNI_PATH=C:\Program Files\Java\jdk-1.8\include

mkdir output
swig.exe -verbose -csharp -c++ -I"\win32" -v -outdir output\ java_jni.i

endlocal
