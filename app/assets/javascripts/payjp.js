$(document).on('turbolinks:load', ()=> {

  $('#payment_card_submit-button').click(function(e){ 
    e.preventDefault(); 
    Payjp.setPublicKey('pk_test_9f8e819279c2a12de90f9455');
    let card = { 
        number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_card_month").val(),
        exp_year: $("#payment_card_year").val()
    };

    Payjp.createToken(card, function(status, response) {  
      if (status === 200) { 
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name"); 
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        ); 
        document.inputForm.submit();
        alert("登録が完了しました"); 
      } else {
        alert("カード情報が正しくありません。"); 
      }
    });
  });
});