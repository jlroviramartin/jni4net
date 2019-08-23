%rename(JavaVM) JavaVM_;

%ignore JNIInvokeInterface_;

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
