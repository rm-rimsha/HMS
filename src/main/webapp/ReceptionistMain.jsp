<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receptionist Main</title>
<link rel="stylesheet" href=  
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />  
<style>
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
	z-index: 999;
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
text-align: left;
background-color: #fff;
border-style: solid;
border-color: #091753;
border-width: 5px;
width: 650px;
margin-bottom:5px;
margin-top: 5px;
opacity: 0.8;
border-radius: 18px;
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
color: #fff;
}
h3{
font-family: verdana;
font-style: normal;
font-weight: bold;
font-size: 25px;
color: #091753;
margin-left: 15px;
margin-bottom: 0px;
}
h4{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 18px;
color: #091753;
margin-left: 15px;
margin-top: -40px;
margin-bottom: 30px;
}
h5{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
color: #091753;
margin-left: 15px;
margin-top: -25px;
margin-bottom: 10px;
}
button {  
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer;  
            width: 100px;
            height: 40px;  
            margin-top: 0px;
            margin-bottom: 0px;
            border-radius: 3px;
            font-family: Roboto;
            } 
        
button:hover {  
            opacity: 0.8;  
        } 
button.cancelAppointmentButton{
margin-top: 15px;
width: 150px;
height: 42px;
}
div.formDiv{
text-align: right;
}
button.profile{
width: 150px;
margin-top: 10px;
}
select{
position: relative;
width: 195px;
height: 30px;
background: #091753;
border-radius: 3px;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
color: #FFFFFF;
margin-left: 90px;
border: none;  
cursor: pointer; 
}
input.transparentInput{
background: transparent;
border: none;
color: transparent;
cursor: default;
width: 0px;
font-size: 0px;
autocomplete: "false";
}
</style>
</head>
<body>

<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<nav>
			<ul>
				<li><a href="receptionistHome">Home</a></li>
				<li><a href ="receptionistBookAppointments">Book Appointment</a></li>
				<li style = "margin-right: 180px;"><i
				style="padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;"
				class="fa">&#xf007;</i>
				<ul>
					<li><a href="receptionistViewProfile">View Profile</a></li>
					<li><a href="ReceptionistChangePassword.jsp">Change Password</a></li>
					<li><a href="ReceptionistLogin.jsp">Sign Out</a></li>
				</ul></li>
			</ul>
		</nav>
	</nav>
	</div>
<br>

<h1>Appointments</h1>
<hr>
<select id = "whichAppointmentsSelect" name="whichAppointmentsSelect" onchange="selectOption()">
    <option value="today">Today</option>
    <option value="upcomingAppointments">Upcoming Appointments</option>
    <option value="previousAppointments">Previous Appointments</option>
    <option value="all">All</option>
  </select>
<select id = "doctorNameSelect" name="doctorNameSelect" onchange = "selectOption()"></select>

<form method = "post" id = "dropdownForm" action = "receptionistSelectOption">
<input class = "transparentInput" name = "whichAppointments" id = "whichAppointments">
<input class = "transparentInput" name = "doctorUsername" id = "doctorUsername">
</form>
<br>
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
	var f = document.getElementById("doctorNameSelect");
	var doctorUsername = f.options[f.selectedIndex].value;
	document.getElementById("doctorUsername").value = doctorUsername;
	document.getElementById("dropdownForm").submit();
}
function getFormCode(patientId, patientName, date, time){
	var info = patientId + "," + "${doctorUsername}" + "," + date + "," + time + "," + "${whichAppointments}";
	var formCode;
	if("${whichAppointments}" == "previousAppointments"){
		formCode = "<form method = \"post\" class = \"appointmentForm\" style = \"text-align: left;\">" +
		"<fieldset style = \"width: 600px\">" +
		"<h3>" + patientName + "</h3>" + 
			"<div class = \"formDiv\">" + 
			"<br><br>" + 
			"<h4 style = \"text-align: left\">" + date + 
			"</h4><br>" + 
			"<h5 style = \"text-align: left\">" + time + 
			"</h5></div>" +
		"</fieldset>" +
		"</form>";
	}else{
	formCode = "<form method = \"post\" id = \"cancelAppointmentForm\" action = \"receptionistCancelAppointment\"" +
	"class = \"appointmentForm\" style = \"text-align: left;\">" +
	"<fieldset style = \"width: 600px\">" +
	"<h3>" + patientName + "</h3>" + 
		"<div class = \"formDiv\">" + 
		"<br><br>" + 
		"<button class = \"cancelAppointmentButton\" type = \"submit\" name = \"info\" value = " + info + 
		" onclick = \"cancelAppointment()\" style = \"margin-left: 458px\">Cancel Appointment</button>" + 
		"<h4 style = \"text-align: left\">" + date + 
		"</h4>" + 
		"<h5 style = \"text-align: left\">" + time + 
		"</h5></div>" +
	"</fieldset>" +
	"</form>";
	}
	return formCode;
}
function getOptionCode(doctorName, doctorUsername){
	var optionCode = "<option value=" + doctorUsername + ">" + doctorName + "</option>";
	return optionCode;
}
function cancelAppointment(){
	 var val = confirm("Do you want to cancel the appointment?");
     if( val == true ) {
    	 document.getElementById("cancelAppointmentForm").submit();
     }else{
    	 document.getElementById("appointmentsColumn").innerHTML = text;
     }
}

var patientIds = "${patientIds}".split(',','${noOfAppointments}');
var patients = "${patients}".split(',','${noOfAppointments}');
var dates = "${dates}".split(',','${noOfAppointments}');
var times = "${times}".split(',','${noOfAppointments}');
var text = "";
for(var counter = 0 ; counter < ${noOfAppointments} ; counter++){
	text += getFormCode(parseInt(patientIds[counter]), patients[counter], dates[counter], times[counter].substring(0,5));
}
document.getElementById("appointmentsColumn").innerHTML = text;

var doctorNames = "${doctorNames}".split(",");
var doctorUsernames = "${doctorUsernames}".split(",");
var optionText = "";
for(var counter = 0 ; counter < ${noOfDoctors} ; counter++){
	optionText += getOptionCode(doctorNames[counter], doctorUsernames[counter]);
}
document.getElementById("doctorNameSelect").innerHTML = optionText;

mySelect = document.getElementById("whichAppointmentsSelect");
 for(var i, j = 0; i = mySelect.options[j]; j++) {
    if(i.value == "${whichAppointments}") {
        mySelect.selectedIndex = j;
        break;
    }
} 
 mySelect1 = document.getElementById("doctorNameSelect");
 for(var i, j = 0; i = mySelect1.options[j]; j++) {
	    if(i.value == "${doctorUsername}") {
	        mySelect1.selectedIndex = j;
	        break;
	    }
	} 
</script>
</body>
</html>