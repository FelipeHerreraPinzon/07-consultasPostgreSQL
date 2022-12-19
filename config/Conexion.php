<?php
include ('datosConexion.php');
class Database{
    public static function conectar(){
        try {
           // $conexion = new PDO("mysql:host=".SERVER.";dbname=".DBNAME, USER, PASSWORD);
            $conexion = new PDO("pgsql:host=".SERVER.";port=".PORT.";dbname=".DBNAME, USER, PASSWORD);
            return $conexion;
        } catch (Exception $err) {
            die("el error es ". $err->getMessage());
        }
    }
}



?>
