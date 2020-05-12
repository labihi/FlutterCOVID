<?php
$servername = "localhost";
$username = "flutter_covid";
$password = "p3n3gr0ss0";
$dbname = "flutter_covid";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function tryUpload($dpcmURL, $dpcmTitle, $dpcmDesc, $region, $articleParts){
    if($region == NULL){
        $region = 'null';
    }else{
        $region = "'$region'";
    }
    global $conn;
    global $debug;
    /*print('Title: '.$dpcmTitle.
    '<br>URL: '.$dpcmURL.
    '<br>Desc: '.$dpcmDesc.
    '<br>TEXT: <pre>');
    print('</pre><br>');*/
    $dpcmURL = html_entity_decode($dpcmURL);
    $dpcmTitle = html_entity_decode($dpcmTitle);
    $dpcmDesc = html_entity_decode($dpcmDesc);
    //checking if the dpcm is already on the database
    $dpcmURL = $conn -> real_escape_string($dpcmURL);
    $sql = "SELECT id FROM dpcm WHERE url = '$dpcmURL'";
    $result = $conn->query($sql);

    $dcpmID = null;

    //if the dpcm doesn't exist i need to add it
    if ($result->num_rows == 0) {
        $dpcmTitle = $conn -> real_escape_string($dpcmTitle);
        $dpcmDesc = $conn -> real_escape_string($dpcmDesc);
        $sql = "INSERT INTO dpcm (url, title, description, region) VALUES ('$dpcmURL', '$dpcmTitle', '$dpcmDesc',$region)";
        
        //if i cannot create the dpcm it's useless to create the articles, so i just close the function
        if ($conn->query($sql) === FALSE) return;

        $dcpmID = $conn->insert_id;
        print("ID FOR NEW INSERTED DPCM: ".$dcpmID."<BR>");
    }else{
        $dcpmID = $result->fetch_row()[0];
        print("ID FOR EXISTING DPCM: ".$dcpmID."<BR>");
    }
    
    //upload the articles
    foreach ($articleParts as $title => $text) {
        $title = $conn -> real_escape_string($title);
        $title = html_entity_decode ($title);
        //skip this article if it already exists
        $sql = "SELECT dpcm_id FROM article WHERE dpcm_id = '$dcpmID' AND title = '$title'";
        if($conn->query($sql)->num_rows > 0){
            print("SKIPPING ARTICLE ".$title." (".$dcpmID.")<BR>");
            continue;
        }

        print("UPLOADING ARTICLE ".$title." (".$dcpmID.")<BR>");        
        //otherwise upload it
        $text = $conn -> real_escape_string($text);
        $text = html_entity_decode($text);
        $sql = "INSERT INTO article (dpcm_id, title, text) VALUES ($dcpmID, '$title', '$text')";
        $conn->query($sql);
    }
}

function getDPCMByID($id){
    global $conn;
    $id = $conn->real_escape_string($id);
    $sql = "SELECT * FROM dpcm WHERE id = '$id' ORDER BY timestamp DESC";

    $result = selectAndFetch($sql);
    return count($result) == 1 ? $result[0] : $result;
}

function getDPCMsByRegion($region){
    global $conn;
    if ($region == NULL)
        $regionPart = 'is NULL';
    else
        $regionPart = "= '".$conn->real_escape_string($region)."'";

    $sql = "SELECT * FROM dpcm WHERE region $regionPart";
    return selectAndFetch($sql);
}

function getArticlesByDCPMID($dcpmID){
    global $conn;
    $dcpmID = $conn->real_escape_string($dcpmID);
    $sql = "SELECT * FROM article WHERE dpcm_id = '$dcpmID'";
    return selectAndFetch($sql);
}


function getArticlesByDCPMUrl($dcpmURL){
    global $conn;
    $dcpmURL = $conn->real_escape_string($dcpmURL);
    $sql = "SELECT * FROM article WHERE dpcm_id = '$dcpmURL'";
    return selectAndFetch($sql);
}


function selectAndFetch($sql){
    global $conn;
    if ($result = $conn->query($sql)) {
        $rows = [];
        while($row = $result->fetch_assoc()) {
                $rows[] = $row;
        }
        return $rows;
    }
    return FALSE;
}

?>