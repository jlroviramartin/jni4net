using Jni4Csharp.Test.Core;
using System;
using System.Diagnostics;

namespace Jni
{
    public static class WindowsStartup
    {
        public static void Config(String jdkPath, String jni4csharpDllPath)
        {
            bool bret;
            bret = NativeMethods.SetDefaultDllDirectories(NativeMethods.LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
            AssertNoError(!bret);

            int iret;
            iret = NativeMethods.AddDllDirectory($@"{jdkPath}\jre\bin\server");
            AssertNoError(iret == 0);

            iret = NativeMethods.AddDllDirectory($@"{jdkPath}\jre\bin\");
            AssertNoError(iret == 0);

            iret = NativeMethods.AddDllDirectory($@"{jdkPath}\bin\");
            AssertNoError(iret == 0);

            iret = NativeMethods.AddDllDirectory(jni4csharpDllPath);
            AssertNoError(iret == 0);
        }

        private static void AssertNoError(bool error)
        {
            if (error)
            {
                String msg = "Error: " + NativeMethods.GetLastError();
                Debug.WriteLine(msg);
                throw new Exception(msg);
            }
        }
    }
}
