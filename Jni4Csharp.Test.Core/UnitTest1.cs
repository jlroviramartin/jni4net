using es.jni;
using Jni;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Diagnostics;

namespace Jni4Csharp.Test.Core
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

            int flags;

            Ref_JavaVM refJavaVM = new Ref_JavaVM();
            Ref_JNIEnv refJNIEnv = new Ref_JNIEnv();
            flags = JavaVM.CreateJavaVM(refJavaVM, refJNIEnv, vm_args);
            if (flags == JNI.JNI_ERR) {
                Debug.WriteLine("Error creando la maquina virtual");
            }
            JNIEnv jniEnv = refJNIEnv.getValue();

            JClass clazz = jniEnv.FindClass("java/lang/Object");
            Debug.WriteLine("Class " + clazz);
        }
    }
}