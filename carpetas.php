<?php
include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$consulta = "SELECT CP.id_carpeta, CP.codigo_carpeta, CJ.nombre_caja 
			FROM carpeta CP, cajas CJ 
			WHERE  CP.Cajas_id_caja = CJ.id_caja 
			ORDER BY codigo_carpeta";
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
	<title>Modulo Carpetas</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- CSS personalizado --> 
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/estilos.css">
	<!--datables CSS básico-->
	<link rel="stylesheet" type="text/css" href="datatables/datatables.min.css"/>
	<!--datables estilo bootstrap 4 CSS-->  
	<link rel="stylesheet"  type="text/css" href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
	<script src="https://kit.fontawesome.com/b2b904e426.js" crossorigin="anonymous"></script>
  </head>
	
  <body> 
	 <header>
		<div class="row fondo">
			<div class="col-sm-1 col-md-1">
				<a href="home.php"><i class="icono fas fa-home"></i></a>
			</div>
			<div class="col-sm-11 col-md-11 col-lg-11">
				<h1 class="titulos text-center text-uppercase">Administración de Carpetas</h1>
			</div>
		</div>
	</header>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
			<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="icono1 fas fa-plus-circle"></i> Nueva Carpeta</button>    
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table id="tablaCarpetas" class="table table-striped table-bordered table-condensed" style="width:100%">
						<thead class="text-center">
							<tr>
								<th>ID</th>
								<th>Serial Carpeta</th>
								<th>Caja al que pertenece</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($data as $dat) {
							?>
							<tr>
								<td><?php echo $dat['id_carpeta'] ?></td>
								<td><?php echo $dat['codigo_carpeta'] ?></td>
								<td><?php echo $dat['nombre_caja'] ?></td>
								<td nowrap></td>
							</tr>
							<?php
								}
							?>
						</tbody>
						<tfoot class="text-center">
							<tr>
								<th>ID</th>
								<th>Serial Carpeta</th>
								<th>Caja al que pertenece</th>
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
		<form id="formCarpetas">
			<div class="modal-body">
				<input type="hidden" class="form-control" id="id_carpeta">
				<div class="form-group">
					<label for="codigo_carpeta class="col-form-label">Serial carpeta:</label>
					<input type="text" class="form-control" id="codigo_carpeta">
				</div>
				<div class="form-group">
					<label for="lista_cajas" class=" col-form-label">Caja al que pertenece:</label>
					<select class="form-control" id="lista_cajas" name="lista_cajas" required></select>
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
	 
	<script type="text/javascript" src="js/main_carpetas.js"></script>  

</body>
</html>
