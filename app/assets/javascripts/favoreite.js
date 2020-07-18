$(document).on('turbolinks:load', ()=> {

  $('#favorite').click(function(){
    if ($(this).hasClass('favorite_off')){
      var itemId = $(this).attr('item_id');
      $.ajax({
        type: 'POST',
        url: '/items/' + itemId + '/favorites/',
        dataType: 'json'
      })
      .done(function(data){
        var count = Number($('.count').html());
        count += 1
        $('.count').html(count);
        $('#favorite').attr('favorite_id', data.id);
        $('#favorite').removeClass('favorite_off');
        $('#favorite').addClass('favorite_on');
        $('.fa-star').removeClass('far');
        $('.fa-star').addClass('fa');
      });

    }else{
      var itemId = $(this).attr('item_id');
      var favoriteId = $(this).attr('favorite_id');
      $.ajax({
        type: 'POST',
        url: '/items/' + itemId + '/favorites/' + favoriteId,
        data: {_method: "DELETE"}
      });
      var count = Number($('.count').html());
      count -= 1
      $('.count').html(count)
      $(this).removeClass('favorite_on')
      $(this).addClass('favorite_off')
      $('.fa-star').removeClass('fa')
      $('.fa-star').addClass('far')
    };
  });
  
});