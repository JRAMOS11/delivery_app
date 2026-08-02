<?php
 
namespace Controllers\Tracking;
 
use Controllers\PrivateController;
use Dao\Tracking\Platos as PlatosDAO;
use Views\Renderer;
 
class Menu extends PrivateController
{
    private array $platos = [];
 
    public function run(): void
    {
        $this->requireAuth(true);
 
        $this->platos = PlatosDAO::getAll();
 
        foreach ($this->platos as &$plato) {
            $plato["platoDisponible"] = ($plato["stock"] > 0);
            $plato["imagen"] = $this->resolvePlatoImagen($plato);
        }
        unset($plato);
        //Mejorar el tiempo de sesiones por si un usuario esta inactivo, lo mismo con otras sesiones
        //Prueba de multiples usuarios en una misma sesion
        $carrito = $_SESSION['carrito'] ?? [];
        $cartCount = array_sum(array_map('intval', $carrito));
 
        Renderer::render(
            "tracking/menu",
            [
                "platos" => $this->platos,
                "totalPlatos" => count($this->platos),
                "platosDisponibles" => count(array_filter($this->platos, static fn(array $plato): bool => $plato["stock"] > 0)),
                "cartCount" => $cartCount,
                "hasCart" => $cartCount > 0,
            ]
        );
    }

    private function resolvePlatoImagen(array $plato): string
    {
        $basePath = __DIR__ . '/../../../public/img/platos/';
        $nombre = $this->normalizeString($plato['nombre'] ?? '');

        if (!empty($plato['imagen'])) {
            $imagen = trim($plato['imagen']);
            if (strpos($imagen, 'public/') !== 0) {
                $imagen = "public/{$imagen}";
            }
            return $imagen;
        }

        $aliasMap = [
            'pizza margarita' => 'pizza.jpg',
            'hamburguesa clasica' => 'hamburguesa.jpg',
            'ensalada cesar' => 'ensalada.jpg',
            'limonada' => 'limonada.jpg',
            'pasta' => 'pastel.jpg',
            'alitas bbq' => 'alitas.jpg',
            'baleada especial' => 'baleada.jpg',
            'boneless' => 'boneles.jpg',
            'refresco natural' => 'refresco.jpg',
            'pastel de chocolate' => 'pastel.jpg',
            'refresco' => 'refresco.jpg',
            'tacos' => 'tacos.jpg',
            'pollo' => 'pollo.jpg',
        ];

        if (isset($aliasMap[$nombre])) {
            return 'public/img/platos/' . $aliasMap[$nombre];
        }

        $files = glob($basePath . '*.{jpg,jpeg,png,webp}', GLOB_BRACE) ?: [];

        foreach ($files as $filePath) {
            $fileName = strtolower(basename($filePath));
            if (strpos($fileName, $nombre) !== false) {
                return 'public/img/platos/' . basename($filePath);
            }
        }

        $words = preg_split('/[^a-z0-9]+/', $nombre, -1, PREG_SPLIT_NO_EMPTY);
        foreach ($words as $word) {
            foreach ($files as $filePath) {
                $fileName = strtolower(basename($filePath));
                if ($word !== '' && strpos($fileName, $word) !== false) {
                    return 'public/img/platos/' . basename($filePath);
                }
            }
        }

        return 'public/img/logo.png';
    }

    private function normalizeString(string $value): string
    {
        $normalized = iconv('UTF-8', 'ASCII//TRANSLIT', $value);
        if ($normalized === false) {
            $normalized = $value;
        }
        $normalized = strtolower($normalized);
        $normalized = trim(preg_replace('/[^a-z0-9]+/', ' ', $normalized));
        return trim($normalized);
    }
}
 
