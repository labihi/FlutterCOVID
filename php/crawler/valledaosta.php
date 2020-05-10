<?php

include_once("simple_html_dom.php");

class Valledaosta{
    
    static function parse($debug = false){
        $html = file_get_html('https://www.regione.vda.it/pressevda/Eventi/decreti_ordinanze_i.aspx');
        $elements = $html->find('tbody',0)->children();
        for($i=0; $i < count($elements); $i++){
            $text = $elements[$i]->getElementsByTagName ("td",1)->plaintext;
            $url    = $elements[$i]->getElementsByTagName ("td",2)->children(0)->href;
            //var_dump ($url);
            //echo $url."<br>";
            preg_match("/[^0-9][0-9]{1,2} \w* [0-9]{2,4}/",$text, $res);
            $posData = strpos($text,$res[0]);
            if($posData<(strlen($text)/2)){
                $title = trim(substr($text,0,$posData));
            }else{
                if($pos = Valledaosta::findFirstBadCharacter($text)){
                    $title = trim(substr($text,0,$pos));
                }else{
                    $title = trim(substr($text,0,$posData));
                }
                
            }
            var_dump($pos);
            echo "<br>";
            echo $title;
            echo "<br>";
            echo "<br>";
            
        }
    }
    static function findFirstBadCharacter($text){
        for ($i=0; $i < strlen($text); $i++) { 
            $char = $text[$i];
            if(!(is_numeric($char)||ctype_alpha($char)||$char == " "||$char == "°"||$char == ".")){
                return $i;
            }
        }
        return false;
    }
}
?>