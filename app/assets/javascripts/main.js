$(function(){
  $('.main_contaier_l-side_todo_tab_label_item').on('click',function(){
    var idx=$('.main_contaier_l-side_todo_tab_label_item').index(this);
    $(this).addClass('is-active').siblings('.main_contaier_l-side_todo_tab_label_item').removeClass('is-active');
    $(this).closest('.main_contaier_l-side_todo_tab').next('.main_contaier_l-side_todo_tabcontent').find('.main_contaier_l-side_todo_tabcontent_menu1_messages_body').removeClass('is-show');
    $('.main_contaier_l-side_todo_tabcontent_menu1_messages_body').eq(idx).addClass('is-show');
  });
});