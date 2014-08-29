function openPage(hashName){
  hashName = hashName.split('/');
  $.ajax({
    type: 'POST',
    url: config.base + '/home/openPage',
    dataType: 'JSON',
    data: {hashName: hashName},
    success: function(data){
      $('#body_content').html(data.content);
      $('#slide_show').html(data.slide_show);
      window.location.hash = hashName.join('/');
    }
  });
}