<?php
include_once ('config/Conexion.php');
?>

<p>
CONSULTAR PLACA Y MARCA DE CADA VEHICULO JUNTO CON EL NOMBRE DE LA CIUDAD DE 
 DONDE PROVIENEN. TAMBIEN DEBEN SALIR LOS DATOS DE LAS CIUDADES QUE NO TIENEN
VEHICULOS ASOCIADOS.
</p>


<table border="1">
      
        <th>placa</th>
        <th>marca</th>
        <th>ciudad</th>
          
    <tbody>
    <?php
    $conexion = Database::conectar();
    $consulta = "SELECT vehiculo.placa as placa, vehiculo.marca as marca, ciudad.nombre as ciudad FROM vehiculo
                 RIGHT JOIN ciudad ON vehiculo.codciudad = ciudad.codigo";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $datos = $resultado->fetchAll(PDO::FETCH_OBJ);
?>


  <?php  foreach($datos as $dato): ?>


    <tr>
        <td> <?php echo $dato->placa?></td> 
        <td> <?php echo $dato->marca?></td> 
        <td> <?php echo $dato->ciudad?></td> 
    </tr>        

        <?php   endforeach; ?>

    </tbody>
</table>

<br>
<br>
<br>

<p>
CONSULTAR LOS DATOS DE LOS PROPIETARIOS QUE TAMBIEN HAYAN SIDO ALCALDES.
</p>

<table border="1">
      
      
        <th>cedula</th>
        <th>nombre</th>
      
          
    <tbody>
    <?php
    $conexion = Database::conectar();
    $consulta = "SELECT propietario.cedula as cedula , propietario.nombre as nombre, alcalde.cedula, alcalde.nombre, alcalde.cedula
                 FROM propietario
                INNER JOIN alcalde ON propietario.cedula = alcalde.cedula";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $datos = $resultado->fetchAll(PDO::FETCH_OBJ);
?>


  <?php  foreach($datos as $dato): ?>


    <tr>
        <td> <?php echo $dato->cedula?></td> 
        <td> <?php echo $dato->nombre?></td> 
    </tr>        

        <?php   endforeach; ?>

    </tbody>
</table>

<br>
<br>
<br>

<p>
 CONSULTAR EL NOMBRE DEL PROPIETARIO MAS JOVEN.
</p>

<table border="1">
      
      
   
        <th>edad</th>
        <th>nombre</th>
          
    <tbody>
    <?php
    $conexion = Database::conectar();
    $consulta = "  SELECT MIN(edad) as edad, nombre as nombre
                 FROM propietario
                 GROUP BY edad, nombre ";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $datos = $resultado->fetchAll(PDO::FETCH_OBJ);
?>


  <?php  foreach($datos as $dato): ?>


    <tr>
        
    <td> <?php echo $dato->edad?></td> 
    <td> <?php echo $dato->nombre?></td> 
      
    </tr>        

        <?php   endforeach; ?>

    </tbody>
</table>

<br>
<br>
<br>

<p>
 HACER UN PROCESO QUE RECORRA TODOS LOS VEHICULOS MATRICULADOS Y QUE VERIFIQUE
 LO SIGUIENTE:
   1. SI EL VEHICULO ES MARCA CHEVROLET Y ES ANTIGUO, SE LE DEBE RESETEAR SU 
       CANTIDAD DE CHOQUES.
   2. SI EL VEHICULO ES MARCA MAZDA Y ES CLASICO, SE LE DEBE AUMENTAR EN UN 5%
       SU VALOR.
 POR CADA VEHICULO AFECTADO, SE DEBE GRABAR EN OTRA TABLA EL LOG DE LO CAMBIADO.
 UTILIZAR PROCEDIMIENTO, FUNCIONES Y TRIGGERS.
</p>

<table border="1">
      
      
   
        <th>placa</th>
        <th>marca</th>
        <th>antiguo</th>
        <th>choques</th>
        <th>clasico</th>
        <th>valor</th>
     
    <tbody>
    <?php
    $conexion = Database::conectar();
    $consulta = "  SELECT vehiculo.placa as placa, vehiculo.marca as marca , antiguo.placaveh as antiguo,
                          antiguo.cantchoques as choques, clasico.placaveh as clasico,
                          clasico.valor as valor
                 FROM vehiculo LEFT JOIN antiguo ON vehiculo.placa = antiguo.placaveh
                               LEFT JOIN clasico ON clasico.placaveh = vehiculo.placa  ";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $datos = $resultado->fetchAll(PDO::FETCH_OBJ);
?>


  <?php  foreach($datos as $dato): ?>


    <tr>
        
    <td> <?php echo $dato->placa?></td> 
    <td> <?php echo $dato->marca?></td> 
    <td> <?php echo $dato->antiguo?></td> 
    <td> <?php echo $dato->choques?></td> 
    <td> <?php echo $dato->clasico?></td> 
    <td> <?php echo $dato->valor?></td> 
    </tr>        

        <?php   endforeach; ?>

    </tbody>
</table>

<br>
<br>
<br>
<p>
 CONSULTAR PLACA Y MARCA DE LOS VEHICULOS RENAULT O CHEVROLET, QUE HAYAN DESFILADO
 EN VERSIONES DONDE EL ALCALDE ERA FICO GUTIERREZ O ALONSO SALAZAR, Y QUE TENGA
 PROPIETARIOS MAYORES DE 30 A�OS.
</p>
<h3>En este punto tuve problemas por el caracter especial Ñ</h3>
<img src="caracter_especial.png" alt="">

<table border="1">
      
        <th>año version</th>
        <th>alcalde</th>
       
          
    <tbody>
    <?php
    $conexion = Database::conectar();
    $consulta = "SELECT version_desfile.cedalcalde as cedula, version_desfile.a�o as año, alcalde.nombre as alcalde 
                 FROM version_desfile
                 INNER JOIN alcalde ON alcalde.cedula = version_desfile.cedalcalde
                 WHERE alcalde.nombre = 'FICO GUTIERREZ' OR alcalde.nombre = 'ALONSO SALAZAR' ";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $datos = $resultado->fetchAll(PDO::FETCH_OBJ);
?>


  <?php  foreach($datos as $dato): ?>


    <tr>

      
        <td> <?php echo $dato->año ?></td> 
        <td> <?php echo $dato->alcalde ?></td> 
    </tr>        

        <?php   endforeach; ?>

    </tbody>
</table>