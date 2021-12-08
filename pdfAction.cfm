<cfdocument format="PDF" filename="tablePDF.pdf" overwrite="Yes">
    <cfset obj = createObject("component", "component/component")>
    <cfset pdf = obj.pdf()>
    <table class="detailsTable" border="1" style="margin-right:auto;margin-left:auto;">
        <tr class="tableHeading">
            <th>Name</th>
            <th>Gender</th>
            <th>DOB</th>
            <th>Address</th>
            <th>Street</th>
            <th>Pincode</th>
            <th>Email Id</th>
            <th>Phone No.</th>
        </tr>    
        <cfoutput query="pdf">
            <tr>
                <td>#pdf.firstname# #pdf.lastname#</td>
                <td>#pdf.gender#</td>
                <td>#pdf.dob#</td>
                <td>#pdf.address#</td>
                <td>#pdf.street#</td>
                <td>#pdf.pincode#</td>
                <td>#pdf.email#</td>
                <td>#pdf.phone#</td>
            </tr>
        </cfoutput>
    </table>
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=tablePDF.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\tablePDF.pdf" deletefile="Yes">
<cflocation  url="list.cfm"> 