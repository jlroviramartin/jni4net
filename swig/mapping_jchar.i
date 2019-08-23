//
// jchar (unsigned short) type mapping
//
%typemap(ctype)  jchar, const jchar & 
"/* ctype jchar */ jchar"

%typemap(imtype) jchar, const jchar & 
"/* imtype jchar */ char"

%typemap(cstype) jchar, const jchar & 
"/* cstype jchar */ char"

%typemap(in) jchar
%{ /* in jchar */ $1 = ($1_ltype)$input; %}

%typemap(in) const jchar & ($*1_ltype temp)
%{ /* in jchar */ temp = ($*1_ltype)$input; 
   $1 = &temp; %}

%typemap(out) jchar
%{ /* out jchar */ $result = $1; %}

%typemap(out) const jchar &
%{ /* out jchar */ $result = *$1; %}

%typemap(directorin) jchar
%{ /* directorin jchar */ $input = $1; %}

%typemap(directorin) const jchar &
%{ /* directorin jchar */ $input = $1; %}

%typemap(directorout) jchar
%{ /* directorout jchar */ $result = ($1_ltype)$input; %}

%typemap(directorout,warning=SWIGWARN_TYPEMAP_THREAD_UNSAFE_MSG) const jchar &
%{ /* directorout jchar */ static $*1_ltype temp;
   temp = ($*1_ltype)$input; 
   $result = &temp; %}

%typemap(csin) jchar, const jchar &
"/* csin jchar */ $csinput"

%typemap(csout, excode=SWIGEXCODE) jchar, const jchar &
%{ {
    // csout jchar
    char ret = $imcall;$excode
    return ret;
  } %}

%typemap(csvarin, excode=SWIGEXCODE2) jchar, const jchar &
%{
    set {
      // csvarin jchar
      $imcall;$excode
    } %}

%typemap(csvarout, excode=SWIGEXCODE2) jchar, const jchar &
%{
    get {
      // csvarout jchar
      char ret = $imcall;$excode
      return ret;
    } %}
