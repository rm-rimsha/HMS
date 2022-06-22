<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Patient Main</title>

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
form.appointmentForm{
ext-align: left;
background-color: #fff;
border-style: solid;
border-color: #091753;
border-width: 5px;
width: 700px;
height:250px;
margin-bottom:5px;
margin-top: 20px;
opacity: 0.7;
border-radius: 18px;
margin-left:110px;
}
fieldset{
position: relative;
width: 600px;
border: 0px;
}
h1{
font-family: verdana;
font-style: normal;
font-weight: bold;
font-size: 40px;
color: #091753;
margin-left:280px
}
h2{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 40px;
color: #091753;
margin-left: 15px;
margin-bottom: -10px;
margin-top:3px;
}
h3{
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 25px;
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
h5{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-top: 90px;
margin-bottom: -40px;
}
h6{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-top: -25px;
margin-bottom: 0px;
float:right;
margin-right:-45px;
}
h7{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 57px;
margin-top: 5px;
margin-bottom: 0px;
float:right;
margin-right:-143px;
}

button {  
            background-color: #091753;  
            color: white;  
            border:#091753 ;  
            cursor: pointer; 
            font-style:bold; 
            font-size:20px;
            width: 170px;
            height: 50px;  
            margin-top: 0px;
            margin-bottom: 0px;
            border-radius: 0px;
            font-family: Roboto;
             transition-duration: 0.4s;
             margin-left:420px;
            } 
            
 select{
 
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer; 
            font-style:bold; 
            font-size:30px;
            width: 330px;
            height: 50px;  
            margin-top: 0px;
            margin-bottom: 0px;
            border-radius: 0px;
            border-style:solid;
            font-family: Roboto;
            transition-duration: 0.4s;
            margin-left:290px;
             
 
 
 }
cancelAppointmentButton:button {
  transition-duration: 1.0s;
}

cancelAppointmentButton:hover {
  background-color: #091753;
  color: white;
}
        
button:hover {  

            opacity: 0.8;  
        }           
button.cancelAppointmentButton{
margin-top: -1000px;
}
div.formDiv{
text-align: right;
}
input
{
background-color: transparent;
border: none;
color: transparent;
cursor: default;
width: 0px;
font-size: 0px;
autocomplete: "false";
margin-left:290px;
}

</style>
</head>
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
<br>
<h1>APPOINTMENTS</h1>

<div class="dropdownn">
<select id = "whichAppointmentsSelect" name="whichAppointmentsSelect" onchange="selectOption()">
    <option value="today">Today</option>
    <option value="upcomingAppointments">Upcoming Appointments</option>
    <option value="previousAppointments">Previous Appointments</option>
    <option value="all">All</option>
  </select>
</div>

<form method = "post" id = "dropdownForm" action = "patientSelectOption">
<input class = "transparentInput" name = "whichAppointments" id = "whichAppointments">
</form>
<table>
<tbody>
<tr>
<td id = "appointmentsColumn">
</td>
<td>

</td>
</tr>
</tbody>
</table>
<script>
function selectOption(){
	var e = document.getElementById("whichAppointmentsSelect");
	var whichAppointments = e.options[e.selectedIndex].value;
	document.getElementById("whichAppointments").value = whichAppointments;
	document.getElementById("dropdownForm").submit();
}
function getFormCode(doctorId,doctorName,department,speciality,date,time,fee){
	var info = doctorId  + "," + date + "," + time + "," + "${whichAppointments}";
	var formCode;
	if("${whichAppointments}" == "previousAppointments"){
		formCode = "<form method = \"post\" class = \"appointmentForm\" style = \"text-align: left;\">" +
		"<fieldset style = \"width: 600px\">" +
		"<h2>Dr. " + doctorName + "</h2>" +
		"<h6>Date: " + date + "</h6>" +
		"<h7>Time: " + time + "</h7>"+
		"<h3> Department of " + department + "</h3>" + 
		"<h4>  " + speciality + "</h4>" +
		"<h5> Fee: Rs. " + fee + "</h5>"+
		"</fieldset>" +
		"</form>";
	}else{
	formCode = "<form method = \"post\" id = \"cancelAppointmentForm\" action = \"patientCancelAppointment\"" +
	"class = \"appointmentForm\" style = \"text-align: left;\">" +
	"<fieldset style = \"width: 600px\">" +
	"<h2> Dr." +doctorName + "</h2>" + 
	"<h6>Date: " + date + "</h6>" +
	"<h7>Time: " + time + "</h7>"+
	"<h3> Department of " + department + "</h3>" + 
	"<h4>  " + speciality + "</h4>" +
	"<h5> Fee: Rs. " + fee + "</h5>"+
	"</div>" +
		"<div style = \"text-align: right\">" +  
		"<button class = \"cancelAppointmentButton\" id=\"info\" type = \"submit\" name = \"info\" value = " + info + 
		" onclick = \"cancelAppointment()\" style = \"margin-left: 450px\" style = \"margin-top: 90px\">Cancel Appointment</button>" + 
	"</fieldset>" +
	"</form>";
	}
	return formCode;
}
function cancelAppointment(){
	 var val = confirm("Do you want to cancel the appointment?");
     if( val == true ) {
    	 document.getElementById("cancelAppointmentForm").submit();
     }else{
    	 document.getElementById("appointmentsColumn").innerHTML = text;
     }
}

var doctorIds = "${doctorIds}".split(',','${noOfAppointments}');
var doctorNames = "${doctorNames}".split(',','${noOfAppointments}');
var departments = "${departments}".split(',','${noOfAppointments}');
var doctorspecialities = "${doctorspecialities}".split(',','${noOfAppointments}');
var doctorfees = "${doctorfees}".split(',','${noOfAppointments}');
var dates = "${dates}".split(',','${noOfAppointments}');
var times = "${times}".split(',','${noOfAppointments}');
var text = "";
for(var counter = 0 ; counter < ${noOfAppointments} ; counter++){
	text += getFormCode(parseInt(doctorIds[counter]), doctorNames[counter],departments[counter],doctorspecialities[counter],dates[counter], times[counter].substring(0,5),doctorfees[counter] ,);
}
document.getElementById("appointmentsColumn").innerHTML = text;

mySelect = document.getElementById("whichAppointmentsSelect");
 for(var i, j = 0; i = mySelect.options[j]; j++) {
    if(i.value == "${whichAppointments}") {
        mySelect.selectedIndex = j;
        break;
    }
    
}  

</script>
</body>
</html>
