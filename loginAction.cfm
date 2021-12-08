<cfparam  name="session.login" default=0>
<cfset variables.flag = 0>
<cfset variables.obj = createObject("Component", "component/component")>
<cfset variables.myQuery = variables.obj.selectAll()>
<cfloop index="i" from="1" to="#myQuery.recordCount#">
    <cfif myQuery["username"][i] EQ form.uname AND myQuery["password"][i] EQ form.pass>
        <cfset session.admin=myQuery["name"][i]>
        <cfset session.sessionId=myQuery["uid"][i]>
        <cfset variables.flag = 1>
        <cfbreak>
    </cfif>
</cfloop>
<cfif variables.flag EQ 1>
    <cfset session.login = 1>
    <cflocation url = "list.cfm" addToken="no">
<cfelse>
    <cflocation url = "login.cfm" addToken="no">
</cfif>

