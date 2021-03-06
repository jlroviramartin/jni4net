//------------------------------------------------------------------------------
// <auto-generated />
//
// This file was automatically generated by SWIG (http://www.swig.org).
// Version 4.0.1
//
// Do not make changes to this file unless you know what you are doing--modify
// the SWIG interface file instead.
//------------------------------------------------------------------------------

namespace es.jni {

public unsafe class JShortArray : JArray {
  private global::System.Runtime.InteropServices.HandleRef swigCPtr;

  internal JShortArray(global::System.IntPtr cPtr, bool cMemoryOwn) : base(JNIPINVOKE.JShortArray_SWIGUpcast(cPtr), cMemoryOwn) {
    swigCPtr = new global::System.Runtime.InteropServices.HandleRef(this, cPtr);
  }

  internal static global::System.Runtime.InteropServices.HandleRef getCPtr(JShortArray obj) {
    return (obj == null) ? new global::System.Runtime.InteropServices.HandleRef(null, global::System.IntPtr.Zero) : obj.swigCPtr;
  }

  protected override void Dispose(bool disposing) {
    lock(this) {
      if (swigCPtr.Handle != global::System.IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          JNIPINVOKE.delete_JShortArray(swigCPtr);
        }
        swigCPtr = new global::System.Runtime.InteropServices.HandleRef(null, global::System.IntPtr.Zero);
      }
      base.Dispose(disposing);
    }
  }

  public static JShortArray New(JNIEnv env, int len) {
    global::System.IntPtr cPtr = JNIPINVOKE.JShortArray_New(JNIEnv.getCPtr(env), len);
    JShortArray ret = (cPtr == global::System.IntPtr.Zero) ? null : new JShortArray(cPtr, false);
    return ret;
  }

  public PrimitiveArray_jshort GetElements(JNIEnv env, ref bool isCopy) {
    global::System.IntPtr cPtr = JNIPINVOKE.JShortArray_GetElements(swigCPtr, JNIEnv.getCPtr(env), ref isCopy);
    PrimitiveArray_jshort ret = (cPtr == global::System.IntPtr.Zero) ? null : new PrimitiveArray_jshort(cPtr, false);
    return ret;
  }

  public void ReleaseElements(JNIEnv env, PrimitiveArray_jshort elems, int mode) {
    JNIPINVOKE.JShortArray_ReleaseElements(swigCPtr, JNIEnv.getCPtr(env), PrimitiveArray_jshort.getCPtr(elems), mode);
  }

  public void GetRegion(JNIEnv env, int start, int len, short[] buf) {
    fixed ( short* swig_ptrTo_buf = buf ) {
    {
      JNIPINVOKE.JShortArray_GetRegion(swigCPtr, JNIEnv.getCPtr(env), start, len, (global::System.IntPtr)swig_ptrTo_buf);
    }
    }
  }

  public void SetRegion(JNIEnv env, int start, int len, short[] buf) {
    fixed ( short* swig_ptrTo_buf = buf ) {
    {
      JNIPINVOKE.JShortArray_SetRegion(swigCPtr, JNIEnv.getCPtr(env), start, len, (global::System.IntPtr)swig_ptrTo_buf);
    }
    }
  }

  public short Get(JNIEnv env, int index) {
    short ret = JNIPINVOKE.JShortArray_Get(swigCPtr, JNIEnv.getCPtr(env), index);
    return ret;
  }

  public void Set(JNIEnv env, int index, short value) {
    JNIPINVOKE.JShortArray_Set(swigCPtr, JNIEnv.getCPtr(env), index, value);
  }

  public JShortArray() : this(JNIPINVOKE.new_JShortArray(), true) {
  }

}

}
