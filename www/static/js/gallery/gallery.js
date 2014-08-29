(function() {
  "use strict";
  $(document).ready(function() {
    var hash = window.location.hash;
    if (hash != '') {
      hash = hash.substring(1);
      detailsGallery(hash);
    }
  });
}());

function detailsGallery(hashName) {
  $.ajax({
    type: 'POST',
    url: config.base + '/gallery/details/' + hashName,
    success: function(data) {
      $('#body_content').html(data);
      window.location.hash = hashName;
      initGallery();  
    }
  });
}

function initGallery() {
  $(".fancybox").fancybox({
    openEffect: 'elastic',
    closeEffect: 'elastic',
    nextEffect: 'fade',
    prevEffect: 'fade',
  });
}