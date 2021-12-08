<cfcomponent>
  <cfset this.name = "login">
  <cfset this.datasource = "contactBook">
  <cfset this.applicationTimeout  = createTimeSpan( 1, 0, 0, 0 )>
  <cfset this.sessionStorage  = true>
  <cfset this.sessionmanagement = true>
  <cfset this.sessionTimeout  = createTimeSpan( 0, 0, 10, 0 )>

  <cffunction name="onError" returnType="void" output="true">
      <cfargument name="exception" required="true">
      <cfargument name="eventname" type="string" required="true"> 
      We are so sorry. Something went wrong. We are working on it now.
      <form action="list.cfm" method="post">
        <input type="submit" value="Go Back to the main page" style="curser:pointer">
      </form>
  
  <cflog file="myapperrorlog" text="#exception.message#">
  
  <cfsavecontent variable="errortext">
    <cfoutput>
      An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br />
      Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br />
    </cfoutput>
  </cfsavecontent>
  </cffunction>

  <cffunction name="onSessionStart" returnType="void">
    <cfset session.login = 0>
    <cfset session.sign = 0>
  </cffunction>
</cfcomponent>