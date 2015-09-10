<?php
$first_name=$_GET["first_name"];
$last_name=$_GET["last_name"];
$gender=$_GET["gender"];
$college_id=$_GET["college_id"];
$contact=$_GET["contact"];
$email=$_GET["email"];
$passwaord=$_GET["password"];
$accomadation=$_GET["accomodation"];

include_once("qclass.php");
$obj=new qclass();
$check=$obj->emailCheck($email);
$result=mysqli_num_rows($check);
$output=array();
if($result==0){
	$r=$obj->insertParticipant($first_name,$last_name,$gender,$college_id,$contact,$email,$passwaord,$accomadation);
	if($r==1){
		$output['status']="1";//successfully registered
	}
	else{
		$output['status']="2";//insertion failed
	}
}
else{
		$output['status']="3";//insertion failed due to email id cheking	
}
	echo json_encode($output);
?>