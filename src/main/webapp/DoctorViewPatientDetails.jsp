<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored = "false" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Details</title>
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

form{
position: relative;
margin-left: 0%;
width: 65%;
background-color: #fff;
border-radius: 18px;
text-align: center;
opacity: 0.7;
border-style: solid;
border-color: #091753;
border-width: 5px;
}

input.textBox{
position: relative;
width: 250px;
height: 30px;
background: #FFFFFF;
border-radius: 8px;
margin-top: 7px;
margin-bottom: 15px;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 17px;
color: #000000;
margin-right: 34%;
}
input.radioButton{
position: relative;
margin-top: 7px;
margin-bottom: 15px;
color: #000000;
width: 15px;
height: 15px;
}
h2{
padding-top: 10px;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 40px;
color: #091753;
}
h4{
margin-top: -30px;
padding-bottom: 12px;
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 20px;
color: #091753;
}
h1{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 35px;
}
label{
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 20px;
color: #091753;
}
label.radioLabel{
color: #1F2D50;
}
label.textboxLabel{
float: left;
text-align: left;
margin-left: 10%;
width: 145px;
margin-top: 15px;
margin-bottom: 15px;
}
table{
margin-left: 18%;
width: 68%;
}
textarea {
margin-top: 10px;
font-size: 12pt;
resize: none;
color: #000000;
border-radius: 5px;
}
button {  
            background-color: #091753;  
            color: white;  
            border: none;  
            cursor: pointer;  
            width: 100px;
            height: 40px;  
            margin-top: 0px;
            margin-bottom: 4px;
            border-radius: 3px;
            font-family: Roboto;
            } 
                    
button:hover {  
            opacity: 0.8;  
        }  

</style>
</head>
<body>
<div id = "logo">
	 <img src="https://www.freelogodesign.org/file/app/client/thumb/7060268f-c5ed-4d24-a832-b40638c8a6fe_200x200.png?1610129975768" width="130" height="100" ALIGN=left>
	<nav>
		<nav>
			<ul>
				<li><a href="doctorHome">Home</a></li>
				<li><a href ="doctorViewPatients">Appointment History</a></li>
				<li style = "margin-right: 180px;"><i
				style="padding-top: 20px; padding-left: 45px; padding-right: 60px; font-size: 30px; color: #fff;"
				class="fa">&#xf007;</i>
				<ul>
					<li><a href="doctorViewProfile">View Profile</a></li>
					<li><a href="DoctorChangePassword.jsp">Change Password</a></li>
					<li><a href="DoctorLogin.jsp">Sign Out</a></li>
				</ul></li>
			</ul>
		</nav>
	</nav>
	</div>
<form class = "infoForm" method = "post">
<h2>${name }</h2>
<h4>GENDER:	${gender }</h4>
<h4>AGE:	${age }</h4>
<h4>EMAIL:	${email }</h4>
<h4>CONTACT NUMBER:	0${contactNumber }</h4>
</form>
<br>

<form class = "patientHistoryForm" method = "post" action = "doctorSavePatientDetails" onsubmit = "collectData()">
<br><br>
<table style = "margin-left: 29%;">
<tbody>
<tr>
<td>
<label class = "textboxLabel" for="height" >HEIGHT(cm): </label>
</td>
<td>
<input class = "textBox" type = "number" name = "height" value = "${height }"><br>
</td>
</tr>

<tr>
<td>
<label class = "textboxLabel" for="weight"> WEIGHT(kg): </label>
</td>
<td>
<input class = "textBox" type = "number" name = "weight" value = "${weight }" style = "margin-top: 15px"><br>
</td>
</tr>

<tr>
<td>
<label class = "textboxLabel" for="bloodGroup"> BLOOD GROUP: </label>
</td>
<td>
<input class = "textBox" type = "text" name = "bloodGroup" maxlength = "3" value = "${bloodGroup }" style = "margin-top: 15px"><br>
</td>
</tr>
</tbody>
</table>


<label for="maritalStatus" style = "margin-left: 3%;">MARITAL STATUS: </label>
<input class = "radioButton" type="radio" id = "married" name="maritalStatus" value="married" style = "margin-top: 15px">
<label for="married" class = "radioLabel">Married</label>
<input class = "radioButton" type="radio" id = "unmarried" name="maritalStatus" value="unmarried" style = "margin-top: 15px">
<label for="unmarried" class = "radioLabel">Unmarried</label><br>
<br>
<label for="drugAllergies" style="font-weight: bold;">LIST ANY DRUG ALLERGIES</label><br>
<textarea name = "drugAllergies" maxlength = "500" style = "resize: none" rows="7" cols="70">${drugAllergies }</textarea><br>
<br>
<label style="font-weight: bold; text-decoration: underline;">DISEASES (CHECK ALL THAT APPLY): </label><br>

<table>
<tbody>
<tr style = "text-align: left;">
<td id = "column1">
</td>
<td id = "column2">
</td>
<td id = "column3">
</td>
</tr>
</tbody>
</table>

<script>
var diseases  = ["Anemia", "Asthma", "Arthritis", "Cancer", "Gout", "Diabetes", "Emotional Disorder", "Epilespy Seizures", 
				  "Fainting Spells", "GallStones", "Heart Disease", "Heart Attack", "Rheumatic Fever", "High Blood Pressure",
				  "Digestive Problems", "Ulcerative Colitis", "Ulcer Disease", "Hepatitis", "Kidney Disease", "Liver Disease", 
				  "Sleep Apnea", "Use a c-pap machine", "Thyroid Problems", "Tuberculosis", "Venereal Disease", "Neurological Disorders", 
				  "Bleeding Disorders", "Lung Disease", "Emphysema"];

var counter = 0;
var column = "";
diseases.forEach(displayCheckBoxes);

function displayCheckBoxes(item){
	if(counter % 3 == 0) column = "column1";
	if(counter % 3 == 1) column = "column2";
	if(counter % 3 == 2) column = "column3";
	document.getElementById(column).innerHTML += "<input type=\"checkbox\" name = \"disease\" value = " + item.replace(/\s/g, '') + 
			" id = " + item.replace(/\s/g, '') + " style = \"margin-top: 15px\"><label for=item class = \"radioLabel\">" + item + "</label><br>";
	counter++;
}
</script>
<br><br>
<label for="otherIllnesses" style="font-weight: bold;"> OTHER ILLNESSES</label><br>
<textarea name = "otherIllnesses" style = "resize: none" rows="3" cols="50">${otherIllnesses }</textarea><br><br>
<label for="operations" style="font-weight: bold;"> LIST ANY OPERATIONS WITH DATES</label><br>
<textarea name = "operations" style = "resize: none" rows="7" cols="70">${operations }</textarea><br><br>
<label for="currentMedications" style="font-weight: bold;"> LIST ALL CURRENT MEDICATIONS</label><br>
<textarea name = "currentMedications" style = "resize: none" rows="7" cols="70">${currentMedications }</textarea><br>
<h1>HEALTHY AND UNHEALTHY HABITS</h1>

<label for="exercise" style="font-weight: bold; text-decoration: underline;"> EXERCISE </label><br>
<input class = "radioButton" type="radio" id = "noExercise" name="exercise" value="noExercise" style = "margin-top: 10px">
<label for="never" class = "radioLabel">Never</label>
<input class = "radioButton" type="radio" id = "1-2 days" name="exercise" value="1-2 days" style = "margin-top: 10px">
<label for="1-2 days" class = "radioLabel">1-2 Days</label>
<input class = "radioButton" type="radio" id = "3-4 days" name="exercise" value="3-4 days" style = "margin-top: 10px">
<label for="3-4 days" class = "radioLabel">3-4 Days</label>
<input class = "radioButton" type="radio" id = "5+ days" name="exercise" value="5+ days" style = "margin-top: 10px">
<label for="5+ days" class = "radioLabel">5+ Days</label><br>
<br>
<label for="diet" style="font-weight: bold; text-decoration: underline;"> DIET </label><br>
<input class = "radioButton" type="radio" id="looseDiet" name="diet" value="looseDiet" style = "margin-top: 10px">
<label for="looseDiet" class = "radioLabel">Loose Diet</label>
<input class = "radioButton" type="radio" id="strictDiet" name="diet" value="strictDiet" style = "margin-top: 10px">
<label for="strictDiet" class = "radioLabel">Strict Diet</label>
<input class = "radioButton" type="radio" id="noDietPlan" name="diet" value="noDietPlan" style = "margin-top: 10px">
<label for="noDietPlan" class = "radioLabel">No diet plan</label><br>
<br>
<label for="alcoholConsumption" style="font-weight: bold; text-decoration: underline;"> ALCOHOL CONSUMPTION</label><br>
<input class = "radioButton" type="radio" id="noAlcoholConsumption" name="alcoholConsumption" value="noAlcoholConsumption" style = "margin-top: 10px">
<label for="never" class = "radioLabel">Never</label>
<input class = "radioButton" type="radio" id="1-2 glasses/day" name="alcoholConsumption" value="1-2 glasses/day" style = "margin-top: 10px">
<label for="1-2 glasses/day" class = "radioLabel">1-2 Glasses/Day</label>
<input class = "radioButton" type="radio" id="3-4 glasses/day" name="alcoholConsumption" value="3-4 glasses/day" style = "margin-top: 10px">
<label for="3-4 glasses/day" class = "radioLabel">3-4 Glasses/Day</label>
<input class = "radioButton" type="radio" id="5+ glasses/day" name="alcoholConsumption" value="5+ glasses/day" style = "margin-top: 10px">
<label for="5+ glasses/day" class = "radioLabel">5+ Glasses/Day</label><br>
<br>
<label for="caffeineConsumption" style="font-weight: bold; text-decoration: underline;"> CAFFEINE CONSUMPTION </label><br>
<input class = "radioButton" type="radio" id="noCaffeineConsumption" name="caffeineConsumption" value="noCaffeineConsumption" style = "margin-top: 10px">
<label for="never" class = "radioLabel">Never</label>
<input class = "radioButton" type="radio" id = "1-2 cups/day" name="caffeineConsumption" value="1-2 cups/day" style = "margin-top: 10px">
<label for="1-2 cups/day" class = "radioLabel">1-2 Cups/Day</label>
<input class = "radioButton" type="radio" id="3-4 cups/day" name="caffeineConsumption" value="3-4 cups/day" style = "margin-top: 10px">
<label for="3-4 cups/day" class = "radioLabel">3-4 Cups/Day</label>
<input class = "radioButton" type="radio" id="5+ cups/day" name="caffeineConsumption" value="5+ cups/day" style = "margin-top: 10px">
<label for="5+ cups/day" class = "radioLabel">5+ Cups/Day</label><br>
<br>
<label for="smoking" style="font-weight: bold; text-decoration: underline;"> SMOKING </label><br>
<input class = "radioButton" type="radio" id="noSmoking" name="smoking" value="noSmoking" style = "margin-top: 10px">
<label for="never" class = "radioLabel">Never</label>
<input class = "radioButton" type="radio" id="0-1 packs/day" name="smoking" value="0-1 packs/day" style = "margin-top: 10px">
<label for="0-1 packs/day" class = "radioLabel">0-1 Packs/Day</label>
<input class = "radioButton" type="radio" id="1-2 packs/day" name="smoking" value="1-2 packs/day" style = "margin-top: 10px">
<label for="1-2 packs/day" class = "radioLabel">1-2 Packs/Day</label>
<input class = "radioButton" type="radio" id ="2+ packs/day" name="smoking" value="2+ packs/day" style = "margin-top: 10px">
<label for="2+ packs/day" class = "radioLabel">2+ Packs/Day</label><br>
<br><BR>
<label for="investigationHistory" style="font-weight: bold;"> INVESTIGATION HISTORY</label><br>
<textarea name = "investigationHistory" style = "resize: none" rows="7" cols="70">${investigationHistory }</textarea><br><br>
<label for="otherComments" style="font-weight: bold;"> OTHER COMMENTS </label><br>
<textarea name = "otherComments" style = "resize: none" rows="7" cols="70">${otherComments}</textarea><br>
<br>
<button id = "diseasesData" name = "diseasesData" type = "submit">Save Form</button>
<br><br><br><br>
</form>
<script>
document.getElementById("${maritalStatus}").checked = true
document.getElementById("${exercise}").checked = true
document.getElementById("${diet}").checked = true
document.getElementById("${alcoholConsumption}").checked = true
document.getElementById("${caffeineConsumption}").checked = true
document.getElementById("${smoking}").checked = true

var diseases = "${diseases}".split(',');
diseases.forEach(checkDisease);
function checkDisease(item){
	document.getElementById(item).checked = true
}

function collectData(){
	var diseasesData = "";
	var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
	for (var i = 0; i < checkboxes.length; i++) {
	  diseasesData += checkboxes[i].value + ", ";
	}
	diseasesData = diseasesData.slice(0, -1);
	diseasesData = "${patientId}_" + diseasesData;
	document.getElementById("diseasesData").value = diseasesData;
}
</script>

</body>
</html>