<?php  
class RotasFunc{
	
    public function rota_sair(){

		if (!empty($_SESSION['sessionUser'][0]['USER_ID'])) {

			$v_ID = $_SESSION['sessionUser'][0]['USER_ID'];
			$v_IP = $_SERVER['SERVER_ADDR'];
			$v_NA = $_SERVER['HTTP_USER_AGENT'];

			if($_SESSION['sessionUser'][0]['USER_Status'] = 2){
				$v_ST = 1;
			}else{
				$v_ST = NULL;
			}

			$sql_UPDT = "UPDATE `users` SET `USER_Status` = '$v_ST', `USER_IP` = '$v_IP', `USER_NavegadorSistema` = '$v_NA' WHERE `users`.`USER_ID` = $v_ID";

			$submit = \Sistema\Controle\Conexao::conectar()->prepare($sql_UPDT);
            $submit->execute();

			unset($_SESSION['sessionUser'][0]['USER_ID']);
			unset($_SESSION['sessionUser'][0]['USER_Nome']);
			unset($_SESSION['sessionUser'][0]['USER_Email']);
			unset($_SESSION['sessionUser'][0]['USER_Login']);
			unset($_SESSION['sessionUser'][0]['USER_Senha']);
			unset($_SESSION['sessionUser'][0]['USER_ImagemPerfil']);
			unset($_SESSION['sessionUser'][0]['USER_NivelAcesso']);
			unset($_SESSION['sessionUser'][0]['USER_Status']);
			unset($_SESSION['sessionUser'][0]['USER_IP']);
			unset($_SESSION['sessionUser'][0]['USER_DataHora']);
			unset($_SESSION['sessionUser'][0]['USER_NavegadorSistema']);
			unset($_SESSION['sessionUser'][0]['USER_ID_Loja']);
			unset($_SESSION['sessionUser'][0]);
			unset($_SESSION['sessionUser']);
		}
		header('Location: \\Login');
		exit;
    }
} 

?>