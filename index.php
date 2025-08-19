<?php
include 'db.php';
$result = $db->query("SELECT * FROM messages ORDER BY id DESC");
?>
<!DOCTYPE html>
<html>
<head><title>Guestbook</title></head>
<body>
<h2>Guestbook</h2>
<form action="insert.php" method="post">
  Name: <input type="text" name="name"><br>
  Message: <input type="text" name="message"><br>
  <input type="submit" value="Add">
</form>
<hr>
<?php foreach($result as $row): ?>
  <p><b><?= htmlspecialchars($row['name']) ?>:</b> <?= htmlspecialchars($row['message']) ?></p>
<?php endforeach; ?>
</body>
</html>
