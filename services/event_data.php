<?php
	$fileName=$_GET['event_name'];
	$myfile = fopen("../Rules/".$fileName.".json", "r") or die("Unable to open file!");
	$rec=fread($myfile,filesize("../Rules/".$fileName.".json"));
	fclose($myfile);
	header('Content-type:application/json');
	echo $rec;
		 
?>