<?php

declare(strict_types=1);

session_start();

require_once('../database/user.db.php');

$dbh = get_database_connection();

$itemId = filter_input(INPUT_POST, 'item_id', FILTER_SANITIZE_NUMBER_INT);
$rating = filter_input(INPUT_POST, 'rating', FILTER_SANITIZE_NUMBER_INT);

if ($itemId && $rating) {
    $dbh = get_database_connection();

    $stmt = $pdo->prepare('INSERT INTO ratings (item_id, user_id, rating) VALUES (?, ?, ?)');

    $stmt->execute([$itemId, $_SESSION['id'], $rating]);
    //header('Location: /pages/item.php?id=' . $_SESSION['id']);
}
