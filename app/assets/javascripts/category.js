$(document).on('turbolinks:load', ()=> {
  $("#dest").change(function() {
    var select = document.getElementById("dest").value;
    console.log(select);
    $.ajax({
      type: 'GET',
      url: 'get_category_children',
      data: { id: select},
      dataType: 'json'
    })
    .done(function(category_children){
      console.log(category_children)
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML);
    })
  });
});

function appendChidrenBox(insertHTML){
  var childSelectHtml = '';
  childSelectHtml = `<div class='new-main_product-details_category_body_bottom' id= 'children_wrapper'>
                      <div class='new-main_product-details_category_body_bottom_box'>
                        <select id="child_category" name="category_id">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        <select>
                        <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                      </div>
                    </div>`;
  $('.new-main_product-details_category_body').append(childSelectHtml);
}