<?php

class Database {
    public static $host;
    public static $username;
    public static $password;
    public static $dbName;

    public static function connect() {
        $conn = mysqli_connect(self::$host, self::$username, self::$password, self::$dbName);
        return $conn;
    }

    public static function query_temp($query, $params = array(), $paramType) {
        $stmt = mysqli_prepare(self::connect(), $query);
        // Not correct, will be fixed in the next iteration.
        mysqli_stmt_bind_param($stmt, $paramType, $params);
        mysqli_stmt_execute($stmt);

        if (explode(' ', $query)[0] == "SELECT") {
            /*
            Use mysqli_fetch_array($result, MYSQLI_ASSOC) to
            fetch results as an associative array.
            */
            $result = mysqli_stmt_get_result($stmt);
            return $result;
        }
    }
}

?>