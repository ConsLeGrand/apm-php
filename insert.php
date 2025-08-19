<?php
include 'db.php';
$name = $_POST['name'];
$message = $_POST['message'];
$stmt = $db->prepare("INSERT INTO messages (name, message) VALUES (?, ?)");
$stmt->execute([$name, $message]);
header("Location: index.php");
