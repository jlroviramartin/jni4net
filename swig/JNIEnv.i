%rename(JNIEnv) JNIEnv_;

%ignore JNINativeInterface_;

%typemap(csclassmodifiers) JNIEnv_ "public unsafe class"

// Cleans default bool mapping to prevent some mapping errors..
%clear bool FIXED[];
%clear char FIXED[]; // ?

// .. and adds 2 new mappings: bool and char
CSHARP_ARRAYS_FIXED(unsigned char, bool)
CSHARP_ARRAYS_FIXED(unsigned short, char)

// Creates some mappings for arrays
%apply unsigned char FIXED[]  {(const jboolean *buf), (jboolean *buf)}; // bool
%apply unsigned short FIXED[] {(const jchar *buf), (jchar *buf), (const jchar *unicode)}; // char
%apply signed char FIXED[]    {(const jbyte *buf), (jbyte *buf)}; // sbyte
%apply short FIXED[]          {(const jshort *buf), (jshort *buf)}; // short
%apply long FIXED[]           {(const jint *buf), (jint *buf)}; // int
%apply long long FIXED[]      {(const jlong *buf), (jlong *buf)}; // long
%apply float FIXED[]          {(const jfloat *buf), (jfloat *buf)}; // float
%apply double FIXED[]         {(const jdouble *buf), (jdouble *buf)}; // buffer

// Creates some mappings for inout values
%apply bool& INOUT {(jboolean* isCopy)}; // bool&

// Maps method arguments

// const jvalue *args
CSHARP_ARRAYS(jvalue, JValue)
%apply jvalue INPUT[]  { const jvalue *args }

%ignore JNIEnv_::NewObject;
%ignore JNIEnv_::CallObjectMethod;
%ignore JNIEnv_::CallBooleanMethod;
%ignore JNIEnv_::CallByteMethod;
%ignore JNIEnv_::CallCharMethod;
%ignore JNIEnv_::CallShortMethod;
%ignore JNIEnv_::CallIntMethod;
%ignore JNIEnv_::CallLongMethod;
%ignore JNIEnv_::CallFloatMethod;
%ignore JNIEnv_::CallDoubleMethod;
%ignore JNIEnv_::CallVoidMethod;
%ignore JNIEnv_::CallNonvirtualObjectMethod;
%ignore JNIEnv_::CallNonvirtualBooleanMethod;
%ignore JNIEnv_::CallNonvirtualByteMethod;
%ignore JNIEnv_::CallNonvirtualCharMethod;
%ignore JNIEnv_::CallNonvirtualShortMethod;
%ignore JNIEnv_::CallNonvirtualIntMethod;
%ignore JNIEnv_::CallNonvirtualLongMethod;
%ignore JNIEnv_::CallNonvirtualFloatMethod;
%ignore JNIEnv_::CallNonvirtualDoubleMethod;
%ignore JNIEnv_::CallNonvirtualVoidMethod;
%ignore JNIEnv_::CallStaticObjectMethod;
%ignore JNIEnv_::CallStaticBooleanMethod;
%ignore JNIEnv_::CallStaticByteMethod;
%ignore JNIEnv_::CallStaticCharMethod;
%ignore JNIEnv_::CallStaticShortMethod;
%ignore JNIEnv_::CallStaticIntMethod;
%ignore JNIEnv_::CallStaticLongMethod;
%ignore JNIEnv_::CallStaticFloatMethod;
%ignore JNIEnv_::CallStaticDoubleMethod;
%ignore JNIEnv_::CallStaticVoidMethod;

%ignore JNIEnv_::NewObjectV;
%ignore JNIEnv_::CallObjectMethodV;
%ignore JNIEnv_::CallBooleanMethodV;
%ignore JNIEnv_::CallByteMethodV;
%ignore JNIEnv_::CallCharMethodV;
%ignore JNIEnv_::CallShortMethodV;
%ignore JNIEnv_::CallIntMethodV;
%ignore JNIEnv_::CallLongMethodV;
%ignore JNIEnv_::CallFloatMethodV;
%ignore JNIEnv_::CallDoubleMethodV;
%ignore JNIEnv_::CallVoidMethodV;
%ignore JNIEnv_::CallNonvirtualObjectMethodV;
%ignore JNIEnv_::CallNonvirtualBooleanMethodV;
%ignore JNIEnv_::CallNonvirtualByteMethodV;
%ignore JNIEnv_::CallNonvirtualCharMethodV;
%ignore JNIEnv_::CallNonvirtualShortMethodV;
%ignore JNIEnv_::CallNonvirtualIntMethodV;
%ignore JNIEnv_::CallNonvirtualLongMethodV;
%ignore JNIEnv_::CallNonvirtualFloatMethodV;
%ignore JNIEnv_::CallNonvirtualDoubleMethodV;
%ignore JNIEnv_::CallNonvirtualVoidMethodV;
%ignore JNIEnv_::CallStaticObjectMethodV;
%ignore JNIEnv_::CallStaticBooleanMethodV;
%ignore JNIEnv_::CallStaticByteMethodV;
%ignore JNIEnv_::CallStaticCharMethodV;
%ignore JNIEnv_::CallStaticShortMethodV;
%ignore JNIEnv_::CallStaticIntMethodV;
%ignore JNIEnv_::CallStaticLongMethodV;
%ignore JNIEnv_::CallStaticFloatMethodV;
%ignore JNIEnv_::CallStaticDoubleMethodV;
%ignore JNIEnv_::CallStaticVoidMethodV;

%rename(NewObject) JNIEnv_::NewObjectA;
%rename(CallObjectMethod) JNIEnv_::CallObjectMethodA;
%rename(CallBooleanMethod) JNIEnv_::CallBooleanMethodA;
%rename(CallByteMethod) JNIEnv_::CallByteMethodA;
%rename(CallCharMethod) JNIEnv_::CallCharMethodA;
%rename(CallShortMethod) JNIEnv_::CallShortMethodA;
%rename(CallIntMethod) JNIEnv_::CallIntMethodA;
%rename(CallLongMethod) JNIEnv_::CallLongMethodA;
%rename(CallFloatMethod) JNIEnv_::CallFloatMethodA;
%rename(CallDoubleMethod) JNIEnv_::CallDoubleMethodA;
%rename(CallVoidMethod) JNIEnv_::CallVoidMethodA;
%rename(CallNonvirtualObjectMethod) JNIEnv_::CallNonvirtualObjectMethodA;
%rename(CallNonvirtualBooleanMethod) JNIEnv_::CallNonvirtualBooleanMethodA;
%rename(CallNonvirtualByteMethod) JNIEnv_::CallNonvirtualByteMethodA;
%rename(CallNonvirtualCharMethod) JNIEnv_::CallNonvirtualCharMethodA;
%rename(CallNonvirtualShortMethod) JNIEnv_::CallNonvirtualShortMethodA;
%rename(CallNonvirtualIntMethod) JNIEnv_::CallNonvirtualIntMethodA;
%rename(CallNonvirtualLongMethod) JNIEnv_::CallNonvirtualLongMethodA;
%rename(CallNonvirtualFloatMethod) JNIEnv_::CallNonvirtualFloatMethodA;
%rename(CallNonvirtualDoubleMethod) JNIEnv_::CallNonvirtualDoubleMethodA;
%rename(CallNonvirtualVoidMethod) JNIEnv_::CallNonvirtualVoidMethodA;
%rename(CallStaticObjectMethod) JNIEnv_::CallStaticObjectMethodA;
%rename(CallStaticBooleanMethod) JNIEnv_::CallStaticBooleanMethodA;
%rename(CallStaticByteMethod) JNIEnv_::CallStaticByteMethodA;
%rename(CallStaticCharMethod) JNIEnv_::CallStaticCharMethodA;
%rename(CallStaticShortMethod) JNIEnv_::CallStaticShortMethodA;
%rename(CallStaticIntMethod) JNIEnv_::CallStaticIntMethodA;
%rename(CallStaticLongMethod) JNIEnv_::CallStaticLongMethodA;
%rename(CallStaticFloatMethod) JNIEnv_::CallStaticFloatMethodA;
%rename(CallStaticDoubleMethod) JNIEnv_::CallStaticDoubleMethodA;
%rename(CallStaticVoidMethod) JNIEnv_::CallStaticVoidMethodA;

// Ignores properties and some methods of JNIEnv_
%ignore JNIEnv_::functions;
%ignore JNIEnv_::GetBooleanArrayElements;
%ignore JNIEnv_::GetByteArrayElements;
%ignore JNIEnv_::GetCharArrayElements;
%ignore JNIEnv_::GetShortArrayElements;
%ignore JNIEnv_::GetIntArrayElements;
%ignore JNIEnv_::GetLongArrayElements;
%ignore JNIEnv_::GetFloatArrayElements;
%ignore JNIEnv_::GetDoubleArrayElements;
%ignore JNIEnv_::ReleaseBooleanArrayElements;
%ignore JNIEnv_::ReleaseByteArrayElements;
%ignore JNIEnv_::ReleaseCharArrayElements;
%ignore JNIEnv_::ReleaseShortArrayElements;
%ignore JNIEnv_::ReleaseIntArrayElements;
%ignore JNIEnv_::ReleaseLongArrayElements;
%ignore JNIEnv_::ReleaseFloatArrayElements;
%ignore JNIEnv_::ReleaseDoubleArrayElements;
%ignore JNIEnv_::GetJavaVM;

// Temporary ignores some methods.
%ignore JNIEnv_::GetStringChars;
%ignore JNIEnv_::ReleaseStringChars;
%ignore JNIEnv_::GetPrimitiveArrayCritical;
%ignore JNIEnv_::ReleasePrimitiveArrayCritical;
%ignore JNIEnv_::GetStringCritical;
%ignore JNIEnv_::ReleaseStringCritical;
%ignore JNIEnv_::NewDirectByteBuffer;
%ignore JNIEnv_::GetDirectBufferAddress;

// Ignores some methods of JNI_
%ignore JNI_OnLoad;
%ignore JNI_OnUnload;
%ignore JNI_GetDefaultJavaVMInitArgs;
%ignore JNI_CreateJavaVM;
%ignore JNI_GetCreatedJavaVMs;

// Maps some types to IntPtr
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

%rename(JObjectRefType) jobjectRefType;
%rename(JValue) jvalue;

%rename(JFieldID) jfieldID;
%rename(JMethodID) jmethodID;

typedef struct {
} jfieldID;

typedef struct {
} jmethodID;

// Extrends JNIEnv_ with better alternatives to the ignored methods (JNIEnv_ and JNI_)
%extend JNIEnv_ {

    PrimitiveArray_jboolean* GetBooleanArrayElements_2(jbooleanArray array, jboolean *isCopy) {
      return PrimitiveArray_jboolean::create($self->GetBooleanArrayElements(array,isCopy));
    }
    PrimitiveArray_jchar* GetCharArrayElements_2(jcharArray array, jboolean *isCopy) {
        return PrimitiveArray_jchar::create($self->GetCharArrayElements(array,isCopy));
    }
    PrimitiveArray_jbyte* GetByteArrayElements_2(jbyteArray array, jboolean *isCopy) {
        return PrimitiveArray_jbyte::create($self->GetByteArrayElements(array,isCopy));
    }
    PrimitiveArray_jshort* GetShortArrayElements_2(jshortArray array, jboolean *isCopy) {
        return PrimitiveArray_jshort::create($self->GetShortArrayElements(array,isCopy));
    }
    PrimitiveArray_jint* GetIntArrayElements_2(jintArray array, jboolean *isCopy) {
        return PrimitiveArray_jint::create($self->GetIntArrayElements(array,isCopy));
    }
    PrimitiveArray_jlong* GetLongArrayElements_2(jlongArray array, jboolean *isCopy) {
        return PrimitiveArray_jlong::create($self->GetLongArrayElements(array,isCopy));
    }
    PrimitiveArray_jfloat* GetFloatArrayElements_2(jfloatArray array, jboolean *isCopy) {
        return PrimitiveArray_jfloat::create($self->GetFloatArrayElements(array,isCopy));
    }
    PrimitiveArray_jdouble* GetDoubleArrayElements_2(jdoubleArray array, jboolean *isCopy) {
        return PrimitiveArray_jdouble::create($self->GetDoubleArrayElements(array,isCopy));
    }

    void ReleaseBooleanArrayElements_2(jbooleanArray array, PrimitiveArray_jboolean *elems, jint mode) {
         $self->ReleaseBooleanArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseCharArrayElements_2(jcharArray array, PrimitiveArray_jchar* elems, jint mode) {
        $self->ReleaseCharArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseByteArrayElements_2(jbyteArray array, PrimitiveArray_jbyte* elems, jint mode) {
        $self->ReleaseByteArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseShortArrayElements_2(jshortArray array, PrimitiveArray_jshort* elems, jint mode) {
        $self->ReleaseShortArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseIntArrayElements_2(jintArray array, PrimitiveArray_jint* elems, jint mode) {
        $self->ReleaseIntArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseLongArrayElements_2(jlongArray array, PrimitiveArray_jlong* elems, jint mode) {
        $self->ReleaseLongArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseFloatArrayElements_2(jfloatArray array, PrimitiveArray_jfloat *elems, jint mode) {
        $self->ReleaseFloatArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseDoubleArrayElements_2(jdoubleArray array, PrimitiveArray_jdouble *elems, jint mode) {
        $self->ReleaseDoubleArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }

    jint GetJavaVM_2(Ref<JavaVM>* refvm) {
        JavaVM* vm = refvm->getValue();
        jint ret = $self->GetJavaVM(&vm);
        if (ret == JNI_OK) {
          refvm->setValue(vm);
        }
        return ret;
    }
}

%template(Ref_JNIEnv) Ref<JNIEnv>;
