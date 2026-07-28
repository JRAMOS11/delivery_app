<?php

namespace Controllers\Tracking;

use Controllers\PrivateController;
use Dao\Tracking\Pedidos as PedidosDAO;
use Dao\Tracking\Platos as PlatosDAO;
use Utilities\Security;
use Utilities\Site;

class CancelarPedido extends PrivateController
{
    public function run(): void
    {
        if (Security::getUserRole() !== 'cliente') {
            Site::redirectTo(
                "index.php?page=Tracking_MisPedidos",
                "Solo los clientes pueden cancelar sus pedidos."
            );
            return;
        }

        if (!$this->isPostBack()) {
            Site::redirectTo("index.php?page=Tracking_MisPedidos");
            return;
        }

        $pedidoId = intval($_POST["pedidoId"] ?? 0);

        $usuarioId = Security::getUserId();
        $pedido = PedidosDAO::getPedidoById($pedidoId, $usuarioId);

        if (!$pedido || $pedido["estado"] !== "pendiente") {
            Site::redirectTo(
                "index.php?page=Tracking_MisPedidos",
                "No se puede cancelar este pedido."
            );
            return;
        }

        PedidosDAO::cancelarPedido($pedidoId, $usuarioId);

        PlatosDAO::aumentarStock(
            $pedido["plato_id"],
            $pedido["cantidad"]
        );

        Site::redirectTo(
            "index.php?page=Tracking_MisPedidos",
            "Pedido cancelado correctamente."
        );
    }
}