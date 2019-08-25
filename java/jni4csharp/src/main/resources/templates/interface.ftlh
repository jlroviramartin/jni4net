<#import "/common.ftlh" as Common>
<#assign JNI=staticModels['es.jni4csharp.JNIUtils']>
<#assign Reflection=staticModels['es.jni4csharp.ReflectionUtils']>
namespace ${model.clazz.package.name}
{
    public interfaz ${model.clazz.simpleName}<@Common.implements_extends model=model/>
    {
<#list model.publicAndDeclaredMethods as method>

        ${Reflection.getModifiers(method)} ${method.returnType.name} ${method.name}(<#list method.parameterTypes as type>${type.name} arg${type?index}<#sep>, </#list>);
</#list>

#region ${model.clazz.simpleName}Impl
        public class ${model.clazz.simpleName}Impl : ${model.clazz.simpleName} {
<#list model.publicAndDeclaredMethods as method>

            // ${method.toGenericString()}
            public const String ${JNI.getUniqueName(method)} = "${JNI.getMethodSignature(method)}";

            ${Reflection.getModifiers(method)} ${method.returnType.name} ${method.name}(<#list method.parameterTypes as type>${type.name} arg${type?index}<#sep>, </#list>) {
            }
</#list>
        }
#endregion
    }
}
