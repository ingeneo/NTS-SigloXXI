<?php 
class Conexion{
	public static function Conectar() {
		define('servidor', 'sql5c75f.carrierzone.com');
		define('nombre_bd', 'NTS_docsiglo21608213');
		define('usuario', 'docsiglo21608213');
		define('password', 'siglo21-2020');					        
		$opciones = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
		try{
			$conexion = new PDO("mysql:host=".servidor."; dbname=".nombre_bd, usuario, password, $opciones);			
			return $conexion;
		}catch (Exception $e){
			die("El error de Conexi&Atilde;&sup3;n es: ". $e->getMessage());
		}
	}
}
?>