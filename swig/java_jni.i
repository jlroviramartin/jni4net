%module JNI

%include <windows.i>
%include <typemaps.i>
%include <cpointer.i>
%include <carrays.i>
%include <arrays_csharp.i>

%include <cs_struct.i>
%include <mapping_jboolean.i>
%include <mapping_jchar.i>

%{
#include "win32/jni_md.h"
#include "jni.h"
%}

typedef struct {
} va_list;

%rename(VaList) va_list;

%include <common.i>
%include <JavaVMInitArgs.i>
%include <JNIEnv.i>
%include <JavaVM.i>

// Include the main files
%include "win32/jni_md.h"
%include "jni.h"
