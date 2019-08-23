namespace Jni4Csharp.Test.Core
{
    public class X_JObject
    {
        private es.jni.JNIEnv env;
        protected es.jni.JObject jinstance;
        protected es.jni.JObject jref;
        private es.jni.JMethodID jgetHashCode;
        private es.jni.JMethodID jequals;
        private es.jni.JMethodID jtoString;

        public X_JObject()
        {
            es.jni.JClass jclazz = env.FindClass("java/lang/Object");
            es.jni.JMethodID jinit = env.GetMethodID(jclazz, "<init>", "()V");
            jinstance = env.NewObject(jclazz, jinit, new es.jni.JValue[0]);
            jref = env.NewGlobalRef(jinstance);
        }

        public override int GetHashCode()
        {
            return env.CallIntMethod(jinstance, jgetHashCode, new es.jni.JValue[0]);
        }

        public override bool Equals(object obj)
        {
            X_JObject jobj = obj as X_JObject;
            return env.CallBooleanMethod(jinstance, jequals, new[] {
                es.jni.JValue.New(jobj.jinstance)
            });
        }

        public override string ToString()
        {
            es.jni.JObject jobj = env.CallObjectMethod(jinstance, jtoString, new es.jni.JValue[0]);
            es.jni.JString jstring = jobj.toJString();
            if (jstring.isNull()) {
                return null;
            }
            int len = env.GetStringLength(jstring);
            char[] buff = new char[len];
            env.GetStringRegion(jstring, 0, len, buff);
            return new string(buff);
        }
    }
}
