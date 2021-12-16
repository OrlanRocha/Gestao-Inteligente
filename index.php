<?php  
try{
	if(!is_file(__DIR__.'/Sistema/Controle/index.php')) {
    	throw new Exception('Erro ao inicializar o sistema contate o administrador. COD 001');
  	}else{ require_once __DIR__.'/Sistema/Controle/index.php'; }
}catch(Exception $e) {
	header('Content-Type: application/json; charset=utf-8');
	print_r(json_encode(array(
		'Tipo' => 'Erro',
		'Mensagem' => $e->getMessage()
	)));
}
?>