function Item(attributes) {
  this.description = attributes.name;
  this.id = attributes.id;
}

Item.prototype.renderLI = function(){
  
}


$(function() {
  $('form#new_item').on("submit", function(e) {
    e.preventDefault()
    var $form = $(this);
    var action = $form.attr('action');
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      var item = new item(json);

      var itemLi = item.renderLI();

      $('ul.todo-list').append(html)
    })
    .error(function(response){
      console.log('u broke it', response)
    })
  })
})