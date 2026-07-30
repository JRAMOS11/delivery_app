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
}
 
