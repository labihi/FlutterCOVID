<?php

include_once("simple_html_dom.php");

class GovernoIt{
    
    static function parse($debug = false){
        $html = file_get_html('http://www.governo.it/it/coronavirus-normativa');
        $elements = $html->find('dl', 0)->children();
        $inc=0;
        for ($i= count($elements)-2; $i>=0 ;$i+= $inc){
            if($i % 2 == 0){
              //Titolo
                $articleA       = $elements[$i]->find('a',0);
                $articleTitle   = $articleA->plaintext;
                $articleURL     = $articleA->href;
                
                if(strpos($articleURL,'://') === FALSE)
                    $articleURL = 'http://www.governo.it'.$articleURL;  
                if(strpos(strtolower($articleTitle),'dpcm') === FALSE){
                    if($debug) print("SKIPPING: ".strtolower($articleTitle).'<br><br>');
                    $i++;
                }
                $inc = 2;
            }else{
                //Descrizione
                $articleDesc = $elements[$i]->plaintext;
                $articleParts = [];
                if(strpos($articleURL,'.pdf') === FALSE){
                    $articleParts = GovernoIt::parseArticle($articleURL, $debug);
                }
                tryUpload($articleURL, $articleTitle, $articleDesc, null, $articleParts);
                $inc = -3;
            }
            if ($i==1){
                $i = -1;
            }
          }
    }

    static function parseArticle($articleURL, $debug = false){
        //example url: https://www.gazzettaufficiale.it/eli/id/2020/04/27/20A02352/sg

        //get the article
        $html = file_get_html($articleURL);
        
        //get the article tree
        $urlParts = explode('/',$articleURL);
        $code = $urlParts[count($urlParts)-2];
        $date = $urlParts[count($urlParts)-5].'-'.$urlParts[count($urlParts)-4].'-'.$urlParts[count($urlParts)-3].'-';
        $treeLink = 'https://www.gazzettaufficiale.it/atto/serie_generale/caricaAlberoArticoli/originario?atto.dataPubblicazioneGazzetta='.$date.'&atto.codiceRedazionale='.$code;
        $articleTree = file_get_html($treeLink)->find('li a');

        $parts = [];
        if(count($articleTree) == 0){
            $singleArticleLink = 'https://www.gazzettaufficiale.it/atto/serie_generale/caricaArticoloDefault/originario?atto.dataPubblicazioneGazzetta='.$date.'&atto.codiceRedazionale='.$code.'&atto.tipoProvvedimento=';
            
            if($debug) print('<br>SAL'.$singleArticleLink.'<br>');
            
            $parts['1'] = file_get_html($singleArticleLink)->find('pre')[0]->innertext;
            return $parts;
        }

        foreach ($articleTree as $part) {
            $partName = $part->plaintext;
            $partLink = $part->href;
            if(strpos($partLink,'://') === FALSE)
                $partLink = 'https://www.gazzettaufficiale.it'.$partLink;
            $partText = file_get_html($partLink)->find('pre')[0]->innertext;
            $pos = strpos($partText, "\n");
            $parts[trim($partName)] = $partText;
        }
        return $parts;
    }

}

?>