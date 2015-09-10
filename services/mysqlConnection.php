<?php
class dboperation{
 var $con;
   function dbconnect(){
     $this->con=mysqli_connect("localhost","root","root");
	 mysqli_select_db($this->con,"gatewaysdb");
    }
   function execute($qry){
     $this->dbconnect();
	 return mysqli_query($this->con,$qry);
   }
}

?>
