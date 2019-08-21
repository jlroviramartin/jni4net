using es.jni;
using Jni;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Diagnostics;
using System.IO;

namespace Jni4Csharp.Test
{
    [TestClass]
    public class UnitTest1
    {
        public static void Setup()
        {
            String platform = Environment.Is64BitOperatingSystem ? "x64" : "Win32";
            String configuration = "Debug";

            String assemblyPath = new Uri(typeof(WindowsStartup).Assembly.CodeBase).LocalPath;
            String jni4csharpDllPath = Path.Combine(Path.GetDirectoryName(assemblyPath),
                "..", "..", "..",
                platform, configuration);

            String jdkPath = Environment.Is64BitOperatingSystem
                ? @"C:\Program Files\Java\jdk-1.8.0_201\"
                : @"C:\Program Files (x86)\Java\jdk-1.8.0_201\";

            WindowsStartup.Config(jdkPath, jni4csharpDllPath);
        }

        [TestMethod]
        public void TestMethod1()
        {
            Setup();

            // NO FUNCIONA... ?????

            JavaVMOption options = new JavaVMOption();
            //options.optionString = $@"-Djava.class.path={jdkPath}";
            options.optionString = "";

            JavaVMInitArgs vm_args = JavaVMInitArgs.create(JNI.JNI_VERSION_1_8, 1);
            vm_args.set(0, options);

            int flags;

            Ref_JavaVM refJavaVM = new Ref_JavaVM();
            Ref_JNIEnv refJNIEnv = new Ref_JNIEnv();
            flags = JavaVM.CreateJavaVM(refJavaVM, refJNIEnv, vm_args);
            if (flags == JNI.JNI_ERR)
            {
                String msg = "Error creando la maquina virtual";
                Debug.WriteLine(msg);
                throw new Exception(msg);
            }
            JNIEnv jniEnv = refJNIEnv.getValue();

            JClass clazz = jniEnv.FindClass("java/lang/Object");
            Debug.WriteLine("Class " + clazz);
        }
    }
}
