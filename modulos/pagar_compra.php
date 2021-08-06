<?php

check_user('pagar_compra');



if(isset($subir)){

	$nombre = clear($nombre);



	$comprobante = "";



	if(is_uploaded_file($_FILES['comprobante']['tmp_name'])){

		$comprobante = date("His").rand(0,1000).".png";

		move_uploaded_file($_FILES['comprobante']['tmp_name'], "comprobantes/".$comprobante);

	}



	$q = $mysqli->query("INSERT INTO pagos (id_cliente,id_compra,comprobante,nombre,fecha, estado) VALUES ('".$_SESSION['id_cliente']."','$id','$comprobante','$nombre',NOW(),0)");

	if($q == TRUE) {
		// echo "<h2>Success</h2>";
	} else {
		echo "<h2>Hubo un error al procesar lo solicitado</h2>";
		// echo $mysqli->error;
	}

	alert("Comprobante enviado",1,'miscompras');

	//redir("?p=miscompras");



}

?>



<h1>Metodos de pago</h1>



<table class="table table-striped">

<tr>

	<th>Tipo de pago</th>

	<th>Cuenta</th>

	<th>Beneficiario</th>

	<th>Acciones</th>

</tr>



<tr>

	<td>Transferencia Bancaria</td>

	<td>0000-000-000</td>

	<td>NNN</td>

	<th><a target="_blank" href="https://secure.payulatam.com/login.zul"> Ir al pago </a></th>

</tr>

</table>



<h1>Envia el comprobante de pago de la compra</h1>



<form method="post" action="" enctype="multipart/form-data">

	<div class="form-group">

		<label><small>Adjuntar comprobante</small></label>

		<input type="file" class="form-control" name="comprobante" title="Adjuntar Comprobante" required/>

	</div>

	<div class="form-group">

		<input type="text" class="form-control" name="nombre" title="Nombre de la persona que transfiere"/>

	</div>

	<div class="form-group">

		<input type="submit" name="subir" class="btn btn-primary" value="Enviar"/>

	</div>

</form>