<div >
  <h2>Historique Automatique</h2>
  <table class="table">
    <thead>
      <tr>
        <th class="text-center">ID Lampadaire</th>
        <th class="text-center">ID Action</th>
        <th class="text-center">Date</th>
        <th class="text-center">Temperature</th>
        <th class="text-center">Luminosite</th>
        <th class="text-center">Nombre Passage</th>
        
      </tr>
    </thead>
    <?php
      include_once "../config/dbconnect.php";
      $sql="SELECT * from historiqueautomatique";
      $result=$conn-> query($sql);
      $count=1;
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
           
    ?>
    <tr>
      <td><?=$count?></td>
      <td><?=$row["lampID"]?></td>
      <td><?=$row["actionID"]?></td> 
      <td><?=$row["dateTime"]?></td>
      <td><?=$row["temperature"]?></td>
      <td><?=$row["luminosite"]?></td>
      <td><?=$row["nbPassages"]?></td>
    </tr>
    <?php
            $count=$count+1;
           
        }
    }
    ?>
  </table>