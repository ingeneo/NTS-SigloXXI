<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Menu Principal</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="datatables/datatables.min.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
	<link rel="stylesheet" href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="Buttons/css/buttons.bootstrap4.min.css">
	<link rel="stylesheet" href="css/estilos.css">
</head>

<body>
	<div class="contenedor container-fluid">
		<div class="row fondo">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h1 class="titulos text-center text-uppercase">menú princial - Administrador</h1>
			</div>
		</div>
		<div class="usuarios row">
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="usuarios.php" class="btn1"><i class="fas fa-users"></i></a>
				<h3>Usuarios</h3>
			</div>
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="clientes.php" class="btn1"><i class="fas fa-sitemap"></i></a>
				<h3>Clientes</h3>
			</div>
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="bodegas.php" class="btn1"><i class="fas fa-warehouse"></i></a>
				<h3>Bodega</h3>
			</div>
		</div>

		<div class="usuarios row">
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="estantes.php" class="btn1"><i class="fas fa-pallet"></i></a>
				<h3>Estantes</h3>
			</div>
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="cajas.php" class="btn1"><i class="fas fa-box-open"></i></a>
				<h3>Cajas</h3>
			</div>
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="carpetas.php" class="btn1"><i class="far fa-folder-open"></i></a>
				<h3>Carpetas</h3>
			</div>
		</div>

		<div class="usuarios row">
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="folios.php" class="btn1"><i class="fas fa-file-invoice"></i></a>
				<h3>Folios</h3>
			</div>
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="prestamos.php" class="btn1"><i class="fas fa-chalkboard-teacher"></i></a>
				<h3>Prestamos</h3>
			</div>
			<div class="caja_icono col-lg-4 col-md-4 col-sm-12">
				<a href="consultas.php" class="btn1"><i class="fab fa-searchengin"></i></a>
				<h3>Consultas y Reportes</h3>
			</div>
		</div>
	</div>
	<script src="jquery/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>

</body>

</html>