<?php
include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$consulta = "SELECT C.id_cliente, C.nit_cliente, C.razon_social_cliente, C.direccion_cliente, C.telefono_cliente, C.email_cliente, M.municipio 
			FROM clientes C, municipios M 
			WHERE  C.Municipios_id_municipio = M.id_municipio 
			ORDER BY razon_social_cliente";
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
	<title>Modulo Cajas</title>
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
				<h1 class="titulos text-center text-uppercase">Administración de Cajas</h1>
			</div>
		</div>
	</header>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
			<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="icono1 fas fa-plus-circle"></i> Nueva caja</button>    
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table id="tablaCajas" class="table table-striped table-bordered table-condensed" style="width:100%">
						<thead class="text-center">
							<tr>
								<th>ID</th>
								<th>Serial</th>
								<th>Descripción</th>
								<th>Ubicación</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($data as $dat) {
							?>
							<tr>
								<td><?php echo $dat['id_caja'] ?></td>
								<td><?php echo $dat['nombre_caja'] ?></td>
								<td><?php echo $dat['descripcion_caja'] ?></td>
								<td><?php echo $dat['direccion_cliente'] ?></td>
								<td><?php echo $dat['telefono_cliente'] ?></td>
								<td nowrap></td>
							</tr>
							<?php
								}
							?>
						</tbody>
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
		<form id="formClientes">
			<div class="modal-body">
				<input type="hidden" class="form-control" id="id_cliente">
				<div class="form-group">
					<label for="nit_cliente" class="col-form-label">Identificación:</label>
					<input type="text" class="form-control" id="nit_cliente">
				</div>
				<div class="form-group">
					<label for="razon_social_cliente" class="col-form-label">Razon Social:</label>
					<input type="text" class="form-control" id="razon_social_cliente">
				</div>
				<div class="form-group">
					<label for="direccion_cliente" class="col-form-label">Dirección:</label>
					<input type="text" class="form-control" id="direccion_cliente">
				</div>
				<div class="form-group">
					<label for="telefono_cliente" class="col-form-label">Teléfono:</label>
					<input type="text" class="form-control" id="telefono_cliente">
				</div>
				<div class="form-group">
					<label for="email_cliente" class="col-form-label">E-mail:</label>
					<input type="mail" class="form-control" id="email_cliente">
				</div>
				<div class="form-group">
					<label for="lista_depto" class=" col-form-label">Departamento:</label>
					<select class="form-control" id="lista_depto" name="lista_depto" required></select>
				</div>
				<div class="form-group">
					<label for="lista_ciudad" class=" col-form-label">Ciudad:</label>
					<select class="form-control" id="lista_ciudad" name="lista_ciudad" required></select>
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
	 
	<script type="text/javascript" src="js/main_clientes.js"></script>  

</body>
</html>
