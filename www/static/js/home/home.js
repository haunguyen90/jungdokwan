function changeLange(lang){
  $.ajax({
    type: 'POST',
    url: config.base + '/home/ChangeLang/' + lang,
    data: lang,
    success: function(){
      location.reload();
    }
  });
}
//
//(function () {
//  "use strict";
//  $(document).ready(function(){
//    var hash = window.location.hash;
//    if(hash != ''){
//      hash = hash.substring(1);
//      openPage(hash);
//    }
//  });
//}());