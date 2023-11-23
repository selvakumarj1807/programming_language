<?php
include 'connect.php';
?>
<html>
<head>
</head>
<body bgcolor = "lightgreen">
<a href = "display.php"><input type = "submit" value = "Student Details"></a><br><br><br>
<a href = "user.php"><input type = "submit" value = "BACK to HOME"></a>

<table border = "10" cellpadding = "20" cellspacing = "5" bgcolor = "pink" align = "center">
<thead>
<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Gender</th>
		<th>Mobile Number</th>
		<th>District</th>
		<th colspan="2">Actions</th>

		
</tr>
</thead>
<tbody>
<?php
$sql="Select * from `contactus`";
$result=mysqli_query($con,$sql);

if($result)
{
	while($row=mysqli_fetch_assoc($result))
	{
		$id=$row['id'];
		$name=$row['name'];
		$phone=$row['phone'];
		$gender=$row['gender'];
		$district=$row['district'];
	


				echo   '<tr>
					        <th>'.$id.'</td>
							<td>'.$name.'</td>
					
					        <td>'.$phone.'</td>
							<td>'.$gender.'</td>
							<td>'.$district.'</td>
							
							
			
				   
				 
					<td><button><a href="update.php?updateid='.$id.'">Edit</a></button> </td>
					<td><button ><a href="delete.php?deleteid='.$id.'">Remove</a></button></td>
					
					</tr>';
					
					}
					}
					?>
</body>
</html>