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

    jint length() { return $self->nOptions; }

    JavaVMOption get(jsize i) { return $self->options[i]; }
    void set(jsize i, JavaVMOption value) { $self->options[i] = value; }

    jboolean isIgnoreUnrecognized() { return $self->ignoreUnrecognized; }
    void setIgnoreUnrecognized(jboolean value) { $self->ignoreUnrecognized = value; }
}
