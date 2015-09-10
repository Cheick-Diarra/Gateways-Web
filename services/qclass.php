<?php
class qclass{
	function dbselection($qry){
		include_once("mysqlConnection.php");
		$ob=new dboperation();
		return $ob->execute($qry);
	}	
	function emailCheck($email){
		$qry="SELECT `email`,`id` FROM `participants` WHERE `email` LIKE '$email'";
		return $this->dbselection($qry);
	}
	function insertParticipant($first_name,$last_name,$gender,$college_id,$contact,$email,$passwaord,$accomadation){
		$qry="INSERT INTO `participants`(`first_name`, `last_name`, `gender`, `college_id`, `contact`, `email`, 
		`password`, `status`, `accomodation`) VALUES ('$first_name','$last_name','$gender',$college_id,
		'$contact','$email','$passwaord',0,$accomadation)";
		return $this->dbselection($qry);
	}
	function getAllColleges(){
		$qry="SELECT `id`, `name` FROM `colleges` ";
		return $this->dbselection($qry);
	}
	function loginCheck($username,$pwd){
		$qry="SELECT * FROM `participants` WHERE email LIKE '$username'  AND	password LIKE '$pwd' ";
		return $this->dbselection($qry);
	}
	function getParticipant($uid){
		$qry="SELECT * FROM `participants` p INNER JOIN `colleges` c  WHERE p.`id`=$uid and c.id=p.college_id";
		return $this->dbselection($qry);
	}
	function updateParticipant($uid,$first_name,$last_name,$college_id,$contact,$email,$accomadation){
		$qry="UPDATE `participants` SET `first_name`='$first_name',`last_name`='$last_name',`college_id`=$college_id,
		`contact`='$contact',`email`='$email',`accomodation`=$accomadation WHERE `id`=$uid";
		return $this->dbselection($qry);
	}
	function eventCheck($uid){
		$qry="SELECT * FROM `participants_events2` WHERE `participant_id`=$uid";	
		return $this->dbselection($qry);
	}
	function registerEvents($uid,$event_id){
		$qry="INSERT INTO `participants_events2`(`participant_id`, `event_id`) VALUES ($uid,$event_id)";
		return $this->dbselection($qry);
	}
	function checkEventParticipate($uid,$event_id){
		$qry="SELECT * FROM `participants_events2` WHERE `participant_id`=$uid AND `event_id`=$event_id";	
		return $this->dbselection($qry);
	}
}