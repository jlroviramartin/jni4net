@echo off
setlocal

set PATH=C:\Aplicaciones\Desarrollo\swigwin\4.0.1;%PATH%
set JNI_PATH=C:\Program Files\Java\jdk-1.8\include

mkdir Jni4Csharp\Generated\
mkdir Jni4CsharpDll\win\
rem swig.exe -verbose -help
swig.exe -verbose -csharp -c++ -dllimport Jni4CsharpDll -I"\swig" -I"\swig\win32" -v -namespace es.jni -outdir Jni4Csharp\Generated\ -o Jni4CsharpDll\win\jni4net.cxx -oh Jni4CsharpDll\win\jni4net.h swig\java_jni.i

endlocal
