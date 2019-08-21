using es.jni;
using Jni;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Runtime.InteropServices;

namespace Jni4Csharp.Test.Core
{
    static class NativeMethods
    {
        public const uint LOAD_LIBRARY_SEARCH_DEFAULT_DIRS = 0x00001000;

        [DllImport("kernel32.dll")]
        public static extern IntPtr LoadLibraryEx(string dllFilePath, IntPtr hFile, uint dwFlags);

        [DllImport("kernel32.dll")]
        public static extern IntPtr LoadLibrary(string dllToLoad);

        [DllImport("kernel32.dll")]
        public static extern IntPtr GetProcAddress(IntPtr hModule, string procedureName);

        [DllImport("kernel32.dll")]
        public static extern bool FreeLibrary(IntPtr hModule);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool SetDllDirectory(string lpPathName);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool SetDefaultDllDirectories(uint DirectoryFlags);

        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        public static extern int AddDllDirectory(string NewDirectory);
    }

    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            //bool ret1 = NativeMethods.SetDllDirectory(@"C:\Program Files\Java\jdk-1.8.0_201\jre\bin;C:\Proyectos_Local\csharp\publicos\jni4net\x64\Debug\");

            //IntPtr pDll = NativeMethods.LoadLibrary(@"C:\Proyectos_Local\csharp\publicos\jni4net\x64\Debug\Jni4CsharpDll.dll");
            NativeMethods.SetDefaultDllDirectories(NativeMethods.LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
            int ret1 = NativeMethods.AddDllDirectory(@"C:\Program Files\Java\jdk-1.8.0_201\jre\bin\server");
            int ret2 = NativeMethods.AddDllDirectory(@"C:\Program Files\Java\jdk-1.8.0_201\jre\bin\");
            int ret3 = NativeMethods.AddDllDirectory(@"C:\Program Files\Java\jdk-1.8.0_201\bin\");
            int ret4 = NativeMethods.AddDllDirectory(@"C:\Proyectos_Local\csharp\publicos\jni4net\x64\Debug\");
            //IntPtr pDll = NativeMethods.LoadLibrary(@"Jni4CsharpDll.dll");


            //ALC.Startup();

            JavaVMOption options = new JavaVMOption();
            options.optionString = @"-Djava.class.path=C:\Program Files\Java\jdk-1.8.0_201\";

            JavaVMInitArgs vm_args = JavaVMInitArgs.create(JNI.JNI_VERSION_1_8, 1);
            vm_args.set(0, options);

            int ret100 = JavaVM.GetDefaultJavaVMInitArgs(vm_args);
            Ref_JavaVM refJavaVM = new Ref_JavaVM();
            Ref_JNIEnv refJNIEnv = new Ref_JNIEnv();
            int rett = JavaVM.CreateJavaVM(refJavaVM, refJNIEnv, vm_args);
            JNIEnv jniEnv = refJNIEnv.getValue();

            JClass cls = jniEnv.FindClass("java.lang.Object");

        }
    }
}
