<?php
	class CadastroEmpresa{

		public $pagina = "CadastroEmpresa"; 

		public function index(){
			if (!empty($_SESSION['cadastro']['tipoPlano'])) {
                if (!empty($_SESSION['cadastro']['email'])) {
                    require_once __DIR__.'/../../../www/body'._INDEX;
                }else{
                    header("Location: \\Cadastro");
                }
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
