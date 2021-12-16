<?php  
namespace Sistema\Controle;

class Rotas{

	protected $rotas;

    public function jsonRotas(){

    	$json_ = json_decode(file_get_contents(__DIR__."/../Json/rotas.json"));

    	$rotas = array();
    	
    	foreach ($json_ as $rota_ => $v_) {
    	  $rotas[$rota_] = $v_;
    	}

    	$this->rotas = $rotas; 
        return $this->rotas;
    }

    protected function subRotas($path){
        try {

            if (empty($path[0]) || count($path) == 0) {
                throw new Exception("Erro ao carregar informação. Cod. 25");
                exit;
            }

            $param = false;

            if (count($path) > 1) {
                $param = $path[1];
            }

            $json = json_decode(file_get_contents(__DIR__."/../Json/rota.json"), true);
            
            $method = $_SERVER['REQUEST_METHOD'];

            header('Content-Type: application/json');
            
            $body = file_get_contents('php://input');

            function bscJson($vetor, $param){

                $encontrado = -1;
                        
                foreach ($vetor as $key => $obj) {
                    if ($obj['url'] == $param) {
                        $encontrado = $key;
                        break;
                    }
                }
                return $encontrado;
            }

            if ($method === 'GET') {
                if ($json[$path[0]]) {
                    if ($param == false) {
                        echo json_encode($json[$path[0]]);
                    }else{

                        $encontrado = bscJson($json[$path[0]],$param);

                        if ($encontrado >= 0) {
                            echo json_encode($json[$path[0]][$encontrado]);
                        }else{
                            throw new Exception("Erro ao carregar informação. Cod. 28");
                            exit;
                        }
                    }
                    
                }else{
                    throw new Exception("Erro ao carregar informação. Cod. 27");
                }
            }

            if ($method === "POST"){
                
                $jsonBody = json_encode($body, true);

                $jsonBody['id'] = time();
                
                if (!$json[$path[0]]) {
                    $json[$path[0]] = [];
                }

                $json[$path[0]][] = $jsonBody;
                echo json_encode($jsonBody);

                file_put_contents(__DIR__.'/Json/rota.json', json_encode($json));

            }
        } catch (Exception $e) {
             echo $e->getMessage();
        }
    }

}

?>