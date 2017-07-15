'use strict';

(function () {
  var Repo = {
    init: function () {
      this.handleUpdate();
    },

    handleUpdate: function () {
      if (document.querySelector('[data-repo-update-in-progress]') == undefined) {
        return;
      }

      setTimeout(function () {
        Turbolinks.visit(document.location.pathname, { action: 'replace' });
      }, 5000);
    }
  }

  document.addEventListener('turbolinks:load', function() {
    Repo.init();
  });
})();

