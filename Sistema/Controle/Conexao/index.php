<?php  
namespace Sistema\Controle;
	class Conexao{
		private static $instancia;
		private static $config = array();

		public static function conectar(){

			self::lerConfig();

			if (!isset(self::$instancia)) {
				self::$instancia = new \PDO("mysql:
					host=".self::$config['host'].";
					dbname=".self::$config['banco'].";
					charset=".self::$config['charset'],
					self::$config['usuario'],
					self::$config['senha']);
			}

			return self::$instancia;
		}

		public static function lerConfig(){

	    	$json_ = json_decode(file_get_contents(__DIR__."/../Json/configConexao.json"));

	    	foreach ($json_ as $cx => $vcx) {

	    		self::$config[$cx] = $vcx;
	    	}
	    	return self::$config;
		}
	}
?>