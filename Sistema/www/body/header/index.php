<?php

if (!empty($_SESSION['sessionUser'][0])):
    $s_ = explode(' ',$_SESSION['sessionUser'][0]['USER_Nome']);
    $_SESSION['pNome'] = $s_;
    $c_ = count(array_count_values($s_))-1;
    $siglaUser = strtoupper(substr($s_[0],0,1).substr($s_[$c_],0,1));
endif;

if (!empty($_SESSION['sessionUser'][0])):
    $ls_ = explode(' ',$_SESSION['loja'][0]['LOJA_nome']);
    $lc_ = count(array_count_values($ls_))-1;
    $siglaLoja = strtoupper(substr($ls_[0],0,1).substr($ls_[$lc_],0,1));
endif;

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