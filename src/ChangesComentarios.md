Guion de cambios — qué se hizo, cómo se hizo y en qué archivo está

Resumen general:
Se implementaron mejoras para convertir la aplicación de pedidos en una experiencia con carrito de compras, mejor flujo de cocina, administración de platos, mejoras visuales y correcciones en la carga de assets. A continuación se listan por archivo comentarios concisos que explican qué se cambió, cómo se implementó y dónde buscar el código.

- src/Controllers/Tracking/Carrito.php:
  - Qué: Controlador del carrito que gestiona agregar, actualizar, quitar items, vaciar y confirmar pedido.
  - Cómo: Usa `$_SESSION['carrito']` para almacenar temporalmente los productos; expone acciones `agregar`, `actualizar`, `quitar`, `vaciar`, `confirmar`.
  - Dónde: Lógica de negocio del carrito; redirige a DAO para persistir cuando se confirma.

- src/Views/templates/tracking/carrito.view.tpl:
  - Qué: Vista del carrito de compras.
  - Cómo: Muestra tabla con producto, cantidad, precio, subtotal y total. Botones para actualizar cantidades, quitar, vaciar y confirmar.
  - Dónde: Interfaz cliente para revisar y confirmar el pedido.

- src/Dao/Tracking/Pedidos.php:
  - Qué: Nuevo método `insertPedidoConItems()` para crear un pedido con múltiples platos.
  - Cómo: Inserta en `pedidos` y luego inserta cada fila en `pedido_platos`; valida stock antes de guardar cada item.
  - Dónde: Acceso a base de datos para persistir pedidos compuestos.

- src/Controllers/Tracking/Menu.php:
  - Qué: Lectura del estado del carrito para mostrar cantidad de items en el menú.
  - Cómo: Lee `$_SESSION['carrito']`, calcula total de productos y pasa el dato a la vista.
  - Dónde: Integración menú ←→ carrito para mejorar la experiencia del usuario.

- src/Views/templates/tracking/menu.view.tpl:
  - Qué: Vista del menú con botón `Agregar al carrito` en lugar de `Realizar Pedido`.
  - Cómo: El botón envía al controlador `Tracking_Carrito` con acción `agregar` y los datos del plato.
  - Dónde: Punto de entrada para agregar productos al carrito.

- src/Controllers/Index.php:
  - Qué: Mejora de pantalla de bienvenida añadiendo un carrusel de platos destacados.
  - Cómo: Se agregó el arreglo `carouselImages` con imágenes, títulos y descripciones; se pasa a la vista.
  - Dónde: Controlador de la página de inicio.

- src/Views/templates/index.view.tpl:
  - Qué: Vista que renderiza el carrusel y botón `Ir al menú`.
  - Cómo: Usa `carouselImages` para mostrar slides; el botón apunta a `index.php?page=Tracking_Menu`.
  - Dónde: Interfaz inicial más atractiva para usuarios.

- nav.config.json:
  - Qué: Se añadió opción `Carrito` visible solo para clientes.
  - Cómo: Nueva entrada en la configuración de navegación con control por roles.
  - Dónde: Menú lateral/global de la aplicación.

- public/css/style.css:
  - Qué: Estilos añadidos para carrito, bienvenida (carrusel), botones, filtros y seguimiento.
  - Cómo: Nuevas reglas CSS para integrar visualmente las nuevas vistas.
  - Dónde: Archivo principal de estilos para que las pantallas no se vean como texto plano.

- src/Controllers/Tracking/MisPedidos.php:
  - Qué: Mejora para listar pedidos con filtro por estado y preparación de pasos de seguimiento.
  - Cómo: Valida el estado recibido por URL, prepara etiquetas y construye los pasos (`Pendiente`, `En proceso`, `Listo`, `Entregado`).
  - Dónde: Lógica de consulta y preparación para la vista `mispedidos`.

- src/Views/templates/tracking/mispedidos.view.tpl:
  - Qué: Vista mejorada para `Mis Pedidos` con filtro, mensaje cuando no hay resultados y columna de seguimiento visual.
  - Cómo: Selector de filtros, render condicional para lista vacía y barra de progreso/etapas para cada pedido.
  - Dónde: Interfaz de cliente para revisar el estado y avance de pedidos.

- src/Controllers/Admin/GestionPlatos.php:
  - Qué: Acciones nuevas para crear y editar platos desde el panel admin.
  - Cómo: Recibe datos del formulario, valida entradas (nombre, precio, stock) y delega en el DAO.
  - Dónde: Controlador administrativo para gestionar el menú.

- src/Dao/AdminDao.php:
  - Qué: Nuevos métodos `crearPlato()` y `actualizarPlato()`.
  - Cómo: Ejecutan los `INSERT` y `UPDATE` correspondientes en la tabla `platos`.
  - Dónde: Operaciones de persistencia para administración de platos.

- src/Views/templates/admin/platos.view.tpl:
  - Qué: Interfaz para crear y editar platos (formulario de creación y tabla editable).
  - Cómo: Formulario con campos nombre, descripción, precio, stock y disponibilidad; tabla para editar en línea.
  - Dónde: Panel de administración de platos.

- src/Views/templates/admin/admin.view.tpl:
  - Qué: Panel principal del admin con accesos rápidos a gestión de platos y pedidos.
  - Cómo: Añadidos botones/enlaces directos a `GestionPlatos`, confirmar y avanzar pedidos.
  - Dónde: Dashboard administrativo.

- src/Controllers/Cocina/Cocina.php:
  - Qué: Validación de rol (solo cocina/administrador) y texto dinámico para botón según estado del pedido.
  - Cómo: Revisa rol del usuario y calcula etiqueta del botón (`Marcar listo`, `Marcar entregado`, etc.).
  - Dónde: Controlador de pantalla de cocina.

- src/Views/templates/cocina/cocina.view.tpl:
  - Qué: Botón con texto contextual para avanzar estado del pedido.
  - Cómo: Renderiza la etiqueta calculada por el controlador.
  - Dónde: Vista de trabajo para personal de cocina.

- src/Controllers/Cocina/ActualizarEstado.php:
  - Qué: Validaciones reforzadas (rol, ID, versión, estado) y avance seguro del flujo: pendiente -> en_proceso -> listo -> entregado.
  - Cómo: Comprueba permisos y coherencia antes de actualizar el estado en la base.
  - Dónde: Acción que actualiza el estado de los pedidos desde cocina.

- src/Controllers/Sec/Logout.php:
  - Qué: Cierre de sesión completo.
  - Cómo: Limpia `$_SESSION`, destruye la sesión y redirige al inicio.
  - Dónde: Módulo de seguridad para logout seguro.

- src/Views/templates/layout.view.tpl y src/Views/templates/privatelayout.view.tpl:
  - Qué: Corrección en las rutas de CSS/JS para asegurar carga correcta de assets.
  - Cómo: Ajuste de referencias a `global.css`, `style.css` y otros recursos estáticos.
  - Dónde: Layouts globales que envuelven todas las vistas.

- parameters.env:
  - Qué: Corrección de `BASE_DIR` para apuntar a la ruta base del proyecto.
  - Cómo: `BASE_DIR=/SEMINARIO-TALLER-DE-SOFTWARE/` para que las rutas relativas funcionen desde el navegador.
  - Dónde: Archivo de configuración de parámetros de entorno.

Notas finales:
Estos comentarios resumen las modificaciones realizadas. Si deseas que añada comentarios inline (cabeceras/docblocks) directamente dentro de los archivos fuente listados, puedo hacerlo ahora: prefieres que inserte comentarios en cada archivo (p. ej. encabezado PHP con "Qué/Cómo/Dónde") o que deje sólo este archivo resumen en `src/ChangesComentarios.md`?