%module JNI

%include <windows.i>
%include <typemaps.i>
%include <carrays.i>
%include <arrays_csharp.i>

%include "cs_struct.i"

%{
#include "win32/jni_md.h"
#include "jni.h"
%}

CSHARP_ARRAYS_FIXED(jlong, jlong)

%ignore JNINativeInterface_;
%ignore JNIInvokeInterface_;
%ignore JavaVMOption;
%ignore JavaVMInitArgs;
%ignore JavaVMAttachArgs;

%cs_struct(jboolean_p, System.IntPtr)
%cs_struct(jbyte_p, System.IntPtr)
%cs_struct(jchar_p, System.IntPtr)
%cs_struct(jshort_p, System.IntPtr)
%cs_struct(jint_p, System.IntPtr)
%cs_struct(jlong_p, System.IntPtr)
%cs_struct(jfloat_p, System.IntPtr)
%cs_struct(jdouble_p, System.IntPtr)

%cs_struct(c_jchar_p, System.IntPtr)
%cs_struct(void_p, System.IntPtr)

%cs_struct(jfieldID, System.IntPtr)
%cs_struct(jmethodID, System.IntPtr)

%csmethodmodifiers JNIEnv_::DefineClass "public unsafe";

%apply unsigned char FIXED[] {(const jboolean *buf), (jboolean *buf)}
%apply unsigned short FIXED[] {(const jchar *buf), (jchar *buf)}

%apply signed char FIXED[] {(const jbyte *buf), (jbyte *buf)}
%apply short FIXED[] {(const jshort *buf), (jshort *buf)}
%apply long FIXED[] {(const jint *buf), (jint *buf)}
%apply jlong FIXED[] {(const jlong *buf), (jlong *buf)}
%apply float FIXED[] {(const jfloat *buf), (jfloat *buf)}
%apply double FIXED[] {(const jdouble *buf), (jdouble *buf)}

typedef struct {
} va_list;

%rename(VaList) va_list;

%array_class(jboolean, jboolean_ARRAY);
%array_class(jchar, jchar_ARRAY);

%array_class(jbyte, jbyte_ARRAY);
%array_class(jshort, jshort_ARRAY);
%array_class(jint, jint_ARRAY);
%array_class(jlong, jlong_ARRAY);
%array_class(jfloat, jfloat_ARRAY);
%array_class(jdouble, jdouble_ARRAY);

%typemap(cscode) SWIGTYPE %{
  public void FUN() { }
%}

//%typemap(argout) JavaVM **pvm {
//  %append_output(SWIG_NewPointerObj(%as_voidptr(*$1), $*1_descriptor, SWIG_POINTER_OWN));
//}

%ignore JavaVM_::functions;
%ignore JNIEnv_::functions;

%ignore JNI_CreateJavaVM;
%ignore JNI_GetCreatedJavaVMs;
%ignore JNIEnv_::GetJavaVM;

%rename(JClass) _jclass;

%rename(JObject) _jobject;
%rename(JArray) _jarray;
%rename(JString) _jstring;
%rename(JThrowable) _jthrowable;

%rename(JObjectArray) _jobjectArray;
%rename(JBooleanArray) _jbooleanArray;
%rename(JCharArray) _jcharArray;
%rename(JByteArray) _jbyteArray;
%rename(JShortArray) _jshortArray;
%rename(JIntArray) _jintArray;
%rename(JLongArray) _jlongArray;
%rename(JFloatArray) _jfloatArray;
%rename(JDoubleArray) _jdoubleArray;

%rename(JObjectRefType) jobjectRefType;
%rename(JValue) jvalue;

%rename(JNIEnv) JNIEnv_;
%rename(JavaVM) JavaVM_;

%inline %{
jboolean GetValue(jboolean *elems, jint index) { return elems[index]; }
void SetValue(jboolean *elems, jint index, jboolean value) { elems[index] = value; }
%}

%include "win32/jni_md.h"
%include "jni.h"
