<?php

namespace Dao\Tracking;

use Dao\Table;

class Platos extends Table
{
    public static function getAll()
    {
        $sqlstr = "
            SELECT
                id,
                nombre,
                descripcion,
                precio,
                stock,
                disponible
            FROM platos
            WHERE disponible = 1
            ORDER BY nombre;
        ";

        return self::agregarImagenes(
            self::obtenerRegistros(
            $sqlstr,
            []
            )
        );
    }

    public static function getById(int $id)
    {
        $sqlstr = "
            SELECT
                id,
                nombre,
                descripcion,
                precio,
                stock,
                disponible
            FROM platos
            WHERE id = :id;
        ";

        $plato = self::obtenerUnRegistro(
            $sqlstr,
            [
                'id' => $id
            ]
        );

        if (is_array($plato)) {
            $plato['imagen'] = self::obtenerImagen($plato['nombre']);
        }

        return $plato;
    }

    private static function agregarImagenes(array $platos): array
    {
        foreach ($platos as &$plato) {
            $plato['imagen'] = self::obtenerImagen($plato['nombre']);
        }
        unset($plato);

        return $platos;
    }

    private static function obtenerImagen(string $nombre): string
    {
        $nombreNormalizado = strtolower($nombre);
        $imagenes = [
            'pizza' => 'platos/pizza.jpg',
            'hamburguesa' => 'platos/hamburguesa.jpg',
            'ensalada' => 'platos/ensalada.jpg',
            'limonada' => 'platos/limonada.jpg',
            'baleada' => 'platos/baleada.jpg',
            'alita' => 'platos/alitas.jpg',
            'pastel' => 'platos/pastel.jpg',
            'refresco' => 'platos/refresco.jpg',
            'taco' => 'platos/tacos.jpg',
            'pollo' => 'platos/pollo.jpg',
        ];

        foreach ($imagenes as $palabra => $ruta) {
            if (str_contains($nombreNormalizado, $palabra)) {
                return $ruta;
            }
        }

        return 'platos/pizza.jpg';
    }

    public static function reducirStock(
        int $id,
        int $cantidad
    ) {
        $conn = self::getConn();

        $stmt = $conn->prepare("
            UPDATE platos
            SET stock = stock - :cantidad
            WHERE id = :id
            AND stock >= :cantidad2;
        ");

        $stmt->bindParam(
            ':id',
            $id,
            \PDO::PARAM_INT
        );

        $stmt->bindParam(
            ':cantidad',
            $cantidad,
            \PDO::PARAM_INT
        );

        $stmt->bindParam(
            ':cantidad2',
            $cantidad,
            \PDO::PARAM_INT
        );

        return $stmt->execute();
    }

    public static function aumentarStock(
        int $id,
        int $cantidad
    ) {
        $sqlstr = "
            UPDATE platos
            SET stock = stock + :cantidad
            WHERE id = :id;
        ";

        return self::executeNonQuery(
            $sqlstr,
            [
                'id' => $id,
                'cantidad' => $cantidad
            ]
        );
    }
}