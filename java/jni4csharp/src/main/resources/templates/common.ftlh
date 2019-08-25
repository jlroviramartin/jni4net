<#macro implements_extends model>
<#list model.extendsAndImplements>: <#items as other>${other.name}</#items><#sep>, <#else></#list>
</#macro>
