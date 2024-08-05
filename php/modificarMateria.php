<?php
    require "./conexion.php";

    $ID = $_POST['ID'];
    $nombre = $_POST['nombre'];
    $UC= $_POST['UC'];
    $nota= $_POST['nota'];
    $trimestre= $_POST['trimestre'];

    $sql = "UPDATE materias SET Nombre='$nombre', UC='$UC', Nota_FK=(SELECT notas.ID FROM notas WHERE notas.Nota='$nota'), Trimestre='$trimestre' WHERE materias.ID='$ID'";
    if ($conn->query($sql) === TRUE) {
        echo "Todo bien pibe";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();
?>