<cfset obj = createObject("component", "component/component")>
<cfset excel = obj.excel()>
<cfspreadsheet action="write" fileName=#expandPath( 'new-example.xls' )# query="excel" overwrite=true >
<cfheader name="Content-Disposition" value="attachment; filename=Reporting.xls">
<cfcontent type="application/msword" file="#expandPath( 'new-example.xls' )#" deletefile="no">