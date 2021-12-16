<?php 
namespace Sistema\Controle;

require_once __DIR__.'/../Rotas'._INDEX;

class Core extends Rotas{

	protected $controle = "Inicio";
	protected $metodo = "index";
	protected $parametro = [];

	protected static $url;

    public function __construct(){
    	self::filtro();

    	if (empty(self::$url[0]) || is_file(__DIR__."/../Aplicativos/".self::$url[0]._INDEX) || in_array(self::$url[0],$this->jsonRotas())) {
	        if (empty(self::$url[0])) {
	        	$this->controle = "Inicio";
	        	unset(self::$url[0]);
	        }else{
	        	if (!in_array(self::$url[0], $this->jsonRotas())) {
	        		$this->controle = self::$url[0];	
	        		unset(self::$url[0]);
	        	}else{
	        		$this->controle = self::$url[0];
	        		unset(self::$url[0]);
	        		$class = 'RotasFunc';
	        		$funcao = 'rota_'.$this->controle;
		       	}   	
	        }
	    }else{
	    	$this->controle = 'NotFound';
	        unset(self::$url[0]);
	    } 

	    if (!empty($funcao)) {

	    	require_once __DIR__.'/'.$class._INDEX;

	    	$class = new $class;
 
			call_user_func(array($class, $funcao));
			
	    }else{
	    	$this->carregaAplicacao();
	    }
	    
	       
    }

    protected function carregaAplicacao() {

    	require_once __DIR__.'/../Aplicativos/'.$this->controle._INDEX;

	    if (isset(self::$url[1]) && method_exists($this->controle, self::$url[1])) { $this->metodo = self::$url[1]; unset(self::$url[1]); }

	    $this->controle = new $this->controle;

		$this->parametro = self::$url ? array_values(self::$url) : array();

		call_user_func_array([$this->controle, $this->metodo], $this->parametro);   
    }

    protected static function filtro(){

    	$url_ = filter_input(INPUT_GET, 'lnk', FILTER_SANITIZE_ENCODED);
        $url_ = array_filter(explode('%2F', $url_));
       	self::$url = $url_;
        return self::$url;
    }
}

?>