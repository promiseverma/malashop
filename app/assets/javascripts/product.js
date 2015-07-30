function callExecuter(click){ 
  $('#item-content').append('<br><br><input type="text" name="product[items_attributes]['+click+'][item_name]" id="product_items_attributes_'+click+'_item_name" class="form-control">');
  }
function delExecuter(click){ 
  $('#item-content  div:last').remove();
  }


