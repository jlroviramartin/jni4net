using System;
using System.Reflection;
using System.Runtime.Loader;

namespace Jni
{
    public class ALC : AssemblyLoadContext
    {
        public static Assembly Startup()
        {
            ALC alc = new ALC();
            Assembly assembly = alc.LoadFromAssemblyName(new AssemblyName("Jni4Csharp"));
            return assembly;
        }

        protected override Assembly Load(AssemblyName assemblyName)
        {
            if (assemblyName.Name.ToUpper().Equals("Jni4Csharp".ToUpper()))
            {
                return LoadFromAssemblyPath(@"C:\Proyectos_Local\csharp\publicos\jni4net\Jni\bin\Debug\netstandard2.0\Jni4Csharp.dll");
            }
            // Return null to fallback on default load context
            return null;
        }

        protected override IntPtr LoadUnmanagedDll(string unmanagedDllName)
        {
            if (unmanagedDllName.ToUpper().Equals("Jni4CsharpDll".ToUpper()))
            {
                return LoadUnmanagedDllFromPath(@"C:\Proyectos_Local\csharp\publicos\jni4net\x64\Debug\Jni4CsharpDll.dll");
            }
            return base.LoadUnmanagedDll(unmanagedDllName);
        }
    }
}
