<?php
$db = new PDO('sqlite:/var/www/html/guestbook.db');
$db->exec("CREATE TABLE IF NOT EXISTS messages (id INTEGER PRIMARY KEY, name TEXT, message TEXT)");
?>
