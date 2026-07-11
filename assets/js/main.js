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
      var open = toggle.closest('.site-header').classList.toggle('nav-open');
      toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
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
    // Savings = discount amount / full price, derived from the actual price
    // and hours — NOT the rounded per-minute display rate, which overstated it
    // (e.g. 7h showed 9% from rounded $0.015 vs the true 6%). Floor so a badge
    // never claims more discount than the price actually gives.
    function dollars(card) {
      var el = card.querySelector('.pricing-amount');
      return el ? parseFloat(el.textContent.replace(/[^0-9.]/g, '')) : NaN;
    }
    // Hours come from each card's explicit data-hours attribute, not the
    // translated label — some locales spell the number out (e.g. Arabic
    // "one hour"), so parsing display text would miss it.
    function hoursOf(card) {
      return parseFloat(card.getAttribute('data-hours'));
    }
    var baseRate = dollars(cards[0]) / hoursOf(cards[0]);
    if (baseRate > 0) {
      for (var i = 1; i < cards.length; i++) {
        var price = dollars(cards[i]);
        var hours = hoursOf(cards[i]);
        if (isNaN(price) || isNaN(hours) || hours <= 0) continue;
        var rate = price / hours;
        if (rate >= baseRate) continue;
        var pct = Math.floor((1 - rate / baseRate) * 100);
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
