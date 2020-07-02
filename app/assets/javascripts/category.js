$(document).on('turbolinks:load', ()=> {
  $("#dest").change(function() {
  var select = document.getElementById("dest2");
  var option = document.createElement("option");
  option.text = "child";
  option.value = "child";
  select.appendChild(option);


    console.log("select");

  });
});