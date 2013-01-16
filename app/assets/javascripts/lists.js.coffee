$(document).ready ->
  $('.sortable').sortable
    axis: 'y'
    cursor: 'crosshair'
    items: '> li'
    update: (event, ui) ->
      # Display the update button
      # Update the order via ajax
      console.log(event, ui)
      console.log($(event.target).sortable('serialize'))
      $.ajax
        type: 'post'
        data: $(event.target).sortable('serialize')
        dataType: 'script'
        complete: (request) ->
          $(event.target).effect('highlight')
        url: '/lists/1/items/sort'
