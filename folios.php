<?php

ob_start();
session_start();
require_once 'config.php'; 
if(!isset($_SESSION['logged_in'])){
	header('Location: index.php');
}

include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$consulta = "SELECT F.id_folio, F.codigo_folio, F.desc_folio, CP.codigo_carpeta 
			FROM folio F, carpeta CP  
			WHERE  F.Carpeta_id_carpeta = CP.id_carpeta 
			ORDER BY id_folio";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$data=$resultado->fetchAll(PDO::FETCH_ASSOC);
?>

<!doctype html>
<html lang="es">
  <head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="#" />  
	<title>Modulo Folios</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!--datables CSS básico-->
	<link rel="stylesheet" type="text/css" href="datatables/datatables.min.css"/>
	<!--datables estilo bootstrap 4 CSS-->  
	<link rel="stylesheet"  type="text/css" href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
	<link rel="stylesheet" href="css/estilos.css">
  </head>
	
  <body> 
	 <header>
		<div class="row fondo">
			<div class="col-sm-1 col-md-1">
				<a href="home.php"><i class="icono fas fa-home"></i></a>
			</div>
			<div class="col-sm-11 col-md-11 col-lg-11">
				<h1 class="titulos text-center text-uppercase">Administración de Folios</h1>
			</div>
		</div>
	</header>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
			<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="icono1 fas fa-plus-circle"></i> Nuevo Folio</button>    
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table id="tablaFolios" class="table table-striped table-bordered table-condensed" style="width:100%">
						<thead class="text-center">
							<tr>
								<th>ID</th>
								<th>Serial Folio</th>
								<th>Descripcion folio</th>
								<th>Carpeta a la que pertenece</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($data as $dat) {
							?>
							<tr>
								<td><?php echo $dat['id_folio'] ?></td>
								<td><?php echo $dat['codigo_folio'] ?></td>
								<td><?php echo $dat['desc_folio'] ?></td>
								<td><?php echo $dat['codigo_carpeta'] ?></td>
								<td nowrap></td>
							</tr>
							<?php
								}
							?>
						</tbody>
						<tfoot class="text-center">
							<tr>
							    <th>ID</th>
								<th>Serial Folio</th>
								<th>Descripcion folio</th>
								<th>Carpeta a la que pertenece</th>
								<th style="display:none;"></th>
							</tr>
						</tfoot>
						</table>
					</div>
				</div>
		</div>
	</div>
	  
<!--Modal para CRUD-->
<div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
			</div>
		<form id="formFolios">
			<div class="modal-body">
				<input type="hidden" class="form-control" id="id_folio">
				<div class="form-group">
					<label for="codigo_folio class="col-form-label">Serial del folio:</label>
					<input type="text" class="form-control" id="codigo_folio">
				</div>
				<div class="form-group">
					<label for="desc_folio class="col-form-label">Descripcion folio:</label>
					<input type="text" class="form-control" id="desc_folio">
				</div>
				<div class="form-group">
					<label for="lista_cajas" class=" col-form-label">Caja al que pertenece:</label>
					<select class="form-control" id="lista_cajas" name="lista_cajas" required></select>
				</div>
				<div class="form-group">
					<label for="lista_carpetas" class=" col-form-label">Carpeta a la que pertenece:</label>
					<select class="form-control" id="lista_carpetas" name="lista_carpetas" required></select>
				</div>
		</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="icono1 fas fa-times-circle"></i> Cancelar</button>
				<button type="submit" id="btnGuardar" class="btn btn-dark"><i class="icono1 fas fa-check-circle"></i> Guardar</button>
			</div>
		</form>
		</div>
	</div>
</div>
	<!-- jQuery, Popper.js, Bootstrap JS -->
	<script src="jquery/jquery-3.3.1.min.js"></script>
	<script src="popper/popper.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	  
	<!-- datatables JS -->
	<script type="text/javascript" src="datatables/datatables.min.js"></script>
	<!-- Botones para usar en dataTables -->
	<script src="Buttons/js/dataTables.buttons.min.js"></script>
	<script src="Buttons/js/buttons.html5.min.js"></script>
	<script src="JSZip/jszip.min.js"></script>
	<script src="pdfmake/pdfmake.min.js"></script>
	<script src="pdfmake/vfs_fonts.js"></script>
	 
	<script type="text/javascript" src="js/main_folios.js"></script>  

</body>
</html>