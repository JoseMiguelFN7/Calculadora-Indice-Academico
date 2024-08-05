<?php
    header('Content-Type: application/json');
    require "./conexion.php";
    $sql = "SELECT Nota FROM notas";

    $resultado = $conn->query($sql);

    $notas = array();
    if($resultado->num_rows>0){
        $notas = $resultado->fetch_all(MYSQLI_ASSOC);
    }
    echo json_encode($notas,true);
    $conn->close();
?>