<?php  
header('Content-Type: application/json; charset=utf-8');
function typeFILES($file = false){
    
	if(empty($file['userfile']['type'])){
		  $file = false;
	}else{
		$type = array(
			'application/x-zip-compressed',
			'application/octet-stream',
			'application/pdf',
			'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
			'application/msword',
			'text/plain',
			'image/png',
			'image/jpeg'
		);
		  
		if(in_array($file['userfile']['type'],$type)){
			$file = true;
		}else{
			$file = false;
		}
	}
	
	return $file;
}

try {
	if(!empty($_FILES)){
		if(typeFILES($_FILES)){
			print_r(json_encode(["tipo" => "erro", "success" => "Arquivo valido."]));
		}else{
			throw new Exception(json_encode(["tipo" => "erro", "msg" => "Extensao de arquivo nao permitido. Cod. 16"]));
		}
	}else{
		$file_POST = json_decode(file_get_contents('php://input'));
		if (!empty($file_POST)) {
			if(!empty($file_POST->token)){
				require_once __DIR__.'/Classes/'.$file_POST->token._INDEX;
				
				$class = new $file_POST->token;
				
				if(method_exists($class, 'fS_'.$file_POST->key)){

					$chamada = array($class, 'fs_'.$file_POST->key);
					$parametro = array($file_POST);

					call_user_func_array( $chamada , $parametro); 
				}else{
					throw new Exception(json_encode(["tipo" => "erro", "msg" => "Classe ou metodo nao definido. Cod. 18"]));
				}
			}else{
				throw new Exception(json_encode(["tipo" => "erro", "msg" => "Token nulo. Cod. 15"]));
			}
		}else{
			throw new Exception(json_encode(["tipo" => "erro", "msg" => "Problema na solicitacao. Cod. 13"]));
		}	
	}
} catch (Exception $e) {
	print_r($e->getMessage());
}

?>