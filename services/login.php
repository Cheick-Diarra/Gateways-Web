<?php
session_start();
$user_name=$_GET['email'];
$pwd=$_GET['password'];
include_once("qclass.php");
$obj=new qclass();
$r=$obj->loginCheck($user_name,$pwd);
$rec= mysqli_fetch_array($r);
$rows=mysqli_num_rows($r);
$output=array();
if($rows==1){
	$_SESSION['uid']=$rec[0];
	$_SESSION['cid']=$rec[4];
	$output['status']="true";
}
else{
		$output['status']="false";
}
echo json_encode($output);
?>