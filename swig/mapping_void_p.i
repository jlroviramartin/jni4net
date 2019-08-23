%typemap(ctype) void *
"/* ctype void* */ void *"

%typemap(imtype) void *
"/* imtype void* */ System.IntPtr"

%typemap(cstype) void *
"/* cstype void* */ System.IntPtr"

%typemap(in) void *
%{ /* in void* */ $1 = $input; %}

%typemap(out) void *
%{ /* out void* */ $result = $1; %}

%typemap(csin) void *
"/* csin void* */ $csinput"

%typemap(csout, excode=SWIGEXCODE) void *
%{ {
    // csout void*
    System.IntPtr ret = $imcall;$excode
    return ret;
  } %}

%typemap(csvarin, excode=SWIGEXCODE2) void *
%{
    set {
      // csvarin void*
      $imcall;$excode
    } %}

%typemap(csvarout, excode=SWIGEXCODE2) void *
%{
    get {
      // csvarout void*
      System.IntPtr ret = $imcall;$excode
      return ret;
    } %}
