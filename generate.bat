@echo off
setlocal

set PATH=C:\Aplicaciones\Desarrollo\swigwin\4.0.0;%PATH%
set JNI_PATH=C:\Program Files\Java\jdk-1.8\include

mkdir Jni\Generated\
mkdir Jni\win64\
swig.exe -verbose -help
swig.exe -verbose -csharp -c++ -I"\swig" -I"\swig\win32" -v -outdir Jni\Generated\ -o Jni\win64\jni4net.cxx -oh Jni\win64\jni4net.h swig\java_jni.i

endlocal
