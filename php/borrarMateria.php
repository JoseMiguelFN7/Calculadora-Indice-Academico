<?php
    require "./conexion.php";

    $ID = $_POST['ID'];

    if(isset($ID)){
        $sql = "DELETE FROM materias WHERE ID='$ID'";
        if ($conn->query($sql) === TRUE) {
            echo "Todo bien pibe";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    
    $conn->close();
?>