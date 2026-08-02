<section class="welcome-page">

  {{if isLogged}}

  <div class="welcome-copy">

    <p class="eyebrow">
      Bienvenido
    </p>

    <h1>
      Hola, {{userName}}
    </h1>

    <p>
      Iniciaste sesión como
      <strong>{{userRol}}</strong>.
      Aprovecha las ofertas del día o entra al menú para armar tu carrito.
    </p>

    <a
      href="index.php?page=Tracking_Menu"
      class="welcome-menu-btn"
    >
      Ir al menú
    </a>

  </div>

  <section class="ofertas-seccion">

    <div class="ofertas-titulo">

      <h2>
        Ofertas del día
      </h2>

      <p>
        Promociones especiales disponibles por tiempo limitado.
      </p>

    </div>

    <div class="ofertas-grid">

      <article class="oferta-card">

        <img
          src="{{BASE_DIR}}public/img/platos/pizza.jpg"
          alt="Oferta de pizzas"
          class="oferta-imagen"
        >

        <div class="oferta-contenido">

          <span class="oferta-etiqueta">
            3x2
          </span>

          <h3>
            Compra 2 pizzas y recibe 1 gratis
          </h3>

          <p>
            Pide dos pizzas margarita y recibe una tercera sin costo adicional.
          </p>

          <div class="oferta-precio">
            Promoción especial del día
          </div>

          <a
            href="index.php?page=Tracking_Menu"
            class="oferta-boton"
          >
            Ver promoción
          </a>

        </div>

      </article>

      <article class="oferta-card">

        <img
          src="{{BASE_DIR}}public/img/platos/hamburguesa.jpg"
          alt="Combo de hamburguesa"
          class="oferta-imagen"
        >

        <div class="oferta-contenido">

          <span class="oferta-etiqueta">
            Combo
          </span>

          <h3>
            Hamburguesa con refresco
          </h3>

          <p>
            Disfruta una hamburguesa clásica acompañada de un refresco natural.
          </p>

          <div class="oferta-precio">
            Precio especial
          </div>

          <a
            href="index.php?page=Tracking_Menu"
            class="oferta-boton"
          >
            Ver promoción
          </a>

        </div>

      </article>

      <article class="oferta-card">

        <img
          src="{{BASE_DIR}}public/img/platos/alitas.jpg"
          alt="Oferta de alitas"
          class="oferta-imagen"
        >

        <div class="oferta-contenido">

          <span class="oferta-etiqueta">
            20% descuento
          </span>

          <h3>
            Alitas BBQ en promoción
          </h3>

          <p>
            Ordena unas alitas BBQ y recibe un descuento especial durante el día.
          </p>

          <div class="oferta-precio">
            Antes L. 160.00 — Ahora L. 128.00
          </div>

          <a
            href="index.php?page=Tracking_Menu"
            class="oferta-boton"
          >
            Ver promoción
          </a>

        </div>

      </article>

    </div>

  </section>

  {{endif isLogged}}

  {{ifnot isLogged}}

  <div class="welcome-copy">

    <p class="eyebrow">
      Delivery APP
    </p>

    <h1>
      Bienvenido a {{SITE_TITLE}}
    </h1>

    <p>
      Para ver el menú, aprovechar las ofertas, armar tu carrito y realizar un pedido debes iniciar sesión.
    </p>

    <a
      href="index.php?page=Sec.Login"
      class="welcome-menu-btn"
    >
      Iniciar sesión
    </a>

  </div>

  {{endifnot isLogged}}

</section>