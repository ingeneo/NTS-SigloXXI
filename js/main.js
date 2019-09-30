$(document).ready(function () {
	tablaPersonas = $("#lista_usuarios").DataTable({
		"responsive": true,
		"dom": 'Bfrtilp',
		"buttons": [{
				extend: 'excelHtml5',
				text: '<i class="fa fa-file-excel-o"></i>',
				titleAttr: 'Exportar a excel',
				className: 'btn btn-success'
			},
			{
				extend: 'pdfHtml5',
				text: '<i class="fa fa-file-pdf-o"></i>',
				titleAttr: 'Exportar a Pdf',
				className: 'btn btn-danger'
			},
			{
				extend: 'csvHtml5',
				text: '<i class="fa fa-file-alt"></i>',
				titleAttr: 'Exportar a CSV',
				className: 'btn btn-info'
			}
		],
		"columnDefs": [{
			"targets": -1,
			"data": null,
			"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btnEditar'>Editar</button><button class='btn btn-danger btnBorrar'>Borrar</button></div></div>"
		}],

		//Para cambiar el lenguaje a español
		"language": {
			"lengthMenu": "Mostrar _MENU_ registros",
			"zeroRecords": "No se encontraron resultados",
			"info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
			"infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
			"infoFiltered": "(filtrado de un total de _MAX_ registros)",
			"sSearch": "Buscar:",
			"oPaginate": {
				"sFirst": "Primero",
				"sLast": "Último",
				"sNext": "Siguiente",
				"sPrevious": "Anterior"
			},
			"sProcessing": "Procesando...",
		}
	});

	$("#btnNuevo").click(function () {
		$("#formPersonas").trigger("reset");
		$(".modal-header").css("background-color", "#28a745");
		$(".modal-header").css("color", "white");
		$(".modal-title").text("Agregar Usuario");
		$("#modalCRUD").modal("show");
		id = null;
		opcion = 1; //alta
	});

	$('#btnNuevo').click(function () {
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

	$('#btnNuevo').click(function () {
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

	var fila; //capturar la fila para editar o borrar el registro

	//botón EDITAR    
	$(document).on("click", ".btnEditar", function () {
		fila = $(this).closest("tr");
		cedula = parseInt(fila.find('td:eq(0)').text());
		nombres = fila.find('td:eq(1)').text();
		apellidos = fila.find('td:eq(2)').text();
		telefono = parseInt(fila.find('td:eq(3)').text());
		correo = fila.find('td:eq(4)').text();
		tipo_usuario = parseInt(fila.find('td:eq(5)').text());
		cliente = parseInt(fila.find('td:eq(6)').text());



		$("#cedula_cliente").val(cedula);
		$("#nombre_cliente").val(nombre);
		$("#apellido_usuario").val(apellido);
		$("#telefono_usuario").val(telefono);
		$("#email_usuario").val(email);
		$("#tipo_usuario").val(tipo_usuario);
		$("#nombre_cliente").val(cliente);
		opcion = 2; //editar

		$(".modal-header").css("background-color", "#007bff");
		$(".modal-header").css("color", "white");
		$(".modal-title").text("Edición de Usuario");
		$("#modalCRUD").modal("show");

	});

	//botón BORRAR
	$(document).on("click", ".btnBorrar", function () {
		fila = $(this);
		cedula = parseInt($(this).closest("tr").find('td:eq(0)').text());
		opcion = 3; //borrar
		var respuesta = confirm("¿Está seguro de eliminar el registro: " + cedula + "?");
		if (respuesta) {
			$.ajax({
				url: "bd/crud_usuarios.php",
				type: "POST",
				dataType: "json",
				data: {
					opcion: opcion,
					cedula: cedula
				},
				success: function () {
					tablaPersonas.row(fila.parents('tr')).remove().draw();
				}
			});
		}
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
			url: "bd/crud_usuarios.php",
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
				if (opcion == 1) {
					tablaPersonas.row.add([cedula, nombre, apellido, telefono, email, tipo_usuario, nombre_cliente]).draw();
				} else {
					tablaPersonas.row(fila).data([cedula, nombre, apellido, telefono, email, tipo_usuario, nombre_cliente]).draw();
				}
			}
		});
		$("#modalCRUD").modal("hide");

	});

});