<cfparam  name="session.login" default=0>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Address Book</title>
		<link rel="icon" href="img/logo.png">
		<link rel="stylesheet" type="text/css" href="css/styles-list.css">
		<script src="js/script.js"></script>
		<script src="js/create.js"></script>
		<script src="js/edit.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	</head>
	<body>
		<cfoutput>
			<cfif session.login EQ 0>
				<cflocation  url="login.cfm" addToken=0>
			</cfif>

			<div class="header">
            <div class="header_left">
                <img src="img/logo.png">
                <h3>ADDRESS BOOK</h3>
            </div>
            
            <div class="header_right">
                <img src="img/logout.png">
                <a href="login.cfm"><h4>Logout</h4></a>
            </div>
        </div>
        
        <div class="Main-Sect">
            <div class="functions">
                <div class="functions-right">
                    <a href="pdfAction.cfm"><img src="img/pdf.png" alt="pdf"></a>
                    <a href="excelAction.cfm"><img src="img/xls.png" alt="excel"></a>
                    <a href="print.cfm"><img src="img/print.png" alt="print"></a>
                </div>
            </div>

			<div class="details">
                <div class="userBox">
                    <img src="img/people1.png" alt="people">
                    <h3>#session.admin#</h3>
                    <button id="continue" onclick="openForm()">CREATE CONTACT</button>
                </div>
                
                <div class="contactList">
                    <table>
                        <tr>
                            <th></th>
                            <th>NAME</th>
                            <th>EMAIL ID</th>
                            <th>PHONE NUMBER</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
						<cfset variables.obj = createObject("component", "component/component")>
						<cfset variables.contactList = variables.obj.contactList()>
						<cfloop index="i" from="1" to="#contactList.recordCount#">
							<tr>
								<!---td>
                                    <cfif contactList["gender"][i] EQ "Male">
                                        <img src="img/male.png" alt="Male">
                                    <cfelseif contactList["gender"][i] EQ "Female">
                                        <img src="img/female.png" alt="Female">
                                    <cfelse>
                                        <img src="img/people1.png" alt="people">
                                    </cfif>
                                </td--->
								<cfdump var="#contactList.photo[i]#">
								<td><img src=".\uploadimages\#contactList.photo[i]#.jpg" alt="image"></td>
								<td class="name">#contactList["firstname"][i]# #contactList["lastname"][i]#</td>
								<td>#contactList["email"][i]#</td>
								<td>#contactList["phone"][i]#</td>
								<td><button type="continue" id="#contactList["id"][i]#"  onclick="openForm(); editContact(this.id)">EDIT</button></td>
								<td><button type="continue" onclick="deleteForm(); deleteContact(#contactList["id"][i]#)">DELETE</button></td>
								<td><button type="continue" onclick="viewForm(); viewContact(#contactList["id"][i]#)">VIEW</button></td>
							</tr>
						</cfloop>
					</table>
				</div>
			</div>

			<div class="bg-modal" id="CreateEditForm">
				<div class="modal-content">
					<button class="close" onclick="closeForm()">+</button>
					<div class="boxCreate">
						<div class="formRight">
							<div class="formHeader">
								<h3 id="CreateEditHead">CREATE CONTACT</h3>
							</div>
							<form action= "createAction.cfm" name="ceForm" id="ceForm" method="post" enctype="multipart/form-data">
								<div class="formBody">
									<h4>Personal Contact</h4>
									<div class="flex personalContact">
										<div>
											<h5>Title *</h5>
											<select name="title" id="title" onchange="return titleValidate()">
												<option ></option>
												<option value="Miss">Miss</option>
												<option value="Mr">Mr</option>
												<option value="Mrs">Mrs</option>
											</select>
										</div>
										<div>
											<h5>First Name *</h5>
											<input type="text" placeholder="First Name" id="fname" name="fname" onchange="fnameValidate()">
										</div>
										<div>
											<h5>Last Name *</h5>
											<input type="text" placeholder="Last Name" id="lname" name="lname" onchange="lnameValidate()">
										</div>
									</div>
									<div class="flex personalContact">
										<div>
											<h5>Gender *</h5>
											<select name="Gender" id="gender" name="gender" onchange="genderValidate()">
												<option ></option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
												<option value="Other">Other</option>
											</select>
										</div>
										<div>
											<h5>Date Of Birth *</h5>
											<input type="Date" placeholder="DOB" class="address" id="dob" name="dob" onchange="dobValidate()">
										</div>
									</div>
									<div class="flex personalContact">
										<div>
											<h5>Upload Photo</h5>
											<input type="file" id="photo" name="photo">
										</div>
									</div>
								</div>
								<div class="formBody">
									<h4>Contact Details</h4>
									<div class="flex personalContact">
										<div>
											<h5>Address *</h5>
											<input type="text" placeholder="Your Address" class="address" id="address" name="address" onchange="addressValidate()">
										</div>
										<div>
											<h5>Street *</h5>
											<input type="text" placeholder="Your Street Name" class="address" id="street" name="street" onchange="streetValidate()">
										</div>
									</div>
									<div class="flex personalContact">
										<div>
											<h5>Pin Code *</h5>
											<input type="number" placeholder="Your Pin Code" class="address" id="pincode" name="pincode" onchange="pinValidate()">
										</div>
										<div>
											<h5>Email *</h5>
											<input type="email" placeholder="Your Email" class="address" id="email" name="email" onchange="emailValidate()">
										</div>
									</div>
									<div class="flex personalContact">
										<div>
											<h5>Phone Number *</h5>
											<input type="number" placeholder="Your Phone Number" class="address" id="phone" name="phone" onchange="phoneValidate()">
										</div>
									</div>
								</div>
								<input type="hidden" name="ceId" id="ceId">
								<input type="submit" value="CREATE" id="createButton" class="createButton" onclick="return createValidate()">
							</form>
						</div>
						<img src="img/person.png" name="preview" id="preview">    
					</div>
				</div>
			</div>
			<script src="js/script.js"></script>

			<div class="delete-contact" id="deleteForm">
				<div class="delete-content">
					<form action="deleteAction.cfm" method="post" autocomplete="off">
						<h5>Are you Sure want to delete?</h5>
						<input type="hidden" name="deleteId" id="deleteId">
						<input type="submit" value="Yes" name="yes" class="deleteButton">
						<input type="button" value="No" name="no" class="deleteButton" onclick="closeDelete()">
					</form>
				</div>
			</div>

			<div class="bg-modal3" id="viewForm">
				<div class="modal-content3">
					<div class="boxView">
						<div class="formRight">
							<div class="formHeader">
								<h3>CONTACT DETAILS</h3>
							</div>
							<div class="viewData">
								<div class="viewName">
									<h5>Name</h5>
									<p>:</p>
									<h6 class="inserttitle"></h6>.
									<h6 class="insertFName"></h6>
									<h6 class="insertLName"></h6>
								</div>
								<div class="viewGender">
									<h5>Gender</h5>
									<p>:</p>
									<h6 class="insertGender"></h6>
								</div>
								<div class="viewDob">
									<h5>Date of Birth</h5>
									<p>:</p>
									<h6 class="insertDob"></h6>
								</div>
								<div class="viewAddress">
									<h5>Address</h5>
									<p>:</p>
									<h6 class="insertAddress"></h6>,
									<h6 class="insertStreet"></h6>
								</div>
								<div class="viewPincode">
									<h5>Pincode</h5>
									<p>:</p>
									<h6 class="insertPincode"></h6>
								</div>
								<div class="viewEmail">
									<h5>Email Id</h5>
									<p>:</p>
									<h6 class="insertEmail"></h6>
								</div>
								<div class="viewPhone">
									<h5>Phone</h5>
									<p>:</p>
									<h6 class="insertPhone"></h6>
								</div>
								<input type="submit" value="CLOSE" class="closeButton" onclick="closeView()">
							</div>    
						</div> 
						<!---cfif "#insertDob#" EQ "Male">
							<img src="img/male.png" alt="Male">
						<cfelseif "#insertDob#" EQ "Female">
							<img src="img/female.png" alt="Female">
						<cfelse>
							<img src="img/people1.png" alt="people">
						</cfif--->
						<img src="img/person.png" id="viewimage">    
					</div>
				</div>
			</div>
			<script src="js/script.js"></script>

		</cfoutput>
    </body>
</html>