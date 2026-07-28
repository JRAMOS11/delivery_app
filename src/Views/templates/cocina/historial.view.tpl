<section class="historial-page">
  <h1>Historial de Pedidos</h1>

  <div>
    <a href="index.php?page=Cocina.Cocina" class="cocina-back">← Volver a pedidos activos</a>
  </div>

  <div class="cocina-table-wrap">
    <table class="cocina-table">
      <thead>
        <tr>
          <th>#</th>
          <th>Plato</th>
          <th>Cliente</th>
          <th>Cantidad</th>
          <th>Estado</th>
          <th>Fecha</th>
        </tr>
      </thead>
      <tbody>
        {{foreach pedidos}}
        <tr>
          <td>{{id}}</td>
          <td>{{platos_nombres}}</td>
          <td>{{cliente_nombre}}</td>
          <td>{{total_items}}</td>
          <td>
            <span class="{{estadoClass}}">{{estadoDsc}}</span>
          </td>
          <td>{{creado_en}}</td>
        </tr>
        {{endfor pedidos}}
      </tbody>
    </table>
  </div>
</section>
