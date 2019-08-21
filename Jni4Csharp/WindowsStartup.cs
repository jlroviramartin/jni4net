using Jni4Csharp.Test.Core;
using System;
using System.Collections.Generic;
using System.Text;

namespace Jni
{
    public class WindowsStartup
    {
        public static void Config()
        {
            Config(
                @"C:\Program Files\Java\jdk-1.8.0_201\",
                @"C:\Proyectos_Local\csharp\publicos\Jni4Csharp\x64\Debug\");
        }

        public static void Config(String jdkPath, String jni4csharpPath)
        {
            NativeMethods.SetDefaultDllDirectories(NativeMethods.LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
            int ret1 = NativeMethods.AddDllDirectory($@"{jdkPath}\jre\bin\server");
            int ret2 = NativeMethods.AddDllDirectory($@"{jdkPath}\jre\bin\");
            int ret3 = NativeMethods.AddDllDirectory($@"{jdkPath}\bin\");
            int ret4 = NativeMethods.AddDllDirectory(jni4csharpPath);
        }
    }
}
