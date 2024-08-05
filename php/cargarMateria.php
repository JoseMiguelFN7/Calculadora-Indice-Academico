<?php
    require "./conexion.php";
    $nombre = $_POST['nombre'];
    $UC= $_POST['UC'];
    $nota= $_POST['nota'];
    $trimestre= $_POST['trimestre'];

    $sql = "INSERT INTO `materias` (`ID`, `Nombre`, `UC`, `Nota_FK`, `Trimestre`) VALUES (NULL, '$nombre', '$UC', (SELECT notas.ID FROM notas WHERE notas.Nota='$nota'), '$trimestre');";

    if ($conn->query($sql) === TRUE) {
        echo "Todo bien pibe";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();
?>