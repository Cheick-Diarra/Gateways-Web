<?php
	session_start();
	$uid=$_SESSION['uid'];
	$first_name=$_GET["first_name"];
	$last_name=$_GET["last_name"];
	$college_id=$_GET["college_id"];
	$contact=$_GET["contact"];
	$email=$_GET["email"];
	$accomadation=$_GET["accomodation"];
	include_once("qclass.php");
	$obj=new qclass();
	$check=$obj->emailCheck($email);
	$no_of_rec=mysqli_num_rows($check);
	if($no_of_rec<=1){
		$output=array();
		$flag=1;
			if($no_of_rec==1){	
				$emailData=mysqli_fetch_row($check);
				if($emailData[1]!=$uid)
							$flag=0;
			}
			if($flag==1){	
					$r=$obj->updateParticipant($uid,$first_name,$last_name,$college_id,$contact,$email,$accomadation);
					if($r==1){
						$output['status']="1";//successfully updated
					}
					else{
						$output['status']="2";//updation failed
					}
			}
			else{
				$output['status']="3";//updation  failed due to email
			}
	header('Content-type:application/json');		
	echo json_encode($output);	
}
	
?>