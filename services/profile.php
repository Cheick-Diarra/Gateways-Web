<?php
session_start();
$uid=$_SESSION['uid'];
include_once("qclass.php");
$obj=new qclass();
$r=$obj->getParticipant($uid);
$output=array();
$college=array();
$rec=mysqli_fetch_array($r);
$output['first_name']=$rec[1];
$output['last_name']=$rec[2];
$output['college']['id']=$rec[4];
$output['college']['name']=$rec[11];
$output['contact']=$rec[5];
$output['email']=$rec[6];
if($rec[9]==1)
$output['accomodation']=true;
else
$output['accomodation']=false;

header('Content-type:application/json');
echo json_encode($output);
?>