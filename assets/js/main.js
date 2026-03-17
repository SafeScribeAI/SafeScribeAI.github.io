document.addEventListener('DOMContentLoaded', function () {
  // Close open lang-switcher dropdowns on outside click
  document.addEventListener('click', function (e) {
    document.querySelectorAll('.lang-switcher[open]').forEach(function (d) {
      if (!d.contains(e.target)) d.removeAttribute('open');
    });
  });

  // Mobile nav toggle
  var toggle = document.getElementById('nav-mobile-toggle');
  if (toggle) {
    toggle.addEventListener('click', function () {
      toggle.closest('.site-header').classList.toggle('nav-open');
    });
  }
});
