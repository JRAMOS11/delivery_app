<?php

namespace Controllers\Tracking;

use Controllers\PrivateController;
use Dao\Tracking\Pedidos as PedidosDAO;
use Views\Renderer;

class Factura extends PrivateController
{
    public function run(): void
    {
        $this->requireAuth(true);

        if (!isset($_GET["id"])) {
            die("Pedido no encontrado.");
        }

        $pedidoId = intval($_GET["id"]);

        $detalle = PedidosDAO::obtenerDetalleFactura($pedidoId);

        if (empty($detalle)) {
            die("No existe información para esta factura.");
        }

        $totalGeneral = 0;

        foreach ($detalle as $producto) {
            $totalGeneral += (float)$producto["total"];
        }

        Renderer::render(
            "factura",
            [
                "numero"       => $pedidoId,
                "fecha"        => $detalle[0]["creado_en"],
                "detalle"      => $detalle,
                "totalGeneral" => number_format($totalGeneral, 2)
            ]
        );
    }
}