<?php
	session_start();
	
	$uid=$_SESSION['uid'];
	$cid=$_SESSION['cid'];
	
	$event_id=$_GET['event_id'];
	include_once("qclass.php");
	$obj=new qclass();
	$check=$obj->eventCheck($uid);
 	$rowsSelected=mysqli_num_rows($check);
	$output=array();
	if($rowsSelected==0){
		$res=$obj->registerEvents($uid,$event_id);
		$output['status']=true;
	}
	else if($rowsSelected==1){
		$checkEvent=$obj->checkEventParticipate($uid,$event_id);
		if(mysqli_num_rows($checkEvent)==0){
			$res=$obj->registerEvents($uid,$event_id);
			$output['status']=true;
		}
		else{
				$output['status']=false;
		}
	}
	else{
		$output['status']=false;			
	}
	echo json_encode($output);
	
?>