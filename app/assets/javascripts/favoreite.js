$(document).on('turbolinks:load', ()=> {
  $('#favoriteOff').click(function(){
    let itemId = $(this).attr('item_id');
    $.ajax({
      type: 'POST',
      url: '/items/' + itemId + '/favorites/',
    });
    count = Number($('.count').html());
    count += 1
    $('.count').html(count)
    $(this).attr('id', 'favoriteOn')
    $('.fa-star').removeClass('far')
    $('.fa-star').addClass('fa')
  });
  
  $('#favoriteOn').click(function(){
    let itemId = $(this).attr('item_id');
    let favoriteId = $(this).attr('favorite_id');
    $.ajax({
      type: 'POST',
      url: '/items/' + itemId + '/favorites/' + favoriteId,
      data: {_method: "DELETE"}
    });
    count = Number($('.count').html());
    count -= 1
    $('.count').html(count)
    $(this).attr('id', 'favoriteOff')
    $('.fa-star').removeClass('fa')
    $('.fa-star').addClass('far')
  });
});