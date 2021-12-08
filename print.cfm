<cfset obj = createObject("component", "component/component")>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Printing Contacts</title>
    </head>
    
    <body>
        <cfset check = obj.print()>
        <table class="detailsTable" border="1" style="margin-right:auto;margin-left:auto;" >
            <tr class="tableHeading">
                <th >Name</th>
                <th >Gender</th>
                <th >DOB</th>
                <th >Address</th>
                <th >Street</th>
                <th >Pincode</th>
                <th >Email Id</th>
                <th >Phone No:</th>
            </tr>
        
            <cfoutput query="check">
                <tr>
                <td>#check.firstname#</td>
                <td>#check.gender#</td>
                <td>#check.dob#</td>
                <td>#check.address#</td>
                <td>#check.street#</td>
                <td>#check.pincode#</td>
                <td>#check.email#</td>
                <td>#check.phone#</td>
                </tr>
            </cfoutput>
        </table> 
      
        <script>
            function view()
            {
                window.print();
            }
            window.onload = view;
        </script>
    </body>
</html>