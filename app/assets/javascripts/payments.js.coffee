# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#select: (event,ui) -> alert("Selected: " + ui.item.value + " aka " + ui.item.id)
jQuery ->
  $(document).ready ->
    #$('#payment_start').parent().hide()
    courses = $("#payment_start").html()
    schedule = $("#payment_end").html()
    $('#client_new').autocomplete
      source: $('#client_new').data('autocomplete-source')
      select: (event,ui) ->
        res = ui.item.value
        $.ajax 'search_options',
          type: 'POST'
          dataType: 'script'
          data: "client=#{res}"

#    $('#client_edit').autocomplete
#      source: $('#client_edit').data('autocomplete-source')
#      select: (event,ui) ->
#        res = ui.item.value
#        $.ajax 'search_options',
#          type: 'POST'
#          dataType: 'script'
#          data: "client=#{res}"

    $('#payment_order_id, #schedule_ , #order_number_').keypress ->
      return false