<?php
include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$consulta = "SELECT E.id_estante, E.cara, E.modulo, E.piso, E.entrepano, B.nombre_bodega 
			FROM estante E, bodega B 
			WHERE  E.Bodega_id_bodega = B.id_bodega 
			ORDER BY nombre_bodega";
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
	<title>Modulo Estantes</title>
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
				<h1 class="titulos text-center text-uppercase">Administración de Estantes</h1>
			</div>
		</div>
	</header>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
			<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="icono1 fas fa-plus-circle"></i> Nuevo Estante</button>    
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table id="tablaEstantes" class="table table-striped table-bordered table-condensed" style="width:100%">
						<thead class="text-center">
							<tr>
								<th>ID</th>
								<th>Cara</th>
								<th>Modulo</th>
								<th>Piso</th>
								<th>Entrepaño</th>
								<th>Bodega</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($data as $dat) {
							?>
							<tr>
								<td><?php echo $dat['id_estante'] ?></td>
								<td><?php echo $dat['cara'] ?></td>
								<td><?php echo $dat['modulo'] ?></td>
								<td><?php echo $dat['piso'] ?></td>
								<td><?php echo $dat['entrepano'] ?></td>
								<td><?php echo $dat['nombre_bodega'] ?></td>
								<td nowrap></td>
							</tr>
							<?php
								}
							?>
						</tbody>
						<tfoot class="text-center">
							<tr>
								<th>ID</th>
								<th>Cara</th>
								<th>Modulo</th>
								<th>Piso</th>
								<th>Entrepaño</th>
								<th>Bodega</th>
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
		<form id="formEstantes">
			<div class="modal-body">
				<input type="hidden" class="form-control" id="id_estante">
				<div class="form-group">
					<label for="cara" class="col-form-label">Cara:</label>
					<input type="text" class="form-control" id="cara">
				</div>
				<div class="form-group">
					<label for="modulo" class="col-form-label">Modulo:</label>
					<input type="text" class="form-control" id="modulo">
				</div>
				<div class="form-group">
					<label for="piso" class="col-form-label">Piso:</label>
					<input type="text" class="form-control" id="piso">
				</div>
				<div class="form-group">
					<label for="entrepano" class="col-form-label">Entrepaño:</label>
					<input type="text" class="form-control" id="entrepano">
				</div>
				<div class="form-group">
					<label for="lista_bodegas" class=" col-form-label">Bodega:</label>
					<select class="form-control" id="lista_bodegas" name="lista_bodegas" required></select>
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
	 
	<script type="text/javascript" src="js/main_estantes.js"></script>

</body>
</html>
