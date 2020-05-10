<?php
const APIURL = "/api";

if(!isset($_GET['path'])) $_GET['path'] = '';

$apiCalls = explode('/',$_GET['path']);

if(count($apiCalls) != 0 && file_exists($apiCalls[0].'.php')){
    header('Content-Type: application/json');
    include($apiCalls[0].'.php');
}else{
    include('../404.php');
}

?>