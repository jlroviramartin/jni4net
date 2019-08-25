<#import "/common.ftlh" as Common>
<#assign JNI=staticModels['es.jni4csharp.JNIUtils']>
<#assign Reflection=staticModels['es.jni4csharp.ReflectionUtils']>
namespace ${model.clazz.package.name}
{
    public class ${model.clazz.simpleName}<@Common.implements_extends model=model/>
    {
<#list model.publicAndDeclaredFields as field>

        ${Reflection.getModifiers(field)} ${field.type.name} ${method.name}
        {
            get
            {
            }
<#if !Reflection.isFinal(field)>
            set
            {
            }
        }
</#if>
</#list>
<#list model.publicAndDeclaredMethods as method>

        // ${method.toGenericString()}
        public const String ${JNI.getUniqueName(method)} = "${JNI.getMethodSignature(method)}";
    
        ${Reflection.getModifiers(method)} ${method.returnType.name} ${method.name}(<#list method.parameterTypes as type>${type.name} arg${type?index}<#sep>, </#list>) {
        }
</#list>
    }
}
