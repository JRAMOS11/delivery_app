<link rel="stylesheet" href="{{BASE_DIR}}public/css/carrito.css">

<section class="cart-page">
    <div class="cart-header">
        <div>
            <h1>Carrito de compras</h1>
            <p>Revisa tus platillos antes de confirmar el pedido.</p>
        </div>
        <a href="index.php?page=Tracking_Menu" class="caps-secondary-link">Volver al menu</a>
    </div>


    {{ifnot hasItems}}
    <div class="empty-state">
        <h2>Tu carrito esta vacio</h2>
        <p>Agrega platillos desde el menu para confirmar todo en un solo pedido.</p>
    </div>
    {{endifnot hasItems}}

    {{if hasItems}}
    <div class="cart-table-wrap">
        <table class="caps-products-table">
            <thead>
                <tr>
                    <th>Plato</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                    <th>Accion</th>
                </tr>
            </thead>
            <tbody>
                {{foreach items}}
                <tr>
                    <td>
                        <strong>{{nombre}}</strong>
                        <span class="cart-desc">{{descripcion}}</span>
                    </td>
                    <td>L. {{precio}}</td>
                    <td>
                        <form method="POST" action="index.php?page=Tracking_Carrito" class="cart-inline-form">
                            <input type="hidden" name="accion" value="actualizar">
                            <input type="hidden" name="platoId" value="{{id}}">
                            <input type="number" name="cantidad" min="0" max="{{stock}}" value="{{cantidad}}">
                            <button type="submit">Actualizar</button>
                        </form>
                    </td>
                    <td>L. {{subtotal}}</td>
                    <td>
                        <form method="POST" action="index.php?page=Tracking_Carrito">
                            <input type="hidden" name="accion" value="quitar">
                            <input type="hidden" name="platoId" value="{{id}}">
                            <button type="submit">Quitar</button>
                        </form>
                    </td>
                </tr>
                {{endfor items}}
            </tbody>
        </table>
    </div>

    <div class="cart-summary">
        <div>
            <span>Total</span>
            <strong>L. {{cartTotal}}</strong>
        </div>
        <form method="POST" action="index.php?page=Tracking_Carrito">
            <input type="hidden" name="accion" value="vaciar">
            <button type="submit" class="caps-secondary-btn">Vaciar</button>
        </form>
        <form method="POST" action="index.php?page=Tracking_Carrito">
            <input type="hidden" name="accion" value="confirmar">
            <button type="submit">Continuar al pago</button>
        </form>
    </div>

    {{if showPayment}}
    <div class="payment-section">
        <h2>Resumen del pedido</h2>
        <div class="payment-summary-list">
            {{foreach items}}
            <div class="payment-summary-item">
                <span>{{cantidad}} × {{nombre}}</span>
                <strong>L. {{subtotal}}</strong>
            </div>
            {{endfor items}}
            <div class="payment-summary-total">
                <span>Total final</span>
                <strong>L. {{cartTotal}}</strong>
            </div>
        </div>

        <h2>Método de pago</h2>
        <div class="payment-methods">
            <label>
                <input type="radio" name="metodo_pago" value="efectivo" checked>
                Efectivo
            </label>
            <label>
                <input type="radio" name="metodo_pago" value="tarjeta">
                Tarjeta
            </label>
        </div>

        <form method="POST" action="index.php?page=Tracking_Carrito" class="payment-form">
            <input type="hidden" name="accion" value="pagar">

            <script>
document.addEventListener('DOMContentLoaded', function () {

    const radios = document.querySelectorAll('input[name="metodo_pago"]');

    const efectivo = document.getElementById('payment-efectivo');
    const tarjeta = document.getElementById('payment-tarjeta');

    function quitarRequired() {

        efectivo.querySelectorAll('input').forEach(function(c){
            c.required = false;
        });

        tarjeta.querySelectorAll('input').forEach(function(c){
            c.required = false;
        });

    }

    function togglePayment() {

        quitarRequired();

        const metodo = document.querySelector('input[name="metodo_pago"]:checked').value;

        if (metodo === 'tarjeta') {

            efectivo.style.display = 'none';
            tarjeta.style.display = 'block';

            tarjeta.querySelectorAll('input').forEach(function(c){
                c.required = true;
            });

        } else {

            efectivo.style.display = 'block';
            tarjeta.style.display = 'none';

            efectivo.querySelectorAll('input').forEach(function(c){
                c.required = true;
            });

        }

    }

    radios.forEach(function(radio){
        radio.addEventListener('change', togglePayment);
    });

    togglePayment();

});
</script>

            <div class="payment-option" id="payment-efectivo" {{ifnot pagoMetodoEfectivo}}style="display:none;"{{endifnot pagoMetodoEfectivo}}>
                <h3>Pago en efectivo</h3>
                <div class="payment-grid">
                    <div>
                        <label>Nombre completo<input type="text" name="nombre"></label>
                        {{if error_nombre}}<div class="form-error-inline">{{error_nombre}}</div>{{endif error_nombre}}
                    </div>
                    <div>
                        <label>Número de teléfono<input type="text" name="telefono"></label>
                        {{if error_telefono}}<div class="form-error-inline">{{error_telefono}}</div>{{endif error_telefono}}
                    </div>
                    <div>
                        <label>Correo<input type="email" name="correo"></label>
                        {{if error_correo}}<div class="form-error-inline">{{error_correo}}</div>{{endif error_correo}}
                    </div>
                    <div>
                        <label>Dirección<input type="text" name="direccion"></label>
                        {{if error_direccion}}<div class="form-error-inline">{{error_direccion}}</div>{{endif error_direccion}}
                    </div>
                    <div>
                        <label>Entrega<input type="text" name="entrega" placeholder="Delivery / Recoger"></label>
                        {{if error_entrega}}<div class="form-error-inline">{{error_entrega}}</div>{{endif error_entrega}}
                    </div>
                </div>
            </div>

            <div class="payment-option" id="payment-tarjeta" {{ifnot pagoMetodoTarjeta}}style="display:none;"{{endifnot pagoMetodoTarjeta}}>
                <h3>Pago con tarjeta</h3>
                <div class="payment-grid">
                    <div>
                        <label>Nombre completo<input type="text" name="nombre_tarjeta"></label>
                        {{if error_nombre_tarjeta}}<div class="form-error-inline">{{error_nombre_tarjeta}}</div>{{endif error_nombre_tarjeta}}
                    </div>
                    <div>
                        <label>Número de tarjeta<input type="text" name="numero_tarjeta"></label>
                        {{if error_numero_tarjeta}}<div class="form-error-inline">{{error_numero_tarjeta}}</div>{{endif error_numero_tarjeta}}
                    </div>
                    <div>
                        <label>CVV<input type="text" name="cvv"></label>
                        {{if error_cvv}}<div class="form-error-inline">{{error_cvv}}</div>{{endif error_cvv}}
                    </div>
                    <div>
                        <label>Fecha de vencimiento<input type="text" name="fecha_vencimiento" placeholder="MM/AA"></label>
                        {{if error_fecha_vencimiento}}<div class="form-error-inline">{{error_fecha_vencimiento}}</div>{{endif error_fecha_vencimiento}}
                    </div>
                    <div>
                        <label>Correo<input type="email" name="correo_tarjeta"></label>
                        {{if error_correo_tarjeta}}<div class="form-error-inline">{{error_correo_tarjeta}}</div>{{endif error_correo_tarjeta}}
                    </div>
                    <div>
                        <label>Lugar de entrega<input type="text" name="direccion_tarjeta"></label>
                        {{if error_direccion_tarjeta}}<div class="form-error-inline">{{error_direccion_tarjeta}}</div>{{endif error_direccion_tarjeta}}
                    </div>
                </div>
            </div>

            <button type="submit">Pagar y confirmar pedido</button>
        </form>
    </div>
    {{endif showPayment}}
    {{endif hasItems}}
</section>