<?php
if(!empty(URL_0)){
    if(!empty(URL_1)){
        if(is_file(__DIR__.'/'.URL_0.'/'.URL_1._INDEX)){
            require_once __DIR__.'/'.URL_0.'/'.URL_1._INDEX;
        }else{
            require_once __DIR__.'/NotFound'._INDEX;
        }    
    }else{
        if(is_file(__DIR__.'/'.URL_0._INDEX)){
            require_once __DIR__.'/'.URL_0._INDEX;
        }else{
            require_once __DIR__.'/NotFound'._INDEX;
        } 
    }    
}else{
    require_once __DIR__.'/Home'._INDEX;
}
?>