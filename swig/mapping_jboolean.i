//
// jboolean (unsigned char) type mapping
//

%typemap(ctype)  jboolean, const jboolean &
"/* ctype jboolean */ jboolean"

%typemap(imtype) jboolean, const jboolean &
"/* imtype jboolean */ bool"

%typemap(cstype) jboolean, const jboolean &
"/* cstype jboolean */ bool"

%typemap(in) jboolean
%{ /* in jboolean */ $1 = ($1_ltype)$input; %}

%typemap(in) const jboolean & ($*1_ltype temp)
%{ /* in jboolean */ temp = ($*1_ltype)$input; 
   $1 = &temp; %}

%typemap(out) jboolean
%{ /* out jboolean */ $result = $1; %}

%typemap(out) const jboolean &
%{ /* out jboolean */ $result = *$1; %}

%typemap(directorin) jboolean
%{ /* directorin jboolean */ $input = $1; %}

%typemap(directorin) const jboolean &
%{ /* directorin jboolean */ $input = $1; %}

%typemap(directorout) jboolean
%{ /* directorout jboolean */ $result = ($1_ltype)$input; %}

%typemap(directorout,warning=SWIGWARN_TYPEMAP_THREAD_UNSAFE_MSG) const jboolean &
%{ /* directorout jboolean */ static $*1_ltype temp;
   temp = ($*1_ltype)$input; 
   $result = &temp; %}

%typemap(csin) jboolean, const jboolean &
"/* csin jboolean */ $csinput"

%typemap(csout, excode=SWIGEXCODE) jboolean, const jboolean &
%{ {
    // csout jboolean
    bool ret = $imcall;$excode
    return ret;
  } %}

%typemap(csvarin, excode=SWIGEXCODE2) jboolean, const jboolean &
%{
    set {
      // csvarin jboolean
      $imcall;$excode
    } %}

%typemap(csvarout, excode=SWIGEXCODE2) jboolean, const jboolean &
%{
    get {
      // csvarout jboolean
      bool ret = $imcall;$excode
      return ret;
    } %}
