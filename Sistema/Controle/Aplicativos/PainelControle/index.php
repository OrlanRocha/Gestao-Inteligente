<?php
	class PainelControle{

		public $pagina = "PainelControle"; 
		public $link_1; 

		public function index(){
			require_once __DIR__.'/../../SQL'._INDEX;

			if (!empty($_SESSION['sessionUser'][0]['USER_Status'])) {
				require_once __DIR__.'/../../../www/body'._INDEX;				
			}else{
				header("Location: \\Login");
				exit;
			}
		}

		public function nextPage_1(){
			if(is_file(__DIR__.'/../../../www/body/main'.'/'.$this->pagina.'/'.URL_1._INDEX)){
				require_once __DIR__.'/../../../www/body/main'.'/'.$this->pagina.'/'.URL_1._INDEX;
			}else{
				require_once __DIR__.'/../../../www/body/main'.'/NotFound'._INDEX;
			}
		}

		public function main(){
			require_once __DIR__.'/../../../www/body/main'.'/'.$this->pagina._INDEX;
		}
	}
?>
