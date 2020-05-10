<?php
include('../database.php');

if(count($apiCalls) == 2){
    //url = /api/article/dcpmID
    echo json_encode(getArticlesByDCPMID($apiCalls[1]));
}

?>