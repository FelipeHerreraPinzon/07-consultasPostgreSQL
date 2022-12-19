<p>
 CONSULTAR PLACA Y MARCA DE LOS VEHICULOS RENAULT O CHEVROLET, QUE HAYAN DESFILADO
 EN VERSIONES DONDE EL ALCALDE ERA FICO GUTIERREZ O ALONSO SALAZAR, Y QUE TENGA
 PROPIETARIOS MAYORES DE 30 A�OS.
</p>


<table border="1">
      
        <th>año</th>
        <th>alcalde</th>
        <th></th>
          
    <tbody>
    <?php
    $conexion = Conexion::conectar();
    $consulta = "SELECT version_desfile.a�o as año, alcalde.nombre as alcalde, desfila.placaveh FROM version_desfile
                 INNER JOIN alcalde ON alcalde.cedula = version_desfile.cedalcalde  
                                    ON version_desfile.a�o = desfila.a�over 
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