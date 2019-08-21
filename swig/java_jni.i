%module JNI

%include <windows.i>
%include <typemaps.i>
%include <carrays.i>
%include <cpointer.i>
%include <arrays_csharp.i>

%include "cs_struct.i"

%{
#include "win32/jni_md.h"
#include "jni.h"
%}

%ignore JNINativeInterface_;
%ignore JNIInvokeInterface_;

%ignore JavaVMOption::version;
%ignore JavaVMOption::nOptions;
%ignore JavaVMOption::options;
%ignore JavaVMOption::extraInfo;

%extend JavaVMInitArgs {

  private:
    JavaVMInitArgs() {}

  public:
    static JavaVMInitArgs* create(jint version) {
      JavaVMInitArgs* pargs = new JavaVMInitArgs();
      pargs->ignoreUnrecognized = JNI_TRUE;
      pargs->version = version;
      pargs->nOptions = 0;
      pargs->options = NULL;
      return pargs;
    }

    static JavaVMInitArgs* create(jint version, jint nOptions) {
      JavaVMInitArgs* pargs = new JavaVMInitArgs();
      pargs->ignoreUnrecognized = JNI_TRUE;
      pargs->version = version;
      pargs->nOptions = nOptions;
      if (nOptions > 0) {
        pargs->options = new JavaVMOption[nOptions];
      } else {
        pargs->options = NULL;
      }
      return pargs;
    }

    jint getOptions() { return $self->nOptions; }
    void setOptions(jint value) {
      if ($self->options != NULL) {
        delete $self->options;
        $self->options = NULL;
      }

      $self->nOptions = value;
      if ($self->nOptions > 0) {
        $self->options = new JavaVMOption[$self->nOptions];
      }
    }

    JavaVMOption get(jint i) { return $self->options[i]; }
    void set(jint i, JavaVMOption value) { $self->options[i] = value; }

    jboolean isIgnoreUnrecognized() { return $self->ignoreUnrecognized; }
    void setIgnoreUnrecognized(jboolean value) { $self->ignoreUnrecognized = value; }
}

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

%typemap(csclassmodifiers) JNIEnv_ "public unsafe class"

CSHARP_ARRAYS_FIXED(unsigned short, char)

%clear bool FIXED[];
CSHARP_ARRAYS_FIXED(unsigned char, bool)

%apply unsigned char FIXED[]  {(const jboolean *buf), (jboolean *buf)}
%apply unsigned short FIXED[] {(const jchar *buf), (jchar *buf)}

%apply signed char FIXED[]    {(const jbyte *buf), (jbyte *buf)}
%apply short FIXED[]          {(const jshort *buf), (jshort *buf)}
%apply long FIXED[]           {(const jint *buf), (jint *buf)}
%apply long long FIXED[]      {(const jlong *buf), (jlong *buf)}
%apply float FIXED[]          {(const jfloat *buf), (jfloat *buf)}
%apply double FIXED[]         {(const jdouble *buf), (jdouble *buf)}

%apply bool& INOUT {(jboolean* isCopy)};

typedef struct {
} va_list;

%rename(VaList) va_list;

//%array_class(jboolean, jboolean_ARRAY);
//%array_class(jchar, jchar_ARRAY);
//%array_class(jbyte, jbyte_ARRAY);
//%array_class(jshort, jshort_ARRAY);
//%array_class(jint, jint_ARRAY);
//%array_class(jlong, jlong_ARRAY);
//%array_class(jfloat, jfloat_ARRAY);
//%array_class(jdouble, jdouble_ARRAY);

// Ignores some method of the inlined classes
%ignore Buffer::getBuffer;
%ignore Buffer::setBuffer;
%ignore Buffer::set;
%ignore Buffer::setLength;

%ignore PrimitiveArray::create;
%ignore PrimitiveArray::getBuffer;
%ignore PrimitiveArray::setBuffer;

%ignore PrimitiveArray_jboolean::create;
%ignore PrimitiveArray_jboolean::getBuffer;
%ignore PrimitiveArray_jboolean::setBuffer;

%ignore PrimitiveArray_jchar::create;
%ignore PrimitiveArray_jchar::getBuffer;
%ignore PrimitiveArray_jchar::setBuffer;

// Some useful classes
%inline %{

  template <class T>
  class Ref {
  private:
    T* pobject = NULL;
  public:
    T* getValue() { return pobject; }
    void setValue(T* pvalue) { pobject = pvalue; }
  };

  template <class T>
  class Buffer {
  private:
    T** buffer = NULL;
    jsize bufferLength;
    jsize length;
  public:
    Buffer(jsize bufferLength) {
      this->buffer = new T*[bufferLength];
      this->bufferLength = bufferLength;
      this->length = 0;
    }
    T** getBuffer() { return buffer; }
    void setBuffer(T** value) { buffer = value; }
    T* get(jsize i) { return buffer[i]; }
    void set(jsize i, T* pobj) { buffer[i] = pobj; }
    jsize getBufferLength() { return bufferLength; }
    jsize getLength() { return length; }
    void setLength(jsize value) { length = value; }
  };

  template <class T>
  class PrimitiveArray {
  private:
    T* buffer = NULL;
    PrimitiveArray(T* buffer) {
      this->buffer = buffer;
    }
  public:
    static PrimitiveArray* create(T* buffer) {
      return new PrimitiveArray(buffer);
    }
    T* getBuffer() { return buffer; }
    void setBuffer(T* value) { buffer = value; }
    T get(jsize i) { return buffer[i]; }
    void set(jsize i, T value) { buffer[i] = value; }
  };

  class PrimitiveArray_jboolean {
  private:
    jboolean* buffer = NULL;
    PrimitiveArray_jboolean(jboolean* buffer) {
      this->buffer = buffer;
    }
  public:
    static PrimitiveArray_jboolean* create(jboolean* buffer) {
      return new PrimitiveArray_jboolean(buffer);
    }
    jboolean* getBuffer() { return buffer; }
    void setBuffer(jboolean* value) { buffer = value; }
    bool get(jsize i) { return buffer[i]; }
    void set(jsize i, bool value) { buffer[i] = value; }
  };

  class PrimitiveArray_jchar {
  private:
    jchar* buffer = NULL;
    PrimitiveArray_jchar(jchar* buffer) {
      this->buffer = buffer;
    }
  public:
    static PrimitiveArray_jchar* create(jchar* buffer) {
      return new PrimitiveArray_jchar(buffer);
    }
    jchar* getBuffer() { return buffer; }
    void setBuffer(jchar* value) { buffer = value; }
    char get(jsize i) { return buffer[i]; }
    void set(jsize i, char value) { buffer[i] = value; }
  };

%}

// Ignores JNIEnv_ properties and methods
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

// Ignores JNI_ methods
%ignore JNI_OnLoad;
%ignore JNI_OnUnload;
%ignore JNI_GetDefaultJavaVMInitArgs;
%ignore JNI_CreateJavaVM;
%ignore JNI_GetCreatedJavaVMs;

// Extrends JNIEnv_ with better alternatives to the ignored methods (JNIEnv_ and JNI_)
%extend JNIEnv_ {

    PrimitiveArray_jboolean* GetBooleanArrayElements(jbooleanArray array, jboolean *isCopy) {
      return PrimitiveArray_jboolean::create(aux->setBuffer($self->GetBooleanArrayElements(array,isCopy));
    }
    PrimitiveArray<jbyte>* GetByteArrayElements(jbyteArray array, jboolean *isCopy) {
        return PrimitiveArray<jbyte>::create(functions->GetByteArrayElements(this,array,isCopy));
    }
    PrimitiveArray<jchar>* GetCharArrayElements(jcharArray array, jboolean *isCopy) {
        return PrimitiveArray<jchar>::create(functions->GetCharArrayElements(this,array,isCopy));
    }
    PrimitiveArray<jshort>* GetShortArrayElements(jshortArray array, jboolean *isCopy) {
        return PrimitiveArray<jshort>::create(functions->GetShortArrayElements(this,array,isCopy));
    }
    PrimitiveArray<jint>* GetIntArrayElements(jintArray array, jboolean *isCopy) {
        return PrimitiveArray<jint>::create(functions->GetIntArrayElements(this,array,isCopy));
    }
    PrimitiveArray<jlong>* GetLongArrayElements(jlongArray array, jboolean *isCopy) {
        return PrimitiveArray<jlong>::create(functions->GetLongArrayElements(this,array,isCopy));
    }
    PrimitiveArray<jfloat>* GetFloatArrayElements(jfloatArray array, jboolean *isCopy) {
        return PrimitiveArray<jfloat>::create(functions->GetFloatArrayElements(this,array,isCopy));
    }
    PrimitiveArray<jdouble>* GetDoubleArrayElements(jdoubleArray array, jboolean *isCopy) {
        return PrimitiveArray<jdouble>::create(functions->GetDoubleArrayElements(this,array,isCopy));
    }

    void ReleaseBooleanArrayElements(jbooleanArray array, PrimitiveArray_jboolean *elems, jint mode) {
         $self->ReleaseBooleanArrayElements(array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseByteArrayElements(jbyteArray array, PrimitiveArray<jbyte>* elems, jint mode) {
        functions->ReleaseByteArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseCharArrayElements(jcharArray array, PrimitiveArray<jchar>* elems, jint mode) {
        functions->ReleaseCharArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseShortArrayElements(jshortArray array, PrimitiveArray<jshort>* elems, jint mode) {
        functions->ReleaseShortArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseIntArrayElements(jintArray array, PrimitiveArray<jint>* elems, jint mode) {
        functions->ReleaseIntArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseLongArrayElements(jlongArray array, PrimitiveArray<jlong>* elems, jint mode) {
        functions->ReleaseLongArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseFloatArrayElements(jfloatArray array, jfloat *elems, jint mode) {
        functions->ReleaseFloatArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }
    void ReleaseDoubleArrayElements(jdoubleArray array, jdouble *elems, jint mode) {
        functions->ReleaseDoubleArrayElements(this,array,elems->getBuffer(),mode);
         delete elems;
    }

    jint GetJavaVM(Ref<JavaVM>* refvm) {
        JavaVM* vm = refvm->getValue();
        jint ret = $self->GetJavaVM(&vm);
        if (ret == JNI_OK) {
          refvm->setValue(vm);
        }
        return ret;
    }
}

// Ignores JavaVM_ properties and methods
%ignore JavaVM_::functions;
%ignore JavaVM_::AttachCurrentThread;
%ignore JavaVM_::GetEnv;
%ignore JavaVM_::AttachCurrentThreadAsDaemon;

// Extends JavaVM_ with better alternatives to ignored methods.
%extend JavaVM_ {
  jint AttachCurrentThread(Ref<JNIEnv>* refenv, JavaVMAttachArgs* args) {
    JNIEnv* env = refenv->getValue();
    jint ret = $self->AttachCurrentThread(&env, (void*) args);
      if (ret == JNI_OK) {
      refenv->setValue(env);
    }
    return ret;
  }

  jint GetEnv(Ref<JNIEnv>* refenv, jint version) {
    JNIEnv* env = refenv->getValue();
    jint ret = $self->GetEnv(&env);
      if (ret == JNI_OK) {
      refenv->setValue(env);
    }
    return ret;
  }

  jint AttachCurrentThreadAsDaemon(Ref<JNIEnv>* refenv, JavaVMAttachArgs* args) {
    JNIEnv* env = refenv->getValue();
    jint ret = $self->AttachCurrentThreadAsDaemon(&env, (void*) args);
      if (ret == JNI_OK) {
      refenv->setValue(env);
    }
    return ret;
  }

  static jint GetDefaultJavaVMInitArgs(JavaVMInitArgs* args) {
    return JNI_GetDefaultJavaVMInitArgs((void*)args);
  }

  static jint CreateJavaVM(Ref<JavaVM>* refvm, Ref<JNIEnv>* refenv, JavaVMInitArgs* args) {
    JavaVM* vm = refvm->getValue();
    JNIEnv* env = refenv->getValue();
    jint ret = JNI_CreateJavaVM(&vm, (void**)&env, (void*)args);
    if (ret == JNI_OK) {
      refvm->setValue(vm);
      refenv->setValue(env);
    }
    return ret;
  }

  static jint GetCreatedJavaVMs(Buffer<JavaVM>* refvm) {
    JavaVM** buffer = refvm->getBuffer();
    jsize bufferLength = refvm->getBufferLength();
    jsize length = 0;
    jint ret = JNI_GetCreatedJavaVMs(buffer, bufferLength, &length);
    if (ret == JNI_OK) {
      refvm->setBuffer(buffer);
      refvm->setLength(length);
    }
    return ret;
  }
}

// Defines the template instantiations
%template(Ref_JavaVM) Ref<JavaVM>;
%template(Ref_JNIEnv) Ref<JNIEnv>;
%template(Buffer_JavaVM) Buffer<JavaVM>;

//%template(PrimitiveArray_jboolean) PrimitiveArray<jboolean>;
%template(PrimitiveArray_jbyte) PrimitiveArray<jbyte>;
//%template(PrimitiveArray_jchar) PrimitiveArray<jchar>;
%template(PrimitiveArray_jshort) PrimitiveArray<jshort>;
%template(PrimitiveArray_jint) PrimitiveArray<jint>;
%template(PrimitiveArray_jlong) PrimitiveArray<jlong>;
%template(PrimitiveArray_jfloat) PrimitiveArray<jfloat>;
%template(PrimitiveArray_jdouble) PrimitiveArray<jdouble>;

// Renames to better names
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


// Include the main files
%include "win32/jni_md.h"
%include "jni.h"
