<?php

$datos = array("idRol" => $_POST['idRol'],
                "usuario" => $_POST['usuario'], 
                "password" => sha1($_POST['password']),      
                "ubicacion" => $_POST['ubicacion'],
                "activo" => 1,
                "fechaInsert" => date("Y-m-d"),
                "ult_acce" => date("Y-m-d"),
                "id_area" => $_POST['id_area'],
                "id_ofici" => $_POST['id_ofici']);

include "../../../clases/Usuarios.php";
$Usuarios = new Usuarios();

echo $Usuarios->agregaNuevoUsuario($datos);