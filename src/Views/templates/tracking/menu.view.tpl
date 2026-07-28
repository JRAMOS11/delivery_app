<section class="menu-cliente">

    <div class="menu-encabezado">

        <div class="menu-titulo">

            <h1>Menú del Restaurante</h1>

            <p>
                Selecciona tus comidas favoritas y agrégalas al carrito.
            </p>

        </div>

        <div class="menu-opciones">

            <a
                href="index.php?page=Tracking_MisPedidos"
                class="menu-enlace enlace-pedidos"
            >
                Mis pedidos
            </a>

            <a
                href="index.php?page=Tracking_Carrito"
                class="menu-enlace enlace-carrito"
            >
                Carrito ({{cartCount}})
            </a>

        </div>

    </div>

    <div class="menu-datos-generales" aria-label="Datos generales del menu">
        <div class="dato-general">
            <strong>{{totalPlatos}}</strong>
            <span>opciones en el menu</span>
        </div>
        <div class="dato-general">
            <strong>{{platosDisponibles}}</strong>
            <span>con stock disponible</span>
        </div>
        <div class="dato-general">
            <strong>{{cartCount}}</strong>
            <span>articulos en tu carrito</span>
        </div>
    </div>

    <div class="productos-grid">

        {{foreach platos}}

        <article class="producto-card">

            <div class="producto-imagen-contenedor">

                <img
                    src="{{~BASE_DIR}}public/img/{{imagen}}"
                    alt="{{nombre}}"
                    class="producto-imagen"
                >

            </div>

            <div class="producto-contenido">

                <div class="producto-estado">
                    {{if platoDisponible}}
                    <span class="producto-stock stock-disponible">{{stock}} disponibles</span>
                    {{endif platoDisponible}}
                    {{ifnot platoDisponible}}
                    <span class="producto-stock stock-agotado">Agotado</span>
                    {{endifnot platoDisponible}}
                </div>

                <h2 class="producto-nombre">
                    {{nombre}}
                </h2>

                <p class="producto-descripcion">
                    {{descripcion}}
                </p>

                <div class="producto-precio">
                    L. {{precio}}
                </div>

                {{if platoDisponible}}

                <form
                    action="index.php?page=Tracking_Carrito"
                    method="POST"
                    class="producto-form"
                >

                    <input
                        type="hidden"
                        name="accion"
                        value="agregar"
                    >

                    <input
                        type="hidden"
                        name="platoId"
                        value="{{id}}"
                    >

                    <div class="cantidad-grupo">

                        <label for="cantidad-{{id}}">
                            Cantidad:
                        </label>

                        <input
                            id="cantidad-{{id}}"
                            class="cantidad-input"
                            type="number"
                            name="cantidad"
                            min="1"
                            max="{{stock}}"
                            value="1"
                            required
                        >

                    </div>

                    <button
                        type="submit"
                        class="btn-agregar"
                    >
                        Agregar al carrito
                    </button>

                </form>

                {{endif platoDisponible}}

                {{ifnot platoDisponible}}

                <button
                    type="button"
                    class="btn-agotado"
                    disabled
                >
                    Producto agotado
                </button>

                {{endifnot platoDisponible}}

            </div>

        </article>

        {{endfor platos}}

    </div>

</section>
