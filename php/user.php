<?php
include 'connect.php';
if(isset($_POST['submit']))
{
	$name=$_POST['name'];
	$phone=$_POST['phone'];
	$gender=$_POST['gender'];
	$district=$_POST['district'];
	
	$sql="INSERT INTO `contactus`(`name`,`phone`,`gender`,`district` )
			VALUES ('$name','$phone','$gender','$district')";
	 
	$result=mysqli_Query($con,$sql);
	if($result){//echo "data inserted successfully";
	header('location:display.php');
	}
	else{die(mysqli_error($con));}
}
?>
<html>
<head>
</head>
<body bgcolor = "lightgreen">
<a href = "display.php"><input type = "submit" value = "Student Details"></a>
<table border = "10" cellpadding = "20" cellspacing = "5" bgcolor = "pink" align = "center">
<td>
<form  action = "user.php" method = "POST" >
<label>Name</label><input type = "text" name = "name"><br>
<label>Gender</label><input type = "radio" name = "gender" value = "male">Male
<input type = "radio" name = "gender" value = "female">Female<br>
<label>Mobile Number</label><input type = "text" name = "phone"><br>
<label>District</label><select name = "district"><option>--select--</option><option>Dindigul</option><option>Trichy</option></select>
<br><br><a href = "user.php"><input type = "submit" value = "Submit"name="submit"></a>
<input type = "reset" value = "clear">

</form>
</td>
</body>
</html>