<?php
include_once 'bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$consulta = "SELECT U.id_usuario, U.nombre_usuario, U.apellido_usuario, U.cedula_usuario, U.telefono_usuario, U.email_usuario, TU.nombre_tipo_usuario, C.razon_social_cliente 
			FROM usuarios U, tipos_de_usuario TU, clientes C 
			WHERE  U.Tipos_de_usuario_id_Tipo_usuario = TU.id_Tipo_usuario AND U.Clientes_id_cliente=C.id_cliente 
			ORDER BY id_usuario";

$resultado = $conexion->prepare($consulta);
$resultado->execute();
$data = $resultado->fetchAll(PDO::FETCH_ASSOC);
?>

<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="#" />
	<title>Modulo de usuarios</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- CSS personalizado -->
	<link rel="stylesheet" href="css/estilos.css">
	<!--datables CSS básico-->
	<link rel="stylesheet" href="datatables/datatables.min.css" />
	<!--datables estilo bootstrap 4 CSS-->
	<link rel="stylesheet" href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
	<script src="https://kit.fontawesome.com/b2b904e426.js" crossorigin="anonymous"></script>

</head>

<body>
	<header>
		<div class="row fondo">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h1 class="titulos text-center text-uppercase">Listado de usuarios activos</h1>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal">Nuevo</button>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive col-sm-12">
					<table id="lista_usuarios" class="table table-bordered table-hover table-bordered" cellspacing="0"
						style="width:100%">
						<thead class="text-center">
							<tr>
								<th nowrap>Cedula</th>
								<th nowrap>Nombres</th>
								<th nowrap>Apellidos</th>
								<th nowrap>Telefono</th>
								<th nowrap>Correo</th>
								<th nowrap>Tipo de Usuario</th>
								<th nowrap>Cliente</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($data as $dat) {
							?>
							<tr>
								<td><?php echo $dat['cedula_usuario']; ?></td>
								<td><?php echo $dat['nombre_usuario']; ?></td>
								<td><?php echo $dat['apellido_usuario']; ?></td>
								<td><?php echo $dat['telefono_usuario']; ?></td>
								<td><?php echo $dat['email_usuario']; ?></td>
								<td><?php echo $dat['nombre_tipo_usuario']; ?></td>
								<td><?php echo $dat['razon_social_cliente']; ?></td>
								<td></td>
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
	<div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close"><span
							aria-hidden="true">&times;</span></button>
				</div>
				<form id="form_usuarios">
					<div class=" modal-body">
						<div class="form-group">
							<label for="cedula_usuario" class=" col-form-label">Identificación:</label>
							<input type="text" class="form-control" id="cedula_usuario">
						</div>
						<div class="form-group">
							<label for="nombre_usuario" class=" col-form-label">Nombres:</label>
							<input type="text" class="form-control" id="nombre_usuario">
						</div>
						<div class="form-group">
							<label for="apellido_usuario" class=" col-form-label">Apellidos:</label>
							<input type="text" class="form-control" id="apellido_usuario">
						</div>
						<div class="form-group">
							<label for="telefono_usuario" class=" col-form-label">Telefono:</label>
							<input type="text" class="form-control" id="telefono_usuario">
						</div>
						<div class="form-group">
							<label for="email_usuario" class=" col-form-label">E-mail:</label>
							<input type="email" class="form-control" id="email_usuario">
						</div>
						<div class="form-group">
							<label for="tipo_usuario" class=" col-form-label">Tipo de usuario:</label>
							<select class="form-control" id="tipo_usuario" name="tipo_usuario" required></select>
						</div>
						<div class="form-group">
							<label for="nombre_cliente" class=" col-form-label">Tipo de usuario:</label>
							<select class="form-control" id="nombre_cliente" name="nombre_cliente" required></select>
						</div>
					</div>
					<div class=" modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
						<button type="submit" id="btnGuardar" class="btn btn-dark">Guardar</button>

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
	<script src="datatables/datatables.min.js"></script>

	<!-- Botones para usar en dataTables -->
	<script src="Buttons/js/dataTables.buttons.min.js"></script>
	<script src="Buttons/js/buttons.html5.min.js"></script>
	<script src="JSZip/jszip.min.js"></script>
	<script src="pdfmake/pdfmake.min.js"></script>
	<script src="pdfmake/vfs_fonts.js"></script>

	<script type="text/javascript" src="js/main.js"></script>


</body>

</html>