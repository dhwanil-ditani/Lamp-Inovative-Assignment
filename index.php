<?php

function autoloader($class) {
    if (file_exists("./classes/" . $class . ".php"))
        require_once "./classes/$class.php";
    else if (file_exists("./controllers/$class.php"))
        require_once "./controllers/$class.php";
}

spl_autoload_register('autoloader');

require_once("routes.php");

?>