<?php

namespace Controllers\Tracking;

use Controllers\PrivateController;
use Dao\Tracking\Pedidos as PedidosDAO;
use Dao\Tracking\Platos as PlatosDAO;
use Utilities\Security;
use Utilities\Site;
use Views\Renderer;

class Carrito extends PrivateController
{
    public function run(): void
    {
        $this->requireAuth(true);

        if ($this->isPostBack()) {
            $this->handlePost();
            return;
        }

        $this->renderCart();
    }

    private function handlePost(): void
    {
        $accion = $_POST['accion'] ?? '';

        if ($accion === 'agregar') {
            $this->agregar();
            return;
        }

        if ($accion === 'actualizar') {
            $this->actualizar();
            return;
        }

        if ($accion === 'quitar') {
            $this->quitar();
            return;
        }

        if ($accion === 'vaciar') {
            $_SESSION['carrito'] = [];
            Site::redirectTo('index.php?page=Tracking_Carrito', 'Carrito vaciado.');
            return;
        }

        if ($accion === 'confirmar') {
            $this->confirmar();
            return;
        }

        if ($accion === 'pagar') {
            $this->procesarPago();
            return;
        }

        Site::redirectTo('index.php?page=Tracking_Carrito');
    }

    private function agregar(): void
    {
        $platoId = (int)($_POST['platoId'] ?? 0);
        $cantidad = (int)($_POST['cantidad'] ?? 0);

        if ($platoId <= 0 || $cantidad <= 0) {
            Site::redirectTo('index.php?page=Tracking_Menu', 'Selecciona un plato y cantidad valida.');
            return;
        }

        $plato = PlatosDAO::getById($platoId);
        if (!$plato || (int)$plato['disponible'] !== 1 || (int)$plato['stock'] <= 0) {
            Site::redirectTo('index.php?page=Tracking_Menu', 'El plato no esta disponible.');
            return;
        }

        $carrito = $_SESSION['carrito'] ?? [];
        $cantidadActual = (int)($carrito[$platoId] ?? 0);
        $nuevaCantidad = min((int)$plato['stock'], $cantidadActual + $cantidad);
        $carrito[$platoId] = $nuevaCantidad;
        $_SESSION['carrito'] = $carrito;

        Site::redirectTo('index.php?page=Tracking_Menu', 'Plato agregado al carrito.');
    }

    private function actualizar(): void
    {
        $platoId = (int)($_POST['platoId'] ?? 0);
        $cantidad = (int)($_POST['cantidad'] ?? 0);
        $carrito = $_SESSION['carrito'] ?? [];

        if ($platoId > 0) {
            if ($cantidad <= 0) {
                unset($carrito[$platoId]);
            } else {
                $plato = PlatosDAO::getById($platoId);
                if ($plato) {
                    $carrito[$platoId] = min((int)$plato['stock'], $cantidad);
                }
            }
        }

        $_SESSION['carrito'] = $carrito;
        Site::redirectTo('index.php?page=Tracking_Carrito', 'Carrito actualizado.');
    }

    private function quitar(): void
    {
        $platoId = (int)($_POST['platoId'] ?? 0);
        $carrito = $_SESSION['carrito'] ?? [];
        unset($carrito[$platoId]);
        $_SESSION['carrito'] = $carrito;
        Site::redirectTo('index.php?page=Tracking_Carrito', 'Plato quitado del carrito.');
    }

    private function confirmar(): void
    {
        $usuarioId = Security::getUserId();
        $carrito = $_SESSION['carrito'] ?? [];

        if ($usuarioId <= 0 || count($carrito) === 0) {
            Site::redirectTo('index.php?page=Tracking_Carrito', 'Tu carrito esta vacio.');
            return;
        }

        unset($_SESSION['pago_errores']);
        unset($_SESSION['pago_metodo']);
        $this->renderCart(true);
    }

    private function procesarPago(): void
    {
        $usuarioId = Security::getUserId();
        $carrito = $_SESSION['carrito'] ?? [];

        if ($usuarioId <= 0 || count($carrito) === 0) {
            Site::redirectTo('index.php?page=Tracking_Carrito', 'Tu carrito esta vacio.');
            return;
        }

        $metodo = trim($_POST['metodo_pago'] ?? '');
        if ($metodo !== 'efectivo' && $metodo !== 'tarjeta') {
            $metodo = 'efectivo';
        }

       


        unset($_SESSION['pago_errores']);
        $_SESSION['pago_metodo'] = $metodo;

        $pedidoId = PedidosDAO::insertPedidoConItems($usuarioId, $carrito);
        if (!$pedidoId) {
            Site::redirectTo('index.php?page=Tracking_Carrito', 'No se pudo confirmar. Revisa el stock disponible.');
            return;
        }

        unset($_SESSION['pago_errores']);
        unset($_SESSION['pago_metodo']);
        $_SESSION['carrito'] = [];
        $_SESSION['ultimo_pedido'] = [
            'id' => $pedidoId,
            'metodo' => $metodo,
        ];

        Site::redirectTo('index.php?page=Tracking_MisPedidos', 'Pago procesado correctamente. El pedido ha sido confirmado y agregado a tus pedidos.');
    }

    private function renderCart(bool $showPayment = false): void
    {
        $carrito = $_SESSION['carrito'] ?? [];
        $items = [];
        $total = 0;

        foreach ($carrito as $platoId => $cantidad) {
            $plato = PlatosDAO::getById((int)$platoId);
            if (!$plato) {
                continue;
            }

            $cantidad = min((int)$cantidad, (int)$plato['stock']);
            $subtotal = $cantidad * (float)$plato['precio'];
            $total += $subtotal;

            $items[] = [
                'id' => $plato['id'],
                'nombre' => $plato['nombre'],
                'descripcion' => $plato['descripcion'],
                'precio' => number_format((float)$plato['precio'], 2),
                'stock' => $plato['stock'],
                'cantidad' => $cantidad,
                'subtotal' => number_format($subtotal, 2),
            ];
        }

        $pagoErrores = $_SESSION['pago_errores'] ?? [];
        $pagoMetodo = $_SESSION['pago_metodo'] ?? '';

        Renderer::render('tracking/carrito', [
            'items' => $items,
            'hasItems' => count($items) > 0,
            'cartTotal' => number_format($total, 2),
            'showPayment' => $showPayment,
            'pagoErrores' => $pagoErrores,
            'pagoMetodo' => $pagoMetodo,
            'pagoMetodoTarjeta' => $pagoMetodo === 'tarjeta',
            'pagoMetodoEfectivo' => $pagoMetodo !== 'tarjeta',
            'error_nombre' => $pagoErrores['nombre'] ?? '',
            'error_telefono' => $pagoErrores['telefono'] ?? '',
            'error_correo' => $pagoErrores['correo'] ?? '',
            'error_direccion' => $pagoErrores['direccion'] ?? '',
            'error_entrega' => $pagoErrores['entrega'] ?? '',
            'error_nombre_tarjeta' => $pagoErrores['nombre_tarjeta'] ?? '',
            'error_numero_tarjeta' => $pagoErrores['numero_tarjeta'] ?? '',
            'error_cvv' => $pagoErrores['cvv'] ?? '',
            'error_fecha_vencimiento' => $pagoErrores['fecha_vencimiento'] ?? '',
            'error_correo_tarjeta' => $pagoErrores['correo_tarjeta'] ?? '',
            'error_direccion_tarjeta' => $pagoErrores['direccion_tarjeta'] ?? '',
        ]);
    }
}
