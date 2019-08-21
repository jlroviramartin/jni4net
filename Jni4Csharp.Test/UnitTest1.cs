using es.jni;
using Jni;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Reflection;

namespace Jni4Csharp.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            ALC.Startup();

            JavaVMInitArgs args = new JavaVMInitArgs();
            int ret = JavaVM.GetDefaultJavaVMInitArgs(args);
        }
    }
}
