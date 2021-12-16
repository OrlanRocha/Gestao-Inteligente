<?php
class Cadastro{
    private $tipoPlano;
    private $valorPlano;

    private $nomeCliente;
    private $dataNascimen;
    private $email;
    private $senha;

    private $cpf;
    private $cnpj;
    private $inscricaoEstadual = false;
    private $nomeEmpresa;

    private $logradouro;
    private $numero = 's/n';
    private $complemento = false;
    private $bairro;
    private $cidade;
    private $estado;
    private $cep;
    private $telefone;
    private $imgPerfil = 'imagemPerfilDefault.png';
    private $imgLogoEmpresa = 'imagemEmpresalDefault.png';

    private $mensage = [];

    public function fs_Plano($parametro = []) {

        if(!empty($parametro->plano)){
            $_SESSION['cadastro']['tipoPlano'] = $parametro->plano;
            $this->tipoPlano = $parametro->plano;
            $this->set_Mensage(["tipo" => "success", "msg" => "Vamos lá.", "url" => "\\Cadastro"]);
        }else{
            $this->set_Mensage(["tipo" => "atencao", "msg" => "Atenção selecione um plano antes de continuar."]);
        }
        $this->show_Mensage();
    }

    public function fs_DadosAcesso($parametro = []) {

        if(!empty($_SESSION['cadastro']['tipoPlano'])){
            if(!empty($parametro->nome) && strlen($parametro->nome) >= 10){     
                if(!empty($parametro->email) && filter_var($parametro->email, FILTER_VALIDATE_EMAIL)){
                    if($this->verificaEmail($parametro->email)){
                        if(!empty($parametro->senha)){
                            if($this->validarSenha($parametro->senha)){
                                if($parametro->senha === $parametro->csenha){

                                    $_SESSION['cadastro']['nome'] = strip_tags($parametro->nome);
                                    $_SESSION['cadastro']['email'] = strip_tags($parametro->email);
                                    $_SESSION['cadastro']['senha'] = sha1(strip_tags($parametro->email));

                                    $this->set_Mensage(["tipo" => "success", "msg" => "Otimo vamos continuar.", "url" => "\\CadastroEmpresa"]);
                                }else{
                                    $this->set_Mensage(["tipo" => "atencao", "msg" => "As senhas não se coincidem."]);
                                }
                            }else{
                                $this->set_Mensage(["tipo" => "atencao", "msg" => "A senha atual não contem os requisitos minimos."]);
                            }
                        }else{
                            $this->set_Mensage(["tipo" => "atencao", "msg" => "Informe uma senha e confirme-a."]);
                        }
                    }else{
                        $this->set_Mensage(["tipo" => "atencao", "msg" => "E-mail ja cadastrado"]);
                    }
                    
                }else{
                    $this->set_Mensage(["tipo" => "atencao", "msg" => "Informe um e-mail valido."]);
                }
            }else{
                $this->set_Mensage(["tipo" => "atencao", "msg" => "Informe seu nome completo."]);
            }
            
        }else{
            $this->set_Mensage(["tipo" => "atencao", "msg" => "Atenção selecione um plano antes de continuar."]);
        }

        $this->show_Mensage();
    }

    public function fs_DadosEmpresa($parametro = []){

        if(!empty($parametro->cpf)){
            if($this->validarCPF($parametro->cpf)){
                if(!empty($parametro->dataNascimento)){
                    if($this->validaMaior18($parametro->dataNascimento)){
                        $this->set_Mensage(["tipo" => "success", "msg" => ":)"]);
                    }else{
                        $this->set_Mensage(["tipo" => "atencao", "msg" => "Precisa ser maior de 18 anos para continuar."]);
                    }
                    
                }else{
                    $this->set_Mensage(["tipo" => "atencao", "msg" => "Preencha a sua data de nascimento."]);
                }
                
            }else{
                $this->set_Mensage(["tipo" => "atencao", "msg" => "CPF inválido."]);
            }
        }else{
            $this->set_Mensage(["tipo" => "atencao", "msg" => "Preencha o CPF."]);
        }

        $this->show_Mensage();
    }

    private function verificaEmail ($email = false){
        $sql = "SELECT * FROM users WHERE USER_Email = '$email' LIMIT 1";

        $submit = \Sistema\Controle\Conexao::conectar()->prepare($sql);
        $submit->execute();

        if ($submit->rowCount() > 0) {

            return false;

        }else{

            return true;

        }   
    }

    private function validaMaior18($dataNasc = false){

        $dataNascimento = new \DateTime($dataNasc);
        $dateNow        = new \DateTime(date('Y-m-d',time()));

        $date = $dataNascimento->diff($dateNow);

        if($date->y >= 18){
            $idade = true;
         }else{
            $idade = false;
         }

         return $idade;
    }

    private function validarSenha ($password = false, $min_len = 8, $max_len = 10, $req_digit = 1, $req_lower = 1, $req_upper = 1) {

        $regex = '/^';

        if ($req_digit == 1) { $regex .= '(?=.*\d)'; }
        if ($req_lower == 1) { $regex .= '(?=.*[A-Za-z])'; }

        $regex .= '.{' . $min_len . ',' . $max_len . '}$/';
    
        if(preg_match($regex, $password)) {
            return true;
        } else {
            return false;
        }
    }

    private function validarCPF($cpf = false, $len = 8){
        
        // Extrai somente os números
        $cpf = preg_replace( '/[^0-9]/is', '', $cpf );

        // Verifica se foi informado todos os digitos corretamente
        if (strlen($cpf) != 11) {
            return false;
        }

        // Verifica se foi informada uma sequência de digitos repetidos. Ex: 111.111.111-11
        if (preg_match('/(\d)\1{10}/', $cpf)) {
            return false;
        }

        // Faz o calculo para validar o CPF
        for ($t = 9; $t < 11; $t++) {
            for ($d = 0, $c = 0; $c < $t; $c++) {
                $d += $cpf[$c] * (($t + 1) - $c);
            }
            $d = ((10 * $d) % 11) % 10;
            if ($cpf[$c] != $d) {
                return false;
            }
        }
        return true;
        
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