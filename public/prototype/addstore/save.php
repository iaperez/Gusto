<?php

	require("db_vars.php");

	// connect to the database server and select the appropriate database for use
	$dblink = mysql_connect($authDBHost, $authDBUser, $authDBPasswd) or die( mysql_error() );
	mysql_select_db($authDBName);
	
	$DEBUG = 0; // change to 1 if we want to see a bunch of debugging comments.

	$num_surveys = 5;

	if ($DEBUG) {
		echo '<table>';
	  foreach ($_POST as $key => $value) {
	      echo "<tr>";
	      echo "<td>";
	      echo $key;
	      echo "</td>";
	      echo "<td>";
	      echo $value;
	      echo "</td>";
	      echo "</tr>";
	  }
	  echo '</table>';
	}

	//Store the paramters sent via the POST request.
	if ($_POST['add_store'] == "true") {
		$error = 0;
		$new_store_name = mysql_real_escape_string($_POST['new_store_name']);
		$new_store_address = mysql_real_escape_string($_POST['new_store_address']);
		$new_store_survey_01_tag_id = $_POST['survey_01'];
		$new_store_survey_02_tag_id = $_POST['survey_02'];
		$new_store_survey_03_tag_id = $_POST['survey_03'];
		$new_store_survey_04_tag_id = $_POST['survey_04'];
		$new_store_survey_05_tag_id = $_POST['survey_05'];

		//Insert the store information
		$insertQuery_str = "INSERT INTO store (store_name, store_address, store_timestamp) VALUES ('$new_store_name', '$new_store_address', NOW());";
		$insertresult = mysql_db_query($authDBName, $insertQuery_str);
		if ($DEBUG) {echo "<br><br>Entered Store ".$new_store_name." into Database<br>";}
		if ($DEBUG) {echo "Entered Address ".$new_store_address." into Database<br><br>";}
		$new_store_id = mysql_insert_id();

		// Go through each survey question - survey_01, survey_02, survey_03 - get the tag and enter it into the tag table along with this store's id.

		for ($i=1; $i<=$num_surveys; $i++){
			$this_tag_var = "new_store_survey_0".$i."_tag_id";
			$this_tag_id = $$this_tag_var;
			$insertTagQuery_str = "INSERT INTO store_tag (store_tag_tag_id, store_tag_store_id) VALUES ($this_tag_id, $new_store_id);";
			$insertTagResult = mysql_db_query($authDBName, $insertTagQuery_str);	
			if ($DEBUG) {	
				if ($insertTagResult) {
					echo "Success. Entered Tag ".$this_tag_id." for Store ".$new_store_name."<br>";
				} else {
					$error = 1;
					echo "Error.<br>";
				}
			}
		}
	}
	if ($error) {
		$myurl = "index.html?error=true";
	} else {
		$myurl = "index.html?success=true";
	}
header("Location: " . $myurl);
?>