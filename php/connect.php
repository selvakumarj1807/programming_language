<?php

$con=new mysqli('localhost','root','','studentdetails');

if(!$con)
{
die(mysqli_error($con));
}
?>