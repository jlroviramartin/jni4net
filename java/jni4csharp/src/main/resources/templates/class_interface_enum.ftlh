<#if model.clazz.interface>
<#include "/interface.ftlh">
<#else if model.clazz.enum>
<#include "/enum.ftlh">
<#else>
<#include "/class.ftlh">
</#if>
