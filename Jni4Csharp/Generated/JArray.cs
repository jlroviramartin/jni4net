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

public class JArray : JObject {
  private global::System.Runtime.InteropServices.HandleRef swigCPtr;

  internal JArray(global::System.IntPtr cPtr, bool cMemoryOwn) : base(JNIPINVOKE.JArray_SWIGUpcast(cPtr), cMemoryOwn) {
    swigCPtr = new global::System.Runtime.InteropServices.HandleRef(this, cPtr);
  }

  internal static global::System.Runtime.InteropServices.HandleRef getCPtr(JArray obj) {
    return (obj == null) ? new global::System.Runtime.InteropServices.HandleRef(null, global::System.IntPtr.Zero) : obj.swigCPtr;
  }

  protected override void Dispose(bool disposing) {
    lock(this) {
      if (swigCPtr.Handle != global::System.IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          JNIPINVOKE.delete_JArray(swigCPtr);
        }
        swigCPtr = new global::System.Runtime.InteropServices.HandleRef(null, global::System.IntPtr.Zero);
      }
      base.Dispose(disposing);
    }
  }

  public int GetLength(JNIEnv env) {
    int ret = JNIPINVOKE.JArray_GetLength(swigCPtr, JNIEnv.getCPtr(env));
    return ret;
  }

  public JArray() : this(JNIPINVOKE.new_JArray(), true) {
  }

}

}
