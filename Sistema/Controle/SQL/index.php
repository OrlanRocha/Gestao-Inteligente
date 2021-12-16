<?php

namespace Sistema\Select;
class SQL{
    
    private $sql;
    public  $result;

    public function exe_($type = false){

        $this->sql_type($type);
        $submit = \Sistema\Controle\Conexao::conectar()->prepare($this->sql);
        $submit->execute();

        if ($submit->rowCount() > 0) {
 
            return $submit->fetchAll(\PDO::FETCH_ASSOC);

        }else{

            return false;

        }
    }

    private function sql_type($type = false){
        
        if(!empty($type)){
            switch ($type) {
                case 'LOGS':    $this->sql = $this->sql_LOGS();     break;
                case 'USERS':   $this->sql = $this->sql_USERS();    break;
                case 'LOJAS':   $this->sql = $this->sql_LOJAS();    break;
                default: break;
            }
        }else{
            $this->sql = false;
        }   
        return $this->sql; 
    }

    private function sql_LOGS(){

        return "SELECT * FROM `logsistema` ORDER BY `LOG_DATAHORA` DESC";

    }

    private function sql_USERS(){

        return "SELECT * FROM `users` ORDER BY `users`.`USER_DataHora` DESC";
    }

    private function sql_LOJAS(){

        return "SELECT * FROM `loja` ORDER BY `loja`.`LOJA_DataHora` DESC";

    }

}
