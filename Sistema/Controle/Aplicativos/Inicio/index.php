<?php
	class Inicio{

		public $pagina = "Inicio"; 

		public function index(){
			require_once __DIR__.'/../../../www/body'._INDEX;
		}

		public function main(){
			require_once __DIR__.'/../../../www/body/main/'.$this->pagina._INDEX;
		}
	}
?>
