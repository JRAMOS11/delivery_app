<section class="welcome-page">

  {{if isLogged}}
  <div class="welcome-copy">
    <p class="eyebrow">Bienvenido</p>
    <h1>Hola, {{userName}}</h1>
    <p>
      Iniciaste sesion como <strong>{{userRol}}</strong>. Explora los platillos destacados o entra directo al menu para armar tu carrito.
    </p>
    <a href="index.php?page=Tracking_Menu" class="welcome-menu-btn">Ir al menu</a>
  </div>

  <div class="dish-carousel" aria-label="Platillos destacados">
    {{foreach carouselImages}}
    <article class="dish-slide">
      <img src="{{image_url}}" alt="{{image_title}}">
      <div class="dish-caption">
        <h2>{{image_title}}</h2>
        <p>{{image_desc}}</p>
      </div>
    </article>
    {{endfor carouselImages}}
  </div>
  {{endif isLogged}}

  {{ifnot isLogged}}
  <div class="welcome-copy">
    <p class="eyebrow">Delivery APP</p>
    <h1>Bienvenido a {{SITE_TITLE}}</h1>
    <p>Para ver el menu, armar tu carrito y realizar un pedido debes iniciar sesion.</p>
    <a href="index.php?page=Sec.Login" class="welcome-menu-btn">Iniciar Sesion</a>
  </div>
  {{endifnot isLogged}}

</section>
