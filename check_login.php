<?php
$hashes = [
    'cliente@restaurante.com' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'cliente@gmail.com' => '$2y$10$akuaXb/9wLh9jbnFx1t1oePA9d6zTOy8kgrWaODe8LN5/Mk16PQbC',
    'clienteb@gmail.com' => '$2y$10$plLVAzq5RjREgGBQ31cSUuaOlvAxQcbDkKby/N2TbbbdjSy6yGOC6',
    'admin@restaurante.com' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
];

$cands = ['123456','12345678','password','admin123','admin','qwerty','1234','secret','test123','cliente','12345','111111','welcome','restaurante','demo','pass123','123456789','hola123','cliente123'];

foreach ($hashes as $email => $hash) {
    echo $email . ':';
    $matched = false;
    foreach ($cands as $cand) {
        if (password_verify($cand, $hash)) {
            echo ' MATCH=' . $cand;
            $matched = true;
            break;
        }
    }
    if (!$matched) {
        echo ' NO_MATCH';
    }
    echo PHP_EOL;
}
