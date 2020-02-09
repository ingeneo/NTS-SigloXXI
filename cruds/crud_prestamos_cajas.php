<?php
include_once '../conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

// Recepción de los datos enviados mediante POST desde el JS   

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$objeto = "cajas";
$estado = "Abierto";
$fecha = date('Y-m-d h:i:s A');
$fecha_ent = (isset($_POST['fecha_ent'])) ? $_POST['fecha_ent'] : '';
$tipo_prestamo = (isset($_POST['tipo_prestamo'])) ? $_POST['tipo_prestamo'] : '';
$prioridad_prestamo = (isset($_POST['prioridad_prestamo'])) ? $_POST['prioridad_prestamo'] : '';
$id_usuario = (isset($_POST['id_usuario'])) ? $_POST['id_usuario'] : '';
$cliente = (isset($_POST['cliente'])) ? $_POST['cliente'] : '';
$nombre_usuario = (isset($_POST['nombre_usuario'])) ? $_POST['nombre_usuario'] : '';
$apellido_usuario = (isset($_POST['apellido_usuario'])) ? $_POST['apellido_usuario'] : '';
$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

switch($opcion){
	case 1: //Prestar
		$consulta = "INSERT INTO prestamo (objeto_prestamo, id_objeto, fecha_solicitud, fecha_entrega, estado_prestamo, Usuarios_id_usuario, Tipo_de_prestamo, Prioridad_prestamo) 
		VALUES('$objeto', '$id', '$fecha', '$fecha_ent', '$estado', '$id_usuario', '$tipo_prestamo', '$prioridad_prestamo')";
		echo $consulta;
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$consulta1 = "UPDATE cajas SET Estado_item_id_estado_item='2' 
		WHERE id_caja='$id'";
		$resultado1 = $conexion->prepare($consulta1);
		$resultado1->execute();
		












		
	break;
	}

$conexion = NULL;
