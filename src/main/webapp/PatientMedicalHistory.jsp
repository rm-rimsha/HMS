<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View History</title>
<link rel="stylesheet" href=  
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />  
<style type="text/css">


body {
	background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)),
		url(https://cdn.internationalliving.com/wp-content/uploads/2014/11/L3-4-768x573.jpg);
	background-size: 1536px 721px;
	background-repeat: no-repeat;
	background-attachment: fixed;
	position: relative;
}

nav {
	width: 100%;
	height: 100px;
	background-color: #0001;
	line-height: 70px;
	left: 0px;
}

nav ul {
	display: flex;
	justify-content: flex-end;
	float: right;
	margin-right: 30px;
}

nav ul li {
	list-style-type: none;
	display: inline-block;
	position: relative;
}

nav ul li:hover {
	text-decoration: underline;
	background-color: #091753;
	transition: 0.8s all;
}

li.active {
	text-decoration: underline;
	background-color: #091753;
	color: #091753;
}

nav ul li ul {
	position: absolute;
	background-color: #0001;
	top: 84px;
	padding-left: 0px;
	display: block;
	width: 370px;
	transition: 0.5s;
	visibility: hidden;
	font-size: 25px;
}

nav ul li:hover ul {
	opacity: 1;
	visibility: visible;
}

a {
	text-decoration: none;
	color: #fff;
	padding: 30px;
	font-size: 35px;
	font-family: verdana;
}
form.prescriptionForm{
text-align: left;
background-color: #fff;
border-style: solid;
border-color: #091753;
border-width: 5px;
width: 500px;
height:150px;
margin-bottom:20px;
margin-top: 5px;
opacity: 0.7;
border-radius: 18px;
margin-left:140px;
}
fieldset{
position: relative;
width: 600px;
border: 0px;
}
h2{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 30px;
color: #091753;
margin-left: 15px;
margin-bottom: -5px;
margin-top:3px;
}
h3{
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
color: #091753;
margin-left: 15px;
margin-bottom: -8px;
margin-top:5px;
}
h4{
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-top: 7px;
margin-bottom: 0px;
}

span{
color: #fff;
font-size: 23px;
font-family: verdana;
padding-top: 50px;

}

b{
color: #fff;
font-size: 23px;
font-family: verdana;
padding-top: 50px;
margin-right: -150px;
}

#box
{
    width: 1000px;
	height: 2000px;
	margin-top: 50px;
	margin-left: 20px;
	background-color: #0001;
	position: relative;
}

h1
{
color: #091753;
font-size: 40px;
text-align:center;
padding-top:20px; 
}
th,
td
{
padding-top: 20px;
padding-left: 40px;
font-size:25px;
color: #fff;
width:250px;
}
#box table, tr
{
padding-top: 50px;
table-layout:fixed;
width:900px;
}

</head>
</style>


<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<nav>
			<ul>
				<li><a href="home">Home</a></li>
				<li><a href ="getAppointment">Get Appointment</a></li>
				<li style = "margin-right: 180px;"><i
				style="padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;"
				class="fa">&#xf007;</i>
				<ul>
					<li><a href="PatientViewProfile">View Profile</a></li>
					<li><a href="editProfile">Edit Profile</a></li>
					<li><a href="PatientMedicalHistory">View History</a></li>
					<li><a href="PatientChangePassword.jsp">Change Password</a></li>
					<li><a href="PatientLogin.jsp">Sign Out</a></li>
				</ul></li>
			</ul>
		</nav>
	</nav>
	</div>
	<div id="box">
	<h1>MEDICAL HISTORY</h1>
	<table>
	<tr>
	<td><b>BLOOD GROUP:</b></td>
	<td><span>${bloodGroup}</span></td>
	</tr>
	<tr>
	<td><b>HEIGHT:</b></td>
	<td><span>${height} (cm)</span></td>
	</tr>
	<tr>
	<td><b>WEIGHT:</b></td>
	<td><span>${weight} (kg)</span></td>
	</tr>
	<tr>
	<td><b>MARITAL STATUS:</b></td>
	<td><span>${maritalStatus}</span></td>
	</tr>	
	<tr>
	<td><b>OPERATIONS:</b></td>
	<td><span>${operations}</span></td>
	</tr>
	<tr>
	<td><b>EXERCISE:</b></td>
	<td><span>${exercise} </span></td>
	</tr>
	<tr>
	<td><b>DIET:</b></td>
	<td><span>${diet} </span></td>
	</tr>
	<tr>
	<td><b>ALCOHOL CONSUMPTION:</b></td>
	<td><span>${alcoholConsumption}</span></td>
	</tr>
	<tr>
	<td><b>CAFFIENE CONSUMPTION:</b></td>
	<td><span>${caffeineConsumption}</span></td>
	</tr>
	<tr>
	<td><b>SMOKING:</b></td>
	<td><span>${smoking}</span></td>
	</tr>
	<tr>
	<td><b>DRUG ALLERGIES:</b></td>
	<td><span>${drugAllergies}</span></td>
	</tr>
	<tr>
	<td><b>DISEASES:</b></td>
	<td><span>${diseases}</span></td>
	</tr>
	<tr>
	<td><b>OTHER ILLNESSES:</b></td>
	<td><span>${otherIllnesses}</span></td>
	</tr>
	<tr>
	<td><b>CURRENT MEDICATIONS:</b></td>
	<td><span>${currentMedications}</span></td>
	</tr>
	<tr>
	<td><b>INVESTIGATION HISTORY:</b></td>
	<td><span>${investigationHistory}</span></td>
	</tr>
	<tr>
	<td><b>OTHER COMMENTS:</b></td>
	<td><span>${otherComments}</span></td>
	</tr>
	</table>
<table>
<tbody>
<tr>
<td id = "prescriptionsColumn">
</td>
</tr>
</tbody>
</table>

<script>
function getFormCode(doctorName,Date,Prescription){
	var formCode = "<form class = \"prescriptionForm\">" +
	"<fieldset>" +
	"<h2>Dr. " + doctorName + "</h2>" + 
	"<h3 style = \"text-align: left\">" + Date + 
	"</h3>" + 
	"<h4 style = \"text-align: left\">Prescription: " + Prescription + 
	"</h4>" + 
	"</fieldset>" +
	"</form>"; 
	return formCode;
}
var doctorName = "${doctorNames}".split(',');
var date = "${dates}".split(',');
var prescription = "${prescriptions}".split(',');
var text = "";

for(var counter = 0 ; counter < ${noOfCheckups} ; counter++){
	text += getFormCode(doctorName[counter], date[counter], prescription[counter]);
}
document.getElementById("prescriptionsColumn").innerHTML = text;
</script>
</div>
</body>

</html>