<cfset obj = createObject("component", "component/component")>
<cfset deleteContact = obj.deleteContact()>
<cflocation url = "list.cfm" addtoken="no">