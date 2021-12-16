<?php
	class Login{

		private $email;
        private $senha;
        private $lembrar;
        private $mensage = [];

		public function fs_Acesso($paramentro = []){

            if(!empty($paramentro->email) && $this->set_email($paramentro->email) !== false){

                if(!empty($paramentro->senha) && $this->set_senha($paramentro->senha) !== false){

                    if(!empty($this->set_lembrar)){ $this->set_lembrar($paramentro->lembrar); }

                    $this->efetua_Login();

                }else{
                    $this->set_Mensage(["tipo" => "erro", "msg" => "Informe uma senha para continuar."]);
                }
            }else{
                $this->set_Mensage(["tipo" => "erro", "msg" => "Informe um email para continuar."]);
            }

            $this->show_Mensage();
		}

        private function efetua_Login(){

            if($this->valida_EMAIL()){
                if($this->valida_SENHA()){
                    if($this->status_LOGIN()){
                        if($this->altera_STATUS($id = false)){
                            $this->set_Mensage(["tipo" => "success", "msg" => "Login Efetuado com Sucesso.", "url" => "\\PainelControle"]);
                        }else{
                            $this->set_Mensage(["tipo" => "success", "msg" => "Login Efetuado com Sucesso.", "url" => "\\PainelControle"]);
                        }  
                    }   
                }else{
                    $this->set_Mensage(["tipo" => "erro", "msg" => "Senha incorreta."]);
                }
            }else{
                $this->set_Mensage(["tipo" => "erro", "msg" => "E-mail incorreto ou não cadastrado."]);
            }
            
        }

        private function valida_EMAIL(){
            $sql_EMAIL = "SELECT * FROM `users` WHERE `USER_Email` = '$this->email'";
            $submit = \Sistema\Controle\Conexao::conectar()->prepare($sql_EMAIL);
            $submit->execute();

            if ($submit->rowCount() > 0) {

                $_SESSION['sessionUser'] =  $submit->fetchAll(\PDO::FETCH_ASSOC);

                return true;

            }else{

                return false;

            }
        }

        private function valida_SENHA(){
            
            if ($_SESSION['sessionUser'][0]['USER_Senha'] == $this->senha) {
                
                return true;

            }else{

                return false;

            }
        }

        private function altera_STATUS(){

            $sql_STATUS = "UPDATE `users` SET `USER_Status` = '2' WHERE `USER_Email` = '$this->email'";

            if($_SESSION['sessionUser'][0]['USER_Status'] == 2){
                $submit = \Sistema\Controle\Conexao::conectar()->prepare($sql_STATUS);
                $submit->execute();

                if ($submit->rowCount() > 0) {
                    
                    return true;

                }else{

                    return false;

                }
            }else{

                $submit = \Sistema\Controle\Conexao::conectar()->prepare($sql_STATUS);
                $submit->execute();

                if ($submit->rowCount() > 0) {
                    
                    return true;

                }else{

                    return false;

                }

            }

        }
        
        private function status_LOGIN(){

            switch ($_SESSION['sessionUser'][0]['USER_Login']) {
                case 1: 
                    $this->set_Mensage(["tipo" => "erro", "msg" => "Confirmação de E-mail pendente.", "url" => "\\sair"]); 
                    $sl = false; 
                    break;

                case 2: 
                    $this->set_Mensage(["tipo" => "erro", "msg" => "Usuario temporiamente desabilitado.", "url" => "\\sair"]); 
                    $sl = false; 
                    break;

                case 3: 
                    $this->set_Mensage(["tipo" => "erro", "msg" => "Usuario Bloqueado.", "url" => "\\sair"]); 
                    $sl = false; 
                    break;
                    
                case 4: 
                    $sl = true; 
                    break;

                default: 
                    $this->set_Mensage(["tipo" => "erro", "msg" => "Sua conta esta com problema <br/>contate o desenvolvedor do sistema.", "url" => "\\sair"]); 
                    $sl = false; 
                    break;
            }

            return $sl;
        }

        private function set_email($email = false){
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $this->email = $email;
            }else{
                $this->email = false;
            }

            return $this->email;
            
        }

        private function set_senha($senha = false){
            $this->senha = sha1($senha);
            return $this->senha;
        }

        private function set_lembrar($lembrar = false){

            $this->lembrar = $lembrar;
            return $this->lembrar;

        }

        private function show_Mensage(){
            if(!empty($this->mensage)){
                throw new Exception(json_encode($this->mensage));
            }
        }

        private function set_Mensage($mensage = []){
            $this->mensage = $mensage;
            return $this->mensage;
        }
	}
?>