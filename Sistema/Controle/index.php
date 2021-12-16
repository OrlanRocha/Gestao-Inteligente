<?php  
	session_start();

	if (!is_file(__DIR__.'/Conexao/index.php')) { 
		throw new Exception("Houve um problema ao se comunicar com o banco de dados. Cod. 04"); }else{ 
		require_once __DIR__.'/Conexao/index.php'; 
		$cxe = new Sistema\Controle\Conexao(); 
	}

	if (!is_file(__DIR__.'/Define/index.php')) { throw new Exception("Falha nao identificada. Cod. 06"); }else{ require_once __DIR__.'/Define/index.php';}
	if ($_SERVER["REQUEST_METHOD"]) {

		$script = new \Sistema\Controle\Definir();

		switch ($_SERVER["REQUEST_METHOD"]) {
			case 'POST': 	require_once __DIR__._REQUIRE._INDEX;	 										break;
			case 'GET': 	require_once __DIR__._CORE._INDEX; 		$core = new Sistema\Controle\Core(); 	break;
			case 'PUT': 	echo json_encode("REQUEST_METHOD PUT | NOT FOUND");								break;
			case 'DELETE': 	echo json_encode("REQUEST_METHOD DELETE | NOT FOUND"); 							break;
			default: throw new Exception(json_encode("REQUEST_METHOD UNKNOWN | NOT FOUND")); 				break;
		}

	}else{
		throw new Exception(json_encode("Carregamento invalido do sistema contate o administrador. Cod. 04"));
	}	
?>