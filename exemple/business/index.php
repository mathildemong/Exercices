<?php
$uri = $_SERVER['REQUEST_URI'];
echo $uri;
echo '<br>';
$uri = substr($uri, strlen('/phpoo/exemple/business/'), strlen($uri));
echo $uri;
