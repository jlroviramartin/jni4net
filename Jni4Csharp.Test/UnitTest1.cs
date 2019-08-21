using es.jni;
using Jni;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Jni4Csharp.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            WindowsStartup.Config(
                @"C:\Program Files\Java\jdk-1.8.0_201\",
                @"C:\Proyectos_Local\csharp\publicos\Jni4Csharp\x64\Debug\");

            JavaVMOption options = new JavaVMOption();
            options.optionString = @"-Djava.class.path=C:\Program Files\Java\jdk-1.8.0_201\";

            JavaVMInitArgs vm_args = JavaVMInitArgs.create(JNI.JNI_VERSION_1_8, 1);
            vm_args.set(0, options);

            int ret100 = JavaVM.GetDefaultJavaVMInitArgs(vm_args);
            Ref_JavaVM refJavaVM = new Ref_JavaVM();
            Ref_JNIEnv refJNIEnv = new Ref_JNIEnv();
            int rett = JavaVM.CreateJavaVM(refJavaVM, refJNIEnv, vm_args);
            JNIEnv jniEnv = refJNIEnv.getValue();

            JClass clazz = jniEnv.FindClass("java.lang.Object");
            Debug.WriteLine("Class " + clazz);
        }
    }
}
