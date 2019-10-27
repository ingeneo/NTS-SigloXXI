<?php

$fecha = date('Y-m-d');
$anio = date("Y", strtotime($fecha));

function TablaSeleccion() {
	$seleccion = $_POST['seleccion'];
	include_once 'conexion/conexion.php';
	$objeto = new Conexion();
	$conexion = $objeto->Conectar();
	
	if ($seleccion == 'cajas') {
		$consulta = "SELECT CJ.id_caja, CJ.serial_caja, CJ.descripcion_caja, UC.ubicacion_X, UC.ubicacion_Y, UC.ubicacion_Z, EI.nombre_estado_item, TC.nombre_tipo_caja, C.razon_social_cliente
				FROM cajas CJ, estado_item EI, ubicacion_caja UC, tipo_caja TC, clientes C
				WHERE CJ.Estado_item_id_estado_item = EI.id_estado_item
				AND CJ.Tipo_caja_id_tipo_caja = TC.id_tipo_caja
				AND CJ.Ubicacion_caja_id_ubicacion_caja = UC.id_ubicacion_caja
				AND CJ.Clientes_id_cliente = C.id_cliente
				ORDER BY id_caja";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data=$resultado->fetchAll(PDO::FETCH_ASSOC);

	?>
		<div class="table-responsive">
			<table id="tablaPrestamos" class="table table-striped table-bordered table-condensed" style="width:100%">
				<thead class="text-center">
					<tr>
						<th>ID</th>
						<th>Serial</th>
						<th>Descripción</th>
						<th>Ubicación</th>
						<th>Estado</th>
						<th>Tipo caja</th>
						<th>Propietario</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<?php
					foreach($data as $dat) {
					?>
					<tr>
						<td><?php echo $dat['id_caja'] ?></td>
						<td><?php echo $dat['serial_caja'] ?></td>
						<td><?php echo $dat['descripcion_caja'] ?></td>
						<td><?php echo $dat['ubicacion_X'].$dat['ubicacion_Y'].$dat['ubicacion_Z']?></td>
						<td><?php echo $dat['nombre_estado_item'] ?></td>
						<td><?php echo $dat['nombre_tipo_caja'] ?></td>
						<td><?php echo $dat['razon_social_cliente'] ?></td>
						<td nowrap></td>
					</tr>
					<?php
						}
					?>
				</tbody>
				<tfoot class="text-center">
					<tr>
						<th>ID</th>
						<th>Serial</th>
						<th>Descripción</th>
						<th>Ubicación</th>
						<th>Estado</th>
						<th>Tipo caja</th>
						<th>Propietario</th>
						<th style="display:none;"></th>
					</tr>
				</tfoot>
				<tr>
					<td nowrap colspan="8"><button class="btn-danger" name="1" value="<?php echo $dat['id_caja'] ?>" id="generar">Generar</button></td>
					<button type="button" class="btn btn-primary" onClick="generar()">Generar</button>
				</tr>
			</table>
		</div>
	<?php
	} else if($seleccion == 'carpeta') {
		$consulta = "SELECT CP.id_carpeta, CP.codigo_carpeta, CJ.serial_caja 
			FROM carpeta CP, cajas CJ 
			WHERE  CP.Cajas_id_caja = CJ.id_caja 
			ORDER BY codigo_carpeta";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data=$resultado->fetchAll(PDO::FETCH_ASSOC);
	
	?>
		<div class="table-responsive">
		<table id="tablaPrestamos" class="table table-striped table-bordered table-condensed" style="width:100%">
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
					<td><?php echo $dat['serial_caja'] ?></td>
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


	<?php

	} else if ($seleccion == 'folio') {
		$consulta = "SELECT F.id_folio, F.codigo_folio, F.desc_folio, CP.codigo_carpeta 
			FROM folio F, carpeta CP  
			WHERE  F.Carpeta_id_carpeta = CP.id_carpeta 
			ORDER BY id_folio";
		$resultado = $conexion->prepare($consulta);
		$resultado->execute();
		$data=$resultado->fetchAll(PDO::FETCH_ASSOC);

	?>
	
	<div class="table-responsive">
		<table id="tablaPrestamos" class="table table-striped table-bordered table-condensed" style="width:100%">
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

	<?php
	}
}
echo TablaSeleccion();
?>