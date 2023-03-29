<div >
  <h2>Tous les Utilisateurs</h2>
  <table class="table">
    <thead>
      <tr>
        <th class="text-center">ID Utilisateur</th>
        <th class="text-center">Nom</th>
        <th class="text-center">Prenom</th>
        <th class="text-center">Mail</th>
        <th class="text-center">Password</th>
      </tr>
    </thead>
    <?php
      include_once "../config/dbconnect.php";
      $sql="SELECT * from users";
      $result=$conn-> query($sql);
      $count=1;
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
           
    ?>
    <tr>
      <td><?=$count?></td>
      <td><?=$row["userID"]?></td>
      <td><?=$row["userNom"]?></td> 
      <td><?=$row["userPrenom"]?></td>
      <td><?=$row["userMail"]?></td>
      <td><?=$row["userPassword"]?></td>
    </tr>
    <?php
            $count=$count+1;
           
        }
    }
    ?>
  </table>