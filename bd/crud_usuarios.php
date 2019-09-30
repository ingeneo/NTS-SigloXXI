<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

// Recepción de los datos enviados mediante POST desde el JS   

$cedula = (isset($_POST['cedula'])) ? $_POST['cedula'] : '';
$nombre = (isset($_POST['nombre'])) ? $_POST['nombre'] : '';
$apellido = (isset($_POST['apellido'])) ? $_POST['apellido'] : '';
$telefono = (isset($_POST['telefono'])) ? $_POST['telefono'] : '';
$email = (isset($_POST['email'])) ? $_POST['email'] : '';
$tipo_usuario = (isset($_POST['tipo_usuario'])) ? $_POST['tipo_usuario'] : '';
$nombre_cliente = (isset($_POST['nombre_cliente'])) ? $_POST['nombre_cliente'] : '';
$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

switch($opcion){
	case 1: //alta
		$consulta = "INSERT INTO usuarios (nombre_usuario, apellido_usuario, cedula_usuario, telefono_usuario,
					email_usuario, password, Tipos_de_usuario_id_Tipo_usuario, Clientes_id_cliente) VALUES
					('Jairo','Perez','79888999','555112233','jperez@mico.com','0','1','1')";			
		$resultado = $conexion->prepare($consulta);
		$resultado->execute(); 

		//$consulta = "SELECT * FROM usuarios ORDER BY id_usuario ESC LIMIT 1";
		$consulta = "SELECT * FROM usuarios ORDER BY id_usuario DESC";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data=$resultado->fetchAll(PDO::FETCH_ASSOC);
		break;
	case 2: //modificación
		$consulta = "UPDATE personas SET nombre='$nombre', pais='$pais', edad='$edad' WHERE id='$id' ";		
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();        
		
		$consulta = "SELECT id, nombre, pais, edad FROM personas WHERE id='$id' ";       
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data=$resultado->fetchAll(PDO::FETCH_ASSOC);
		break;        
	case 3://baja
		$consulta = "DELETE FROM personas WHERE id='$id' ";		
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();                           
		break;        
}

print json_encode($data, JSON_UNESCAPED_UNICODE); //enviar el array final en formato json a JS
$conexion = NULL;
