<cfset variables.flag = 0>
<cfset session.set = 0>
<cfquery name="result" datasource="cfsql">
    SELECT * FROM login where Username="#url.uname#"
</cfquery>

<cfif result.recordcount NEQ 0>
    <cfset variables.flag = 1>
</cfif>
// <cfloop index="i" from="1" to="#result.recordCount#">
//     <cfif result["email"][i] EQ url.mail>
//         <cfset variables.flag = 1>
//         <cfbreak>
//     </cfif>
// </cfloop>

<cfif variables.flag EQ 0>
    0
    <cfset session.set = 0>
<cfelse>
    1
    <cfset session.set = 1>
</cfif>
        