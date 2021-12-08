<cfset session.login = 0>
<cfparam  name="form.name" default="">
<cfparam  name="form.pass" default="">

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Address Book</title>
	<link rel="icon"  href="img/logo.png">
	<link rel="stylesheet" type="text/css" href="css/styles-login.css">
	<script src="js/signup.js"></script>
</head>

<body>
    <div class="header">
        <div class="header_left">
            <img src="img/logo.png">
            <h3>ADDRESS BOOK</h3>
        </div>
        
        <div class="header_right">
                <img src="img/person.png">
                <a href="signup.cfm"><h4>Sign Up</h4></a>
                <img src="img/login.png">
                <a href="login.cfm"><h4>Login</h4></a>
        </div>
    </div>	
    <div class="Main-Sect">
        <div class="Login">
            <div class="LoginLeft">
                <img src="img/logo.png">
            </div>

            <div class="loginbox">
                <h1>LOGIN</h1>
                <form action="loginAction.cfm" method="post" autocomplete="off">
                    <div class="field">
                        <input type="text" name="uname" id="uname" placeholder=" ">
                        <label for="uname">Username</label>
                    </div>

                    <div class="field" id="field2">
                        <input type="password" name="pass" id="pass" placeholder=" ">
                        <label for="pass">Password</label>
                    </div>

                    <div class="Button">
                        <input type="Submit" name="Submit" value="Submit">
                    </div>

                    <div class="links">
                        <p>Or Sign In Using</p>
                        <img src="img/fb.png">
                        <img src="img/g+.png">
                    </div>
                    <div class="reg">
                        <p>Don't have an account?</p>
                        <a href="signup.cfm">Register Here</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>    

 