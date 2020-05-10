<?php
include('../database.php');

if(count($apiCalls) == 1){
    //url = /api/dpcm, requesting all the null category dpcm
    $apiCalls[1] = null;
}

if(count($apiCalls) == 2){
    if(is_numeric($apiCalls[1])){
        //url = /api/dpcm/ID
        echo json_encode(getDPCMByID($apiCalls[1]));
    }else{
        //url = /api/dpcm/category
        echo json_encode(getDPCMsByRegion($apiCalls[1]));
    }
}

?>