<?php

declare(strict_types=1);
require_once(__DIR__ . '/../templates/basic.tpl.php');

require_once('../database/user.db.php');

$dbh = get_database_connection();

drawMenu('MENU', $dbh);