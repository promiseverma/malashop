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
