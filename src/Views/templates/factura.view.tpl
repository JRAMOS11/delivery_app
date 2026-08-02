<div class="container mt-5">

    <div class="card shadow">

        <div class="card-body">

            <h2 class="text-center">
                DELIVERY APP
            </h2>

            <h4 class="text-center">
                FACTURA
            </h4>

            <hr>

            <p><strong>Factura #:</strong> {{numero}}</p>
            <p><strong>Fecha:</strong> {{fecha}}</p>

            <table class="table table-bordered">

                <thead>

                    <tr>

                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Total</th>

                    </tr>

                </thead>

                <tbody>

                    {{foreach detalle}}

                    <tr>

                        <td>{{producto}}</td>
                        <td>{{cantidad}}</td>
                        <td>L. {{precio}}</td>
                        <td>L. {{total}}</td>

                    </tr>

                    {{endfor detalle}}

                </tbody>

            </table>

            <hr>

            <div class="text-end">

                <h3>Total: L. {{totalGeneral}}</h3>

            </div>

            <div class="text-center mt-4">

                <button
                    class="btn btn-success"
                    onclick="window.print();">

                    Imprimir Factura

                </button>

            </div>

        </div>

    </div>

</div>