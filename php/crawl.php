<?php
include_once("simple_html_dom.php");

$debug = true;

include('404.php');

if(!isset($_GET['token']) || $_GET['token'] != 'tonno123')
    exit();

//loading parsers
foreach(scandir("crawler") as $crawler){
    if($crawler[0] == '.') continue;
    include_once("crawler/".$crawler);
}

include("database.php");

//start GovernoIt
//GovernoIt::parse();
Valledaosta::parse();
$conn->close();

?>