$(document).on('turbolinks:load', ()=> {
  $("#dest").change(function() {
    $('#children_wrapper').remove();
    $('#grandchildren_wrapper').remove();
    if ($("#dest option:selected").text() == "選択して下さい"){

    }else {
      var select = document.getElementById("dest").value;
      $.ajax({
        type: 'GET',
        url: 'get_category_children',
        data: { category_id: select},
        dataType: 'json'
      })
      .done(function(category_children){
        childSelectHtml = `<div class='new-main_product-details_category_body_bottom' id= 'children_wrapper'>
                            <div class='new-main_product-details_category_body_bottom_box'>
                              <select id="child_category" >
                                <option value="---" data-category="---">選択して下さい</option>
                              <select>
                            </div>
                          </div>`;
        $('.new-main_product-details_category_body').append(childSelectHtml);
        for(var i=0;i<category_children.length;i++){
          let op = document.createElement("option");
          op.value = category_children[i].id;  //value値
          op.text = category_children[i].category_name;   //テキスト値
          document.getElementById("child_category").appendChild(op);
        }
      })
    }
  });

  $(".new-main_product-details_category_body").on('change', "#child_category", function() {
    $('#grandchildren_wrapper').remove();
    if ($("#dest option:selected").text() == "選択して下さい"){
      
    }else {
      var childId = document.getElementById("child_category").value;
      $.ajax({
        type: 'GET',
        url: 'get_category_children',
        data: { category_id: childId},
        dataType: 'json'
      })
      .done(function(category_children){
        var formId = $('form').attr('id');
        childSelectHtml = `<div class='new-main_product-details_category_body_bottom' id= 'grandchildren_wrapper'>
                            <div class='new-main_product-details_category_body_bottom_box'>
                              <select form= ${formId}; id="grandchild_category" name="category_id">
                                <option value="---" data-category="---">選択して下さい</option>
                              <select>
                            </div>
                          </div>`;
        $('.new-main_product-details_category_body').append(childSelectHtml);
        for(var i=0;i<category_children.length;i++){
          let op = document.createElement("option");
          op.value = category_children[i].id;  //value値
          op.text = category_children[i].category_name;   //テキスト値
          document.getElementById("grandchild_category").appendChild(op);
        }
      })
    }
  });
});