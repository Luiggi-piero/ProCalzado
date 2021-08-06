<?php

check_user("productos");





// echo "<h1>CAT: " . $cat . "</h1>";
if(isset($cat) && $cat == 13) {
	unset($cat);
}
if(isset($busq) && empty($busq)) {
	unset($busq);
}

if(isset($cat)){
	/*
	echo "<pre>";
	print_r($cat);
	echo "</pre>";*/

	$sc = $mysqli->query("SELECT * FROM categorias WHERE id = '$cat'");

	$rc = mysqli_fetch_array($sc);

	?>

	<h1>Categoria Filtrada por: <?=$rc['categoria']?></h1>

	<?php

}



if(isset($agregar) && isset($cant)){



	$idp = clear($agregar);

	$cant = clear($cant);

	$id_cliente = clear($_SESSION['id_cliente']);



	$v = $mysqli->query("SELECT * FROM carro WHERE id_cliente = '$id_cliente' AND id_producto = '$idp'");



	if(mysqli_num_rows($v)>0){



		$q = $mysqli->query("UPDATE carro SET cant = cant + $cant WHERE id_cliente = '$id_cliente' AND id_producto = '$idp'");

	

	}else{



		$q = $mysqli->query("INSERT INTO carro (id_cliente,id_producto,cant) VALUES ($id_cliente,$idp,$cant)");



	}



	alert("Se ha agregado al carro de compras",1,'productos');

	//redir("?p=productos");

}



if(isset($busq) && isset($cat)){
	// echo "<h1>Cond 1</h1>";

	$q = $mysqli->query("SELECT * FROM productos WHERE name like '%$busq%' AND id_categoria = '$cat'");

}elseif(isset($cat) && !isset($busq)){
	// echo "<h1>Cond 2</h1>";

	$q = $mysqli->query("SELECT * FROM productos WHERE id_categoria = '$cat' ORDER BY id DESC");

}elseif(isset($busq) && !isset($cat)){
	// echo  "<h1>Cond 3</h1>";;
	$q = $mysqli->query("SELECT * FROM productos WHERE name like '%$busq%'");

}elseif(!isset($busq) && !isset($cat)){
	// echo "<h1>Cond 4</h1>";
	$q = $mysqli->query("SELECT * FROM productos ORDER BY id DESC");

}else{
	// echo "<h1>Cond 5</h1>";
	$q = $mysqli->query("SELECT * FROM productos ORDER BY id DESC");

}

?>

	

	<form method="post" action="">

		<div class="row">

			<div class="col-md-5">

				<div class="form-group">
					<?php
					$v = isset($busq)? "value='$busq'" : "";
					?>

					<input type="text" class="form-control" name="busq" placeholder="Coloca el nombre del producto" <?php echo $v ?>/>

				</div>

			</div>

			<div class="col-md-5">

				<select id="categoria" name="cat" class="form-control">

					<?php

					$cats = $mysqli->query("SELECT * FROM categorias ORDER BY categoria ASC");

					while($rcat = mysqli_fetch_array($cats)){
						$s = (isset($cat) && $rcat['id'] == $cat)? " selected" : "";
						?>

						<option value="<?=$rcat['id']?>" <?php echo $s ?>><?=$rcat['categoria']?></option>

						<?php

					}

					?>

				</select>

			</div>

			<div class="col-md-2">

				<button type="submit" class="btn btn-primary" name="buscar"><i class="fa fa-serch"></i> Buscar</button>

			</div>

		</div>

	</form>

<?php
$cont = 0;

while($r=mysqli_fetch_array($q)){
	$cont++;
	$preciototal = 0;

			if($r['oferta']>0){

				if(strlen($r['oferta'])==1){

					$desc = "0.0".$r['oferta'];

				}else{

					$desc = "0.".$r['oferta'];

				}



				$preciototal = $r['price'] -($r['price'] * $desc);

			}else{

				$preciototal = $r['price'];

			}

	?>

		<div class="producto">

			<div class="name_producto"><?=$r['name']?></div>

			<div><img class="img_producto" src="productos/<?=$r['imagen']?>"/></div>

			<?php

			if($r['oferta']>0){

				?>

				<del><?=$r['price']?> <?=$divisa?></del> <span class="precio"> <?=$preciototal?> <?=$divisa?> </span>

				<?php

			}else{

				?>

				<span class="precio"><br><?=$r['price']?> <?=$divisa?></span>

				<?php

			}

			?>

			

			<button class="btn btn-warning pull-right" onclick="agregar_carro('<?=$r['id']?>');"><i class="fa fa-shopping-cart"></i></button>

		</div>

	<?php

}

if($cont == 0):
?>

<div class="error">
	<h2>No se encontraron productos</h2>
</div>

<?php
endif;
?>



<script type="text/javascript">

	

	function agregar_carro(idp){

		var cant = prompt("¿Que cantidad desea agregar?",1);



		if(cant.length>0){

			window.location="?p=productos&agregar="+idp+"&cant="+cant;

		}

	}



</script>