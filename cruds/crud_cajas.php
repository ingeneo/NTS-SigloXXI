<?php
include_once '../conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

// Recepción de los datos enviados mediante POST desde el JS   

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$descripcion = (isset($_POST['descripcion'])) ? $_POST['descripcion'] : '';
$bodega = (isset($_POST['bodega'])) ? $_POST['bodega'] : '';
$estante = (isset($_POST['estante'])) ? $_POST['estante'] : '';
$cara = (isset($_POST['cara'])) ? $_POST['cara'] : '';
$modulo = (isset($_POST['modulo'])) ? $_POST['modulo'] : '';
$piso = (isset($_POST['piso'])) ? $_POST['piso'] : '';
$entrepano = (isset($_POST['entrepano'])) ? $_POST['entrepano'] : '';
$ubicacion = (isset($_POST['ubicacion'])) ? $_POST['ubicacion'] : '';
$tipo = (isset($_POST['tipo'])) ? $_POST['tipo'] : '';
$cliente = (isset($_POST['cliente'])) ? $_POST['cliente'] : '';
$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

$serial = 'B'.$bodega.'E'.$estante.'C'.$cara.'M'.$modulo.'P'.$piso.'EP'.$entrepano.'U'.$ubicacion;

switch($opcion){
	case 1: //alta
		$consulta = "INSERT INTO cajas (serial_caja, descripcion_caja, Ubicacion_caja_id_ubicacion_caja, 
		Estado_item_id_estado_item, Tipo_caja_id_tipo_caja, Clientes_id_cliente) VALUES
		('$serial','$descripcion','$ubicacion','1','$tipo', $cliente)";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
	break;
	case 2: //modificación
		$consulta = "UPDATE cajas SET serial_caja='$serial', descripcion_caja='$descripcion', 
		Ubicacion_caja_id_ubicacion_caja='$ubicacion', Tipo_caja_id_tipo_caja='$tipo', Clientes_id_cliente='$cliente' 
		WHERE id_caja='$id'";		
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
	break;
	case 3://baja
		$consulta = "DELETE FROM cajas WHERE id_caja = '$id' ";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
	break;}

print json_encode($data, JSON_UNESCAPED_UNICODE); //enviar el array final en formato json a JS
$conexion = NULL;
