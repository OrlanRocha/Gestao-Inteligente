<?php
	class Cadastro{

		public $pagina = "Cadastro"; 

		public function index(){
			if (!empty($_SESSION['cadastro']['tipoPlano'])) {
				require_once __DIR__.'/../../../www/body'._INDEX;
			}else{
				header("Location: \\Planos");
				exit;
			}
		}

		public function main(){
			require_once __DIR__.'/../../../www/body/main'.'/'.$this->pagina._INDEX;
		}
	}
?>
