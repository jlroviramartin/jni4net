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

  template <class T, class TRet>
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

    TRet get(jsize i) { return (TRet)buffer[i]; }
    void set(jsize i, TRet value) { buffer[i] = (T)value; }
  };

typedef PrimitiveArray<jboolean, jboolean> PrimitiveArray_jboolean;
typedef PrimitiveArray<jchar, jchar> PrimitiveArray_jchar;
typedef PrimitiveArray<jbyte, jbyte> PrimitiveArray_jbyte;
typedef PrimitiveArray<jshort, jshort> PrimitiveArray_jshort;
typedef PrimitiveArray<jint, jint> PrimitiveArray_jint;
typedef PrimitiveArray<jlong, jlong> PrimitiveArray_jlong;
typedef PrimitiveArray<jfloat, jfloat> PrimitiveArray_jfloat;
typedef PrimitiveArray<jdouble, jdouble> PrimitiveArray_jdouble;

%}

// Ignores some method of the inlined classes
%ignore Buffer::getBuffer;
%ignore Buffer::setBuffer;
%ignore Buffer::set;
%ignore Buffer::setLength;

%ignore PrimitiveArray::create;
%ignore PrimitiveArray::getBuffer;
%ignore PrimitiveArray::setBuffer;

// Instantiates the templates
%template(PrimitiveArray_jboolean) PrimitiveArray<jboolean, jboolean>;
%template(PrimitiveArray_jbyte) PrimitiveArray<jbyte, jbyte>;
%template(PrimitiveArray_jchar) PrimitiveArray<jchar, jchar>;
%template(PrimitiveArray_jshort) PrimitiveArray<jshort, jshort>;
%template(PrimitiveArray_jint) PrimitiveArray<jint, jint>;
%template(PrimitiveArray_jlong) PrimitiveArray<jlong, jlong>;
%template(PrimitiveArray_jfloat) PrimitiveArray<jfloat, jfloat>;
%template(PrimitiveArray_jdouble) PrimitiveArray<jdouble, jdouble>;
