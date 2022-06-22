<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>SET DATE AND TIME</title>

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
text-align: left;
background-color: #fff;
border-style: solid;
border-color: #091753;
border-width: 5px;
width: 600px;
height:210px;
margin-bottom:20px;
margin-top: 5px;
opacity: 0.8;
border-radius: 18px;
margin-left:190px;
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


button {  
            background-color: #091753;  
            color: white;  
            border:#091753 ;  
            cursor: pointer; 
            font-style:bold; 
            font-size:20px;
            width: 170px;
            height: 50px;  
            margin-top: 30px;
            margin-bottom: 20px;
            border-radius: 0px;
            font-family: Roboto;
             transition-duration: 0.4s;
            } 
            
 select{
 
            background-color: #091753;  
            color: white;  
            border: solid;  
            cursor: pointer; 
            font-style:bold; 
            font-size:24px;
            width: 250px;
            height: 40px;  
            margin-top: 30px;
            margin-bottom: 0px;
            border-radius: 0px;
            border-style:solid;
            font-family: Roboto;
            transition-duration: 0.4s;
            margin-left:20px;
            border-style: solid;
             border-color: #fff;
            border-width: 5px;
            
             
 
 
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
input.transparentInput
{
background-color: transparent;
border: none;
color: transparent;
cursor: default;
font-size: 0px;
autocomplete: "false";
width: 0px;
height: 0px; 
}

</style>
</head>
<body>
<div id = "logo">

	</div>
<br>
<form method = "post" id = "dropdownForm" action = "departmentName">
<input class = "transparentInput" name = "dptn" id = "dptn">
</form>
<h1>SET DATE AND TIME</h1>
<table>
<tbody>
<tr>
<td id = "appointmentsColumn">
</td>
</tr>
</tbody>
</table>
<form method = "post" id = "dateSelectForm" action = "dateChanged">
<input class = "transparentInput" name = "selectedDate" id = "selectedDate">
<input class = "transparentInput" name = "dateSelectedId" id = "dateSelectedId">
<input class = "transparentInput" name = "timeSelectedId" id = "timeSelectedId">
<input class = "transparentInput" name = "doctorId" id = "doctorId" value = "${doctorId }">
<input class = "transparentInput" name = "timings" id = "timings" value = "${timings }">
</form>

<script>

if("${module}" == "receptionist"){
	document.getElementById("logo").innerHTML = 
		"<img src=\"https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768\" width=\"130\" height=\"100\" ALIGN=left>" +
	"<nav>"+
		"<nav>"+
			"<ul>"+
				"<li><a href=\"receptionistHome\">Home</a></li>"+
				"<li><a href =\"receptionistBookAppointments\">Book Appointment</a></li>"+
				"<li style = \"margin-right: 180px;\"><i"+
				"style=\"padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;\""+
				" class=\"fa\">&#xf007;</i>"+
				"<ul>"+
					"<li><a href=\"receptionistViewProfile\">View Profile</a></li>"+
					"<li><a href=\"ReceptionistChangePassword.jsp\">Change Password</a></li>"+
					"<li><a href=\"ReceptionistLogin.jsp\">Sign Out</a></li>"+
				"</ul></li>"+
			"</ul>"+
		"</nav>"+
	"</nav>"
}else{
	document.getElementById("logo").innerHTML = 
		"<img src=\"https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768\" width=\"130\" height=\"100\" ALIGN=left>" + 
	"<nav>"+
		"<nav>"+
			"<ul>"+
				"<li><a href=\"MainScreen\">Home</a></li>" +
				"<li><a href =\"getAppointment\">Get Appointment</a></li>" +
				"<li style = \"margin-right: 180px;\"><i" +
				"style=\"padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;\"" +
				" class=\"fa\">&#xf007;</i>" +
				"<ul>" +
					"<li><a href=\"PatientViewProfile\">View Profile</a></li>" +
					"<li><a href=\"PatientMedicalHistory\">Edit Profile</a></li>" +
					"<li><a href=\"editProfile\">View History</a></li>" +
					"<li><a href=\"PatientChangePassword.jsp\">Change Password</a></li>" +
					"<li><a href=\"PatientLogin.jsp\">Sign Out</a></li>" +
				"</ul></li>" +
			"</ul>" +
		"</nav>" +
	"</nav>"
}

function getTime(time){
	var setTime = "<option value=" + time + ">" + time + "</option>";
	return setTime;
}
function getDate(date){
	var setDate = "<option value=" + date + ">" + date + "</option>";
	return setDate;
}

function setDate(Day){
	var d="";
		if (Day == "monday") {
		 d = "${monday}".split(",");
	  }
	  else if(Day=="tuesday") {
		  d = "${tuesday}".split(",");
	  }
	  else if(Day=="wednesday") {
		   d= "${wednesday}".split(",");
	  }
	  else if(Day=="thursday") {
		  d = "${thursday}".split(",");
	  }
	  else if(Day=="friday") {
		  d = "${friday}".split(",");
	  }
	  else if(Day=="saturday") {
		  d = "${saturday}".split(",");
	  }
	  else if(Day=="sunday") {
		  d = "${sunday}".split(",");
	  }
	
	var dateText="<option value=\"\" disabled selected>Select Date</option>";
 	for(var i=0;i<d.length;i++){
		dateText+=getDate(d[i]);
	} 
	return dateText;
} 

function setTime(timings){
	var timeText = "<option value=\"\" disabled selected>Select Time</option>";
	for (var i = 0 ; i < timings.length ; i++){
		timeText += getTime(timings[i]);
	}
	return timeText;
}

function getFormCode(counter,Day, timings){
	var dateId = "dateSelect" + counter;
	var timeId = "timeSelect" + counter;
	var buttonId = "info" + counter;
	var info = "${doctorId}";
	var formCode = "<form class = \"appointmentForm\" id = \"appointmentForm\" action = \"bookAppointment\">" +
	"<fieldset>" +
	"<h2>" + Day + "</h2>" + 
	"<select id=" + dateId + " onchange=\"dateSelected("+counter+")\">" + setDate(Day) + "</select>"+
	"<select id=" + timeId + ">" + setTime(timings) + "</select>"+
		"<div>" + 
		"<button class = \"appointmentButton\" id = " + buttonId + " name = \"info\"" + 
		" onclick = \"btnClicked(" + counter + ")\" value = \"\"style = \"margin-left: 400px\">" + 
				"Book Appointment</button><br><br>" + 
		        
	"</fieldset>" +
	"</form>";
	return formCode;
}

function dateSelected(number){
	var selectId = "dateSelect" + number;
	var e = document.getElementById(selectId);
	var selection= e.options[e.selectedIndex].value;
	document.getElementById("selectedDate").value=selection;
	document.getElementById("dateSelectedId").value= selectId;
	document.getElementById("timeSelectedId").value= "timeSelect" + number;
	document.getElementById("dateSelectForm").submit();	
}

function btnClicked(number){
	var dateSelectId = "dateSelect" + number;
	var e = document.getElementById(dateSelectId);
	var selection= e.options[e.selectedIndex].value;
	var timeSelectId = "timeSelect" + number;
	var e1 = document.getElementById(timeSelectId);
	var selection1= e1.options[e1.selectedIndex].value;
	var buttonId = "info" + number;
	if(selection == "" || selection1 == ""){
		location.reload();
	}
	
	document.getElementById(buttonId).value += "${doctorId}"+","+ selection + "," + selection1;
	document.getElementById("appointmentForm").submit();	
}
 
var availableDays = "${availableDays}".split(",");
var timings = "${timings}".split(",");
var text = "";
for(var counter = 0 ; counter < ${noOfAvailDays} ; counter++){
	text += getFormCode(counter,availableDays[counter], timings);
}	
document.getElementById("appointmentsColumn").innerHTML = text;
if("${selectedDate}" != ""){
	mySelect = document.getElementById("${dateSelectId}");
	for(var i, j = 0; i = mySelect.options[j]; j++) {
	   if(i.value == "${selectedDate}") {
	       mySelect.selectedIndex = j;
	       break;
	   }
	}
	var changedTimings = "${changedTimings}".split(",");
	document.getElementById("${timeSelectId}").innerHTML = setTime(changedTimings);
	
}


</script>

</body>
</html>