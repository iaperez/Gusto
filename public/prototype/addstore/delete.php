<?php

	require("db_vars.php");

	// connect to the database server and select the appropriate database for use
	$dblink = mysql_connect($authDBHost, $authDBUser, $authDBPasswd) or die( mysql_error() );
	mysql_select_db($authDBName);
	
	$DEBUG = 0; // change to 1 if we want to see a bunch of debugging comments.

	//Store the paramters sent via the POST request.
	if ($_POST['delete_store_id']) {
		$this_store = $_POST['delete_store_id'];
		$dQuery_str = "DELETE FROM store WHERE store_id=$this_store;";
		$dresult = mysql_db_query($authDBName, $dQuery_str);
		
		$tQuery_str = "DELETE FROM store_tag WHERE store_tag_store_id=$this_store;";
		$tresult = mysql_db_query($authDBName, $tQuery_str);
		
		// echo "query is " . $dQuery_str . '<br>';
		// echo "tquery is " . $tQuery_str . '<br>';

	}
	if ($dresult) {
		$myurl = "stores.html?success=true";
	} else {
		$myurl = "stores.html?error=true";
	}
header("Location: " . $myurl);
?>