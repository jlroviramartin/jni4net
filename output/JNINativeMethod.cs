//------------------------------------------------------------------------------
// <auto-generated />
//
// This file was automatically generated by SWIG (http://www.swig.org).
// Version 4.0.0
//
// Do not make changes to this file unless you know what you are doing--modify
// the SWIG interface file instead.
//------------------------------------------------------------------------------


public class JNINativeMethod : global::System.IDisposable {
  private global::System.Runtime.InteropServices.HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal JNINativeMethod(global::System.IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new global::System.Runtime.InteropServices.HandleRef(this, cPtr);
  }

  internal static global::System.Runtime.InteropServices.HandleRef getCPtr(JNINativeMethod obj) {
    return (obj == null) ? new global::System.Runtime.InteropServices.HandleRef(null, global::System.IntPtr.Zero) : obj.swigCPtr;
  }

  ~JNINativeMethod() {
    Dispose(false);
  }

  public void Dispose() {
    Dispose(true);
    global::System.GC.SuppressFinalize(this);
  }

  protected virtual void Dispose(bool disposing) {
    lock(this) {
      if (swigCPtr.Handle != global::System.IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          JNIPINVOKE.delete_JNINativeMethod(swigCPtr);
        }
        swigCPtr = new global::System.Runtime.InteropServices.HandleRef(null, global::System.IntPtr.Zero);
      }
    }
  }

  public void FUN() { }

  public string name {
    set {
      JNIPINVOKE.JNINativeMethod_name_set(swigCPtr, value);
    } 
    get {
      string ret = JNIPINVOKE.JNINativeMethod_name_get(swigCPtr);
      return ret;
    } 
  }

  public string signature {
    set {
      JNIPINVOKE.JNINativeMethod_signature_set(swigCPtr, value);
    } 
    get {
      string ret = JNIPINVOKE.JNINativeMethod_signature_get(swigCPtr);
      return ret;
    } 
  }

  public SWIGTYPE_p_void fnPtr {
    set {
      JNIPINVOKE.JNINativeMethod_fnPtr_set(swigCPtr, SWIGTYPE_p_void.getCPtr(value));
    } 
    get {
      global::System.IntPtr cPtr = JNIPINVOKE.JNINativeMethod_fnPtr_get(swigCPtr);
      SWIGTYPE_p_void ret = (cPtr == global::System.IntPtr.Zero) ? null : new SWIGTYPE_p_void(cPtr, false);
      return ret;
    } 
  }

  public JNINativeMethod() : this(JNIPINVOKE.new_JNINativeMethod(), true) {
  }

}
