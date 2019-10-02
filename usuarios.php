<?php
include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$consulta = "SELECT U.id_usuario, U.nombre_usuario, U.apellido_usuario, U.cedula_usuario, U.telefono_usuario, U.email_usuario, TU.nombre_tipo_usuario, C.razon_social_cliente 
			FROM usuarios U, tipos_de_usuario TU, clientes C 
			WHERE  U.Tipos_de_usuario_id_Tipo_usuario = TU.id_Tipo_usuario AND U.Clientes_id_cliente=C.id_cliente 
			ORDER BY id_usuario";
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
	<title>Modulo Usuarios</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- CSS personalizado --> 
	<link rel="stylesheet" href="main.css">  
	<!--datables CSS básico-->
	<link rel="stylesheet" type="text/css" href="datatables/datatables.min.css"/>
	<!--datables estilo bootstrap 4 CSS-->  
	<link rel="stylesheet"  type="text/css" href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
	<script src="https://kit.fontawesome.com/b2b904e426.js" crossorigin="anonymous"></script>
  </head>
	
  <body> 
	 <header>
<!--<h3 class="text-center text-light">Tutorial</h3>-->
		 <h4 class="text-center text-light">Administracion de USUARIOS</h4> 
	 </header>    
	  
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
			<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle"></i> Nuevo usuario</button>    
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table id="tablaPersonas" class="table table-striped table-bordered table-condensed" style="width:100%">
						<thead class="text-center">
							<tr>
								<th>ID</th>
								<th>Identificación</th>
								<th>Nombre</th>
								<th>Apellido</th>
								<th>Teléfono</th>
								<th>E-mail</th>
								<th>Tipo</th>
								<th>Cliente</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($data as $dat) {
							?>
							<tr>
								<td><?php echo $dat['id_usuario'] ?></td>
								<td><?php echo $dat['cedula_usuario'] ?></td>
								<td><?php echo $dat['nombre_usuario'] ?></td>
								<td><?php echo $dat['apellido_usuario'] ?></td>
								<td><?php echo $dat['telefono_usuario'] ?></td>
								<td><?php echo $dat['email_usuario'] ?></td>
								<td><?php echo $dat['nombre_tipo_usuario'] ?></td>
								<td><?php echo $dat['razon_social_cliente'] ?></td>
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
		<form id="formPersonas">
			<div class="modal-body">
				<div class="form-group">
					<label for="id_usuario" class="col-form-label">ID:</label>
					<input type="text" class="form-control" id="id_usuario" disabled>
				</div>
				<div class="form-group">
					<label for="cedula_usuario" class="col-form-label">Cedula:</label>
					<input type="text" class="form-control" id="cedula_usuario">
				</div>
				<div class="form-group">
					<label for="nombre_usuario" class="col-form-label">Nombres:</label>
					<input type="text" class="form-control" id="nombre_usuario">
				</div>
				<div class="form-group">
					<label for="apellido_usuario" class="col-form-label">Apellidos:</label>
					<input type="text" class="form-control" id="apellido_usuario">
				</div>
				<div class="form-group">
					<label for="telefono_usuario" class="col-form-label">Teléfono:</label>
					<input type="text" class="form-control" id="telefono_usuario">
				</div>
				<div class="form-group">
					<label for="email_usuario" class="col-form-label">E-mail:</label>
					<input type="mail" class="form-control" id="email_usuario">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light" data-dismiss="modal"><i class="fas fa-times-circle"></i> Cancelar</button>
				<button type="submit" id="btnGuardar" class="btn btn-dark"><i class="fas fa-check-circle"></i> Guardar</button>
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
	 
	<script type="text/javascript" src="main.js"></script>  

</body>
</html>
