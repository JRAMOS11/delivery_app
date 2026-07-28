document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.menu_toggle_icon').forEach(function (toggle) {
    var checkbox = document.getElementById(toggle.getAttribute('for'));
    if (!checkbox) return;

    toggle.addEventListener('click', function () {
      window.setTimeout(function () {
        toggle.setAttribute('aria-expanded', checkbox.checked ? 'true' : 'false');
      }, 0);
    });

    toggle.closest('header').querySelectorAll('nav a').forEach(function (link) {
      link.addEventListener('click', function () {
        checkbox.checked = false;
        toggle.setAttribute('aria-expanded', 'false');
      });
    });
  });
});
