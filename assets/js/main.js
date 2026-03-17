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

  // Pricing save badge
  var saveFmt = {
    en: function (p) { return 'Save ' + p + '%'; },
    tr: function (p) { return '%' + p + ' tasarruf'; },
    de: function (p) { return p + '% sparen'; },
    fr: function (p) { return p + "% d\u2019\u00e9conomie"; },
    es: function (p) { return 'Ahorra ' + p + '%'; },
    pt: function (p) { return p + '% desconto'; },
    ar: function (p) { return '\u0648\u0641\u0631 ' + p + '%'; },
    zh: function (p) { return '\u7701 ' + p + '%'; },
    ja: function (p) { return p + '%\u304a\u5f97'; },
    ko: function (p) { return p + '% \uc808\uc57d'; }
  };
  var cards = document.querySelectorAll('.pricing-card');
  if (cards.length >= 2) {
    var lang = document.documentElement.lang || 'en';
    var fmt = saveFmt[lang] || saveFmt.en;
    function parseRate(card) {
      var el = card.querySelector('.pricing-rate');
      return el ? parseFloat(el.textContent.replace(/[^0-9.]/g, '')) : NaN;
    }
    var base = parseRate(cards[0]);
    if (base) {
      for (var i = 1; i < cards.length; i++) {
        var rate = parseRate(cards[i]);
        if (isNaN(rate) || rate >= base) continue;
        var pct = Math.round((1 - rate / base) * 100);
        if (pct > 0) {
          var badge = document.createElement('div');
          badge.className = 'pricing-save';
          badge.textContent = fmt(pct);
          cards[i].appendChild(badge);
        }
      }
    }
  }
});
