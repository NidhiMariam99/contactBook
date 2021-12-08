<cfset variables.obj = createObject("component", "component/component")>
<cfset variables.userid= variables.obj.editContact()>
<cfdump var="#form#">
<cflocation  url="list.cfm" addToken="no"> 
