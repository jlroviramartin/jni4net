%extend _jarray {

    jsize GetLength(JNIEnv_* env) {
        return env->GetArrayLength($self);
    }
}

%typemap(csclassmodifiers) _jbooleanArray "public unsafe class"

%extend _jbooleanArray {
    static jbooleanArray New(JNIEnv_* env, jsize len) {
        return env->NewBooleanArray(len);
    }

    PrimitiveArray_jboolean* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jboolean::create(env->GetBooleanArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jboolean* elems, jint mode) {
         env->ReleaseBooleanArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jboolean* buf) {
        env->GetBooleanArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jboolean* buf) {
        env->SetBooleanArrayRegion($self, start, len, buf);
    }

    jboolean Get(JNIEnv_* env, jsize index) {
        jboolean ret;
        env->GetBooleanArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jboolean value) {
        env->SetBooleanArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _boolArray %{
  public System.Collections.Generic.IEnumerable<bool> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jcharArray "public unsafe class"

%extend _jcharArray {
    static jcharArray New(JNIEnv_* env, jsize len) {
        return env->NewCharArray(len);
    }

    PrimitiveArray_jchar* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jchar::create(env->GetCharArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jchar* elems, jint mode) {
         env->ReleaseCharArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jchar* buf) {
        env->GetCharArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jchar* buf) {
        env->SetCharArrayRegion($self, start, len, buf);
    }

    jchar Get(JNIEnv_* env, jsize index) {
        jchar ret;
        env->GetCharArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jchar value) {
        env->SetCharArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _charArray %{
  public System.Collections.Generic.IEnumerable<char> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jbyteArray "public unsafe class"

%extend _jbyteArray {
    static jbyteArray New(JNIEnv_* env, jsize len) {
        return env->NewByteArray(len);
    }

    PrimitiveArray_jbyte* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jbyte::create(env->GetByteArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jbyte* elems, jint mode) {
         env->ReleaseByteArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jbyte* buf) {
        env->GetByteArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jbyte* buf) {
        env->SetByteArrayRegion($self, start, len, buf);
    }

    jbyte Get(JNIEnv_* env, jsize index) {
        jbyte ret;
        env->GetByteArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jbyte value) {
        env->SetByteArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _byteArray %{
  public System.Collections.Generic.IEnumerable<byte> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jshortArray "public unsafe class"

%extend _jshortArray {

    static jshortArray New(JNIEnv_* env, jsize len) {
        return env->NewShortArray(len);
    }

    PrimitiveArray_jshort* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jshort::create(env->GetShortArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jshort* elems, jint mode) {
         env->ReleaseShortArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jshort* buf) {
        env->GetShortArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jshort* buf) {
        env->SetShortArrayRegion($self, start, len, buf);
    }

    jshort Get(JNIEnv_* env, jsize index) {
        jshort ret;
        env->GetShortArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jshort value) {
        env->SetShortArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _shortArray %{
  public System.Collections.Generic.IEnumerable<short> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jintArray "public unsafe class"

%extend _jintArray {

    static jintArray New(JNIEnv_* env, jsize len) {
        return env->NewIntArray(len);
    }

    PrimitiveArray_jint* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jint::create(env->GetIntArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jint* elems, jint mode) {
         env->ReleaseIntArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jint* buf) {
        env->GetIntArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jint* buf) {
        env->SetIntArrayRegion($self, start, len, buf);
    }

    jint Get(JNIEnv_* env, jsize index) {
        jint ret;
        env->GetIntArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jint value) {
        env->SetIntArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _intArray %{
  public System.Collections.Generic.IEnumerable<int> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jlongArray "public unsafe class"

%extend _jlongArray {

    static jlongArray New(JNIEnv_* env, jsize len) {
        return env->NewLongArray(len);
    }

    PrimitiveArray_jlong* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jlong::create(env->GetLongArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jlong* elems, jint mode) {
         env->ReleaseLongArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jlong* buf) {
        env->GetLongArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jlong* buf) {
        env->SetLongArrayRegion($self, start, len, buf);
    }

    jlong Get(JNIEnv_* env, jsize index) {
        jlong ret;
        env->GetLongArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jlong value) {
        env->SetLongArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _longArray %{
  public System.Collections.Generic.IEnumerable<long> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jfloatArray "public unsafe class"

%extend _jfloatArray {

    static jfloatArray New(JNIEnv_* env, jsize len) {
        return env->NewFloatArray(len);
    }

    PrimitiveArray_jfloat* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jfloat::create(env->GetFloatArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jfloat* elems, jint mode) {
         env->ReleaseFloatArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jfloat* buf) {
        env->GetFloatArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jfloat* buf) {
        env->SetFloatArrayRegion($self, start, len, buf);
    }

    jfloat Get(JNIEnv_* env, jsize index) {
        jfloat ret;
        env->GetFloatArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jfloat value) {
        env->SetFloatArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _floatArray %{
  public System.Collections.Generic.IEnumerable<float> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jdoubleArray "public unsafe class"

%extend _jdoubleArray {

    static jdoubleArray New(JNIEnv_* env, jsize len) {
        return env->NewDoubleArray(len);
    }

    PrimitiveArray_jdouble* GetElements(JNIEnv_* env, jboolean* isCopy) {
        return PrimitiveArray_jdouble::create(env->GetDoubleArrayElements($self, isCopy));
    }

    void ReleaseElements(JNIEnv_* env, PrimitiveArray_jdouble* elems, jint mode) {
         env->ReleaseDoubleArrayElements($self, elems->getBuffer(), mode);
         delete elems;
    }

    void GetRegion(JNIEnv_* env, jsize start, jsize len, jdouble* buf) {
        env->GetDoubleArrayRegion($self, start, len, buf);
    }

    void SetRegion(JNIEnv_* env, jsize start, jsize len, const jdouble* buf) {
        env->SetDoubleArrayRegion($self, start, len, buf);
    }

    jdouble Get(JNIEnv_* env, jsize index) {
        jdouble ret;
        env->GetDoubleArrayRegion($self, index, 1, &ret);
        return ret;
    }

    void Set(JNIEnv_* env, jsize index, jdouble value) {
        env->SetDoubleArrayRegion($self, index, 1, &value);
    }
}

%typemap(cscode) _jdoubleArray %{
  public System.Collections.Generic.IEnumerable<double> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}

%typemap(csclassmodifiers) _jobjectArray "public unsafe class"

%extend _jobjectArray {

    static jobjectArray New(JNIEnv_* env, jsize len, jclass clazz, jobject init) {
        return env->NewObjectArray(len, clazz, init);
    }

    jobject Get(JNIEnv_* env, jsize index) {
        return env->GetObjectArrayElement($self, index);
    }

    void Set(JNIEnv_* env, jsize index, jobject value) {
        env->SetObjectArrayElement($self, index, value);
    }
}

%typemap(cscode) _jobjectArray %{
  public System.Collections.Generic.IEnumerable<JObject> GetEnumerator(JNIEnv env) {
      for (int i = 0, sz = this.GetLength(env); i < sz; i++) {
          yield return Get(env, i);
      }
  }
%}
