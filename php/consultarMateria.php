<?php
    header('Content-Type: application/json');
    require "./conexion.php";
    $n = $_POST['Nombre'];
    $sql = "SELECT ID, Nombre, UC, Nota, Trimestre FROM materias_notas WHERE Nombre = '$n'";

    $resultado = $conn->query($sql);

    $notas = array();
    if($resultado->num_rows>0){
        $notas = $resultado->fetch_all(MYSQLI_ASSOC);
    }
    echo json_encode($notas,true);
    $conn->close();
?>