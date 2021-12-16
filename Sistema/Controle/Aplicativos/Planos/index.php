<?php
	class Planos{

		public $pagina = "Planos"; 

		public function index(){
			if (empty($_SESSION['sessionUser'][0]['USER_Status'])) {
				require_once __DIR__.'/../../../www/body'._INDEX;
			}else{
				header("Location: \\PainelControle");
				exit;
			}
		}

		public function main(){
			require_once __DIR__.'/../../../www/body/main'.'/'.$this->pagina._INDEX;
		}
	}
?>
