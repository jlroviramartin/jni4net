%rename(JValue) jvalue;

// Extrends JNIEnv_ with better alternatives to the ignored methods (JNIEnv_ and JNI_)
%extend jvalue {
  public:
    static jvalue New(jboolean value) { jvalue v; v.z = value; return v; }
    static jvalue New(jbyte    value) { jvalue v; v.b = value; return v; }
    static jvalue New(jchar    value) { jvalue v; v.c = value; return v; }
    static jvalue New(jshort   value) { jvalue v; v.s = value; return v; }
    static jvalue New(jint     value) { jvalue v; v.i = value; return v; }
    static jvalue New(jlong    value) { jvalue v; v.j = value; return v; }
    static jvalue New(jfloat   value) { jvalue v; v.f = value; return v; }
    static jvalue New(jdouble  value) { jvalue v; v.d = value; return v; }
    static jvalue New(jobject  value) { jvalue v; v.l = value; return v; }
}

%typemap(cscode) jvalue %{
  public static readonly JValue[] Empty = new JValue[0];
%}
