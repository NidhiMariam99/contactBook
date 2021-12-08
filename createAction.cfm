<cfset variables.obj = createObject("component", "component/component")>
<cfset variables.createContact = variables.obj.AddContact()>
<cfset userid=obj.pdf()>
<cfset variables.id=userid.id>
<cffile action="upload" fileField="form.photo" destination="#expandpath("./uploadimages/#variables.id#.jpg")#"  
accept= "image/jpeg" result="fileUpload" nameconflict="MakeUnique">
<cflocation  url="list.cfm" addToken="no">
