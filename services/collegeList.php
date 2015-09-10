<?php

include_once("qclass.php");
$obj=new qclass();
$r=$obj->getAllColleges();
$output=array();
$i=0;
while($rec=mysqli_fetch_array($r)){
$output[$i]['id']=$rec[0];
$output[$i]['name']=$rec[1];
$i=$i+1;
}
echo json_encode($output);
?>