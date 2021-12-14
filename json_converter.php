<?php

$connect = pg_connect("host=localhost port=5432 dbname=postgres user=postgres");

$filename = "piva.json";

$data = file_get_contents($filename);

$array = json_decode($data, true);

foreach ($array as $row) {
    $sql = "INSERT INTO piva(name, tagline, first_brewed, description, abv) VALUES ('".$row["name"]."', '".$row["tagline"]."', '".$row["first_brewed"]."', '".$row["description"]."', '".$row["abv"]."')";
    pg_query($connect, $sql);
}

?>