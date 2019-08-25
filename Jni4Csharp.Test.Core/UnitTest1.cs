// Copyright 2019 Jose Luis Rovira Martin
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
using es.jni;
using Jni;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Diagnostics;
using System.IO;

namespace Jni4Csharp.Test.Core
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
                "..", "..", "..", "..",
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

            es.jni.JavaVMOption options = new JavaVMOption();
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
            JavaVM javaVM = refJavaVM.getValue();
            JNIEnv jniEnv = refJNIEnv.getValue();

            JClass jclazz = jniEnv.FindClass("java/lang/Object");
            Debug.WriteLine("jclazz " + jclazz);

            GC(jniEnv);

            JMethodID jinit = jniEnv.GetMethodID(jclazz, "<init>", "()V");
            JObject jinstance = jniEnv.NewObject(jclazz, jinit, new JValue[0]);

            JObject jref = jniEnv.NewGlobalRef(jinstance);

            Test(jniEnv, jclazz);

            jniEnv.DeleteLocalRef(jclazz);
        }

        private void Test(JNIEnv jniEnv, JClass jclazz)
        {
            JMethodID jgetConstructors = jniEnv.GetMethodID(jclazz, "getConstructors", "()[Ljava.lang.reflect;");
            JObject ret = jniEnv.CallObjectMethod(jclazz, jgetConstructors, JValue.Empty);
            JObjectArray array = ret.toJObjectArray();
            foreach (JObject jobj in array.GetEnumerator(jniEnv))
            {

            }
        }

        public enum ElementType
        {
            Boolean, Char, Byte, Short, Int, Long, Float, Double, Object
        }


        private void GC(JNIEnv jniEnv)
        {
            JClass systemClass = jniEnv.FindClass("java/lang/System");
            JMethodID systemGCMethod = jniEnv.GetStaticMethodID(systemClass, "gc", "()V");
            jniEnv.CallStaticVoidMethod(systemClass, systemGCMethod, JValue.Empty);
        }
    }
}
