<?php

declare(strict_types=1);

session_start();

require_once('../database/user.db.php');

$dbh = get_database_connection();


$itemId = filter_input(INPUT_POST, 'item_id', FILTER_SANITIZE_NUMBER_INT);
$rating = filter_input(INPUT_POST, 'rating', FILTER_SANITIZE_NUMBER_INT);

if ($itemId && $rating) {
    $stmt = $dbh->prepare('SELECT COUNT(*) FROM rate WHERE id = ? AND user = ?');
    $stmt->execute([$itemId, $_SESSION['username']]);
    $count = $stmt->fetchColumn();

    if ($count > 0) {
        echo 'You have already rated this item.';
    } else {
        $stmt = $dbh->prepare('INSERT INTO rate (id, user, rate) VALUES (?, ?, ?)');
        $stmt->execute([$itemId, $_SESSION['username'], $rating]);
        echo 'Your rating has been submitted successfully.';
    }
    header('Location: /pages/review.php');
}