function callExecuter(click){ 
  $('#item-content').append('<input type="text" name="product[items_attributes]['+click+'][item_name]" id="product_items_attributes_'+click+'_item_name" class="form-control">');
  }
function delExecuter(){ 
  $('#item-content input:last').remove();
  }


  $(document).ready(function() {
    jQuery('a.gallery').colorbox({ 
      closeButton: true,
      opacity: 1.9,
      });
  });

function calculate_price(unit, price, index, elem, piece_count) {
  switch(unit) {
    case "Pcs":
        if ($("#unit_"+index).val() == "Pcs") {
          $("#cal_"+index+" .cal_price").val($("#quantity_"+index).val()*price);
        }
        else if($("#unit_"+index).val() == "Dozen"){
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)*12);
        }
        else if($("#unit_"+index).val() == "Gross"){
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)*144);
        }
        break;
    case "Dozen":
        if ($("#unit_"+index).val() == "Pcs") {
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)/12);
        }
        else if($("#unit_"+index).val() == "Dozen"){
          $("#cal_"+index+" .cal_price").val($("#quantity_"+index).val()*price);
        }
        else if($("#unit_"+index).val() == "Gross"){
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)*12);
        }
        break;
    case "Gross":
        if ($("#unit_"+index).val() == "Pcs") {
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)/144);
        }
        else if($("#unit_"+index).val() == "Dozen"){
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)/12);
        }
        else if($("#unit_"+index).val() == "Gross"){
          $("#cal_"+index+" .cal_price").val($("#quantity_"+index).val()*price);
        }
        break;
    case "Kilogram":
        if ($("#unit_"+index).val() == "Kilogram") {
          $("#cal_"+index+" .cal_price").val($("#quantity_"+index).val()*price);
        }
        else if($("#unit_"+index).val() == "Gram"){
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)/1000);
        }
        break;
    case "Gram":
        if ($("#unit_"+index).val() == "Kilogram") {
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)*1000);
        }
        else if($("#unit_"+index).val() == "Gram"){
          $("#cal_"+index+" .cal_price").val($("#quantity_"+index).val()*price);
        }
        break;
    case "Line":
        if ($("#unit_"+index).val() == "Pcs") {
          $("#cal_"+index+" .cal_price").val(($("#quantity_"+index).val()*price)/parseInt(piece_count));
        }
        else if($("#unit_"+index).val() == "Line"){
          $("#cal_"+index+" .cal_price").val($("#quantity_"+index).val()*price);
        }
        break;
    default:
        alert("Invalid Entry.");
  }
}

function get_total() {
  var total = 0;
  $.each($( "td[id^='cal_'] .cal_price" ), function( index, value ) {
    total += parseFloat($("#"+value.id).val());
  });
  total = (total/$("#product_piece").val())*12;
  total += parseFloat($("#product_majdoori").val());
  $("#product_total_price").val(total);
}