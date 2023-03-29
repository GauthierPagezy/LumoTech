<div >
  <h2>Historique Manuel</h2>
  <table class="table">
    <thead>
      <tr>
        <th class="text-center">ID Utilisateur</th>
        <th class="text-center">ID Lampadaire</th>
        <th class="text-center">Date</th>
        <th class="text-center">ID Action</th>
      </tr>
    </thead>
    <?php
      include_once "../config/dbconnect.php";
      $sql="SELECT * from historiquemanuel";
      $result=$conn-> query($sql);
      $count=1;
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
           
    ?>
    <tr>
      <td><?=$count?></td>
      <td><?=$row["userID"]?></td>
      <td><?=$row["lampID"]?></td> 
      <td><?=$row["dateTime"]?></td>
      <td><?=$row["actionID"]?></td>
    </tr>
    <?php
            $count=$count+1;
           
        }
    }
    ?>
  </table>