<section class="cocina-page">
  <h1>Panel de Cocina</h1>

  {{if error}}
  <div class="admin-alert">
    ⚠ Conflicto de concurrencia: este pedido fue modificado por otro operador. Los datos han sido actualizados.
  </div>
  {{endif error}}

  <div class="cocina-table-wrap">
    <table class="cocina-table">
      <thead>
        <tr>
          <th>#</th>
          <th>Plato</th>
          <th>Cliente</th>
          <th>Cantidad</th>
          <th>Estado</th>
          <th>Acción</th>
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
            <span class="estado-badge">{{estado}}</span>
          </td>
          <td>
            <form method="POST" action="index.php?page=Cocina.ActualizarEstado">
              <input type="hidden" name="id" value="{{id}}">
              <input type="hidden" name="version" value="{{version}}">
              <input type="hidden" name="estado" value="{{estado}}">
              <button type="submit">{{accion_estado_texto}}</button>
            </form>
          </td>
        </tr>
        {{endfor pedidos}}
      </tbody>
    </table>
  </div>
</section>
