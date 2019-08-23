// Renames to get better names
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

// Extrends JNIEnv_ with better alternatives to the ignored methods (JNIEnv_ and JNI_)
%extend _jobject {
  public:
    _jclass* toJClass() { return (_jclass*)($self); }
    _jthrowable* toJThrowable() { return (_jthrowable*)($self); }
    _jstring* toJString() { return (_jstring*)($self); }
    _jarray* toJArray() { return (_jarray*)($self); }
    _jbooleanArray* toJBooleanArray() { return (_jbooleanArray*)($self); }
    _jbyteArray* toJByteArray() { return (_jbyteArray*)($self); }
    _jcharArray* toJCharArray() { return (_jcharArray*)($self); }
    _jshortArray* toJShortArray() { return (_jshortArray*)($self); }
    _jintArray* toJIntArray() { return (_jintArray*)($self); }
    _jlongArray* toJLongArray() { return (_jlongArray*)($self); }
    _jfloatArray* toJFloatArray() { return (_jfloatArray*)($self); }
    _jdoubleArray* toJDoubleArray() { return (_jdoubleArray*)($self); }
    _jobjectArray* toJObjectArray() { return (_jobjectArray*)($self); }

    jboolean isJClass() { return (_jclass*)($self) != NULL; }
    jboolean isJThrowable() { return (_jthrowable*)($self) != NULL; }
    jboolean isJString() { return (_jstring*)($self) != NULL; }
    jboolean isJArray() { return (_jarray*)($self) != NULL; }
    jboolean isJBooleanArray() { return (_jbooleanArray*)($self) != NULL; }
    jboolean isJByteArray() { return (_jbyteArray*)($self) != NULL; }
    jboolean isJCharArray() { return (_jcharArray*)($self) != NULL; }
    jboolean isJShortArray() { return (_jshortArray*)($self) != NULL; }
    jboolean isJIntArray() { return (_jintArray*)($self) != NULL; }
    jboolean isJLongArray() { return (_jlongArray*)($self) != NULL; }
    jboolean isJFloatArray() { return (_jfloatArray*)($self) != NULL; }
    jboolean isJDoubleArray() { return (_jdoubleArray*)($self) != NULL; }
    jboolean isJObjectArray() { return (_jobjectArray*)($self) != NULL; }
}

%typemap(cscode) _jobject %{
  public bool isNull() {
    return swigCPtr.Handle == System.IntPtr.Zero;
  }
%}

