<?php
	require_once __DIR__.'/../header'._INDEX;
	if(empty(URL_1)){
		$this->main();
	}else{
		$this->nextPage_1();
	}
	require_once __DIR__.'/../footer'._INDEX; 
?>