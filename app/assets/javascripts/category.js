$(document).on('turbolinks:load', ()=> {
  $("#dest").change(function() {
    var select = document.getElementById("dest").value;
    $.ajax({
      type: 'GET',
      url: 'get_category_children',
      data: { id: select},
      dataType: 'json'
    })
    .done(function(category_children){
      console.log(category_children)
      childSelectHtml = `<div class='new-main_product-details_category_body_bottom' id= 'children_wrapper'>
                          <div class='new-main_product-details_category_body_bottom_box'>
                            <select id="child_category" name="category_id">
                      
                            <select>
                          </div>
                        </div>`;
                    console.log(childSelectHtml)
      $('.new-main_product-details_category_body').append(childSelectHtml);

      for(var i=0;i<category_children.length;i++){
        let op = document.createElement("option");
        op.value = category_children[i].id;  //value値
        console.log(i)
        op.text = category_children[i].category_name;   //テキスト値
        document.getElementById("child_category").appendChild(op);
        console.log(op)
      }
    })
  });
});