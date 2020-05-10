<?php

include_once("simple_html_dom.php");

class Valledaosta{

    static function parse($debug = false){
        // scarico il file e trovo i tbody
        $html = file_get_html('https://www.regione.vda.it/pressevda/Eventi/decreti_ordinanze_i.aspx');
        $elements = $html->find('tbody',0)->children();

        for($i=0; $i < count($elements); $i++){
            //ottengo testo e url
            $text = $elements[$i]->getElementsByTagName ("td",1)->plaintext;
            $url    = $elements[$i]->getElementsByTagName ("td",2)->children(0)->href;
            
            //cerco le date
            preg_match("/[^0-9][0-9]{1,2} \w* [0-9]{2,4}/",$text, $res);

            //cerco la data maggiore
            $maxDate = Valledaosta::findMaxDate($res);

            tryUpload($url,$maxDate,trim($text),'valle',[]);
        }
    }

    static function findMaxDate($dates){
        global $mesi;

        $mostRecent= 0;
        $mostRecentOriginal = "";
        foreach($dates as $date){
            $originalDate = substr($date,1);
            //pulisco la data, la esplodo e traduco il mese
            $date = explode(' ', $originalDate);
            $date[1] = $mesi[$date[1]];
            $date = join('-', array_reverse($date));

            $date = strtotime($date);
            if ($date > $mostRecent) {
                $mostRecent = $date;
                $mostRecentOriginal = $originalDate;
            }
        }

        return $mostRecentOriginal;
    }

}
?>