<?php

declare(strict_types=1);

session_start();

require_once('../database/user.db.php');

require_once(__DIR__ . '/../database/item.class.php');

$dbh = get_database_connection();

//n ha no main
add_sold($dbh, $_SESSION['username']);

remove_all_items_checkout($dbh, $_SESSION['username']);

header('Location: /pages/index.php');