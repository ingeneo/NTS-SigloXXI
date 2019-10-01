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
					('$cedula','$nombre','$apellido','$telefono','$email','','$tipo_usuario','$nombre_cliente')";			
		$resultado = $conexion->prepare($consulta);
		$resultado->execute(); 
		//$consulta = "SELECT * FROM usuarios ORDER BY id_usuario ESC LIMIT 1";
		$consulta = "SELECT U.id_usuario, U.nombre_usuario, U.apellido_usuario, U.cedula_usuario, U.telefono_usuario, U.email_usuario, TU.nombre_tipo_usuario, C.razon_social_cliente 
			FROM usuarios U, tipos_de_usuario TU, clientes C 
			WHERE  U.Tipos_de_usuario_id_Tipo_usuario = TU.id_Tipo_usuario AND U.Clientes_id_cliente=C.id_cliente 
			ORDER BY id_usuario";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data = $resultado->fetchAll(PDO::FETCH_ASSOC);
		break;
	case 2: //modificación
		$consulta = "UPDATE personas SET nombre='$nombre', pais='$pais', edad='$edad' WHERE id='$id' ";		
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();        
		
		$consulta = "SELECT U.id_usuario, U.nombre_usuario, U.apellido_usuario, U.cedula_usuario, U.telefono_usuario, U.email_usuario, TU.nombre_tipo_usuario, C.razon_social_cliente 
			FROM usuarios U, tipos_de_usuario TU, clientes C 
			WHERE  U.Tipos_de_usuario_id_Tipo_usuario = TU.id_Tipo_usuario AND U.Clientes_id_cliente=C.id_cliente 
			ORDER BY id_usuario";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data = $resultado->fetchAll(PDO::FETCH_ASSOC);
		break;        
	case 3://baja
		$consulta = "DELETE FROM usuarios WHERE cedula_usuario ='$cedula'";		
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();                           
		$consulta = "SELECT U.id_usuario, U.nombre_usuario, U.apellido_usuario, U.cedula_usuario, U.telefono_usuario, U.email_usuario, TU.nombre_tipo_usuario, C.razon_social_cliente 
			FROM usuarios U, tipos_de_usuario TU, clientes C 
			WHERE  U.Tipos_de_usuario_id_Tipo_usuario = TU.id_Tipo_usuario AND U.Clientes_id_cliente=C.id_cliente 
			ORDER BY id_usuario";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data = $resultado->fetchAll(PDO::FETCH_ASSOC);
		break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE); //enviar el array final en formato json a JS
$conexion = NULL;
