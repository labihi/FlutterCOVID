<?php 
include 'database.php';
$var = $conn->real_escape_string("prova\npene\n");
$sql = "INSERT INTO dpcm (url, title, description, region) VALUES ('ssssssss', 'sbonobo', '$var',null)";
if ($conn->query($sql) === FALSE) {
    echo "ret false";
    return;

}