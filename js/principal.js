$(document).ready(function () {
	$("#lista_usuarios").dataTable({
		"columnDefs": [{
			"targets": -1,
			"data": null,
			"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btn_editar'>Editar</button><button class='btn btn-danger btn_eliminar'>Eliminar</button></div></div>"
		}],
		"language": espaniol
	});

	$('#btn_nuevo').click(function () {
		$.ajax({
				url: 'lista_tipo_usuario.php'
			})
			.done(function (ListaTipoUsuario) {
				$('#tipo_usuario').html(ListaTipoUsuario);
			})
			.fail(function () {
				alert('Hubo un error al cargar los tipos !');
			});
	});

	$('#btn_nuevo').click(function () {
		$.ajax({
				url: 'lista_clientes.php'
			})
			.done(function (ListaClientes) {
				$('#nombre_cliente').html(ListaClientes);
			})
			.fail(function () {
				alert('Hubo un error al cargar los clientes !');
			});
	});




	$("#btn_nuevo").click(function () {
		$("#form_usuarios").trigger("reset");
		$(".modal-header").css("background-color", "#28A745");
		$(".modal-header").css("color", "#F8F9FA");
		$(".modal-title").text("Ingreso de nuevos Usuarios");
		$("#modalCRUD").modal("show");
		id = null;
	});


	$("#form_usuarios").submit(function (e) {
		e.preventDefault();
		cedula = $.trim($("cedula_usuario").val());
		nombre = $.trim($("nombre_usuario").val());
		apellido = $.trim($("apellido_usuario").val());
		telefono = $.trim($("telefono_usuario").val());
		email = $.trim($("email_usuario").val());
		tipo_usuario = $.trim($("tipo_usuario").val());
		nombre_cliente = $.trim($("nombre_cliente").val());
		$.ajax({
			url: "crud_usuarios.php",
			type: "POST",
			dataType: "json",
			data: {
				'id': id,
				'cedula': cedula,
				'nombre': nombre,
				'apellido': apellido,
				'telefono': telefono,
				'email': email,
				'tipo_usuario': tipo_usuario,
				'nombre_cliente': nombre_cliente
			},
			success: function (data) {
				//var datos = JSON.parse(data);
				id = data[0].id;
				cedula = data[0].cedula;
				nombre = data[0].nombre;
				apellido = data[0].apellido;
				telefono = daa[0].telefono;
				email = data[0].email;
				tipo_usuario = data[0].tipo_usuario;
				nombre_cliente = data[0].nombre_cliente;
				tablaPersonas.row.add([cedula, nombre, apellido, telefono, email, tipo_usuario, nombre_cliente]).draw();
			}
		});
		$("#modalCRUD").modal("hide");




	});














}); /*Fin del document.ready linea 1.*/


var espaniol = {
	"sProcessing": "Procesando...",
	"sLengthMenu": "Mostrar _MENU_ registros",
	"sZeroRecords": "No se encontraron resultados",
	"sEmptyTable": "Ningún dato disponible en esta tabla",
	"sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	"sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
	"sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
	"sInfoPostFix": "",
	"sSearch": "Buscar:",
	"sUrl": "",
	"sInfoThousands": ",",
	"sLoadingRecords": "Cargando...",
	"oPaginate": {
		"sFirst": "Primero",
		"sLast": "Último",
		"sNext": "Siguiente",
		"sPrevious": "Anterior"
	},
	"oAria": {
		"sSortAscending": ": Activar para ordenar la columna de manera ascendente",
		"sSortDescending": ": Activar para ordenar la columna de manera descendente"
	}
};