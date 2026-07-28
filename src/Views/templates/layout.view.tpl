<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="stylesheet" href="{{BASE_DIR}}public/css/global.css">
  <link rel="stylesheet" href="{{BASE_DIR}}public/css/style.css">
  <script src="{{BASE_DIR}}public/js/navigation.js" defer></script>
</head>
<body>
  <header>
    <input type="checkbox" class="menu_toggle" id="menu_toggle" />
    <label for="menu_toggle" class="menu_toggle_icon" aria-label="Abrir menu" aria-expanded="false" role="button" tabindex="0">
      <div class="hmb dgn pt-1"></div>
      <div class="hmb hrz"></div>
      <div class="hmb dgn pt-2"></div>
    </label>
    <a class="site-logo" href="index.php?page=Index" aria-label="Delivery APP, ir al inicio">
      <img src="{{BASE_DIR}}public/img/logo.png" alt="">
      <span class="site-logo-name">Delivery APP</span>
    </a>
    <nav id="menu">
      <ul>
        {{foreach PUBLIC_NAVIGATION}}
          <li><a href="{{nav_url}}">{{nav_label}}</a></li>
        {{endfor PUBLIC_NAVIGATION}}
      </ul>
    </nav>
    <a href="index.php?page=Sec.Login" class="btn-login-header">Iniciar sesión</a>
  </header>

  <main>
    {{{page_content}}}
  </main>

  <footer class="main-footer">
    <div class="footer-content">
      <div>
        <p class="footer-kicker">Delivery APP</p>
        <h2>Tu pedido, más fácil.</h2>
        <p>Explora el menú, arma tu carrito y disfruta tus platos favoritos de forma sencilla.</p>
      </div>
      <div class="footer-info">
        <h3>En cada pedido</h3>
        <p>Opciones para todos los gustos</p>
        <p>Proceso simple y rápido</p>
        <p>Estado de tu pedido</p>
      </div>
      <div class="footer-links">
        <h3>Explora</h3>
        <a href="index.php?page=Index">Inicio</a>
      </div>
    </div>
    <p class="footer-bottom">&copy; {{CURRENT_YEAR}} {{SITE_TITLE}}. Todos los derechos reservados.</p>
  </footer>

{{if flash_msg}}
<script>
  alert("{{flash_msg}}");
</script>
{{endif flash_msg}}
</body>
</html>
