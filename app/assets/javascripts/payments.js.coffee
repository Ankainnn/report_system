# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#select: (event,ui) -> alert("Selected: " + ui.item.value + " aka " + ui.item.id)
jQuery ->
  $(document).ready ->
    $('#payment_start').parent().hide()
    courses = $("#payment_start").html()
    schedule = $("#payment_end").html()
    $('#client').autocomplete
      source: $('#client').data('autocomplete-source')
      select: (event,ui) ->
        res = ui.item.value
        options_t = $(courses).filter("optgroup[label='#{res}']").html()
        if options_t
          $('#payment_start').html(options_t)
          $('#payment_start').parent().show()
        else
          $('#payment_start').empty()
          $('#payment_start').parent().hide()






# if options_t
#   $('#payment_order').html(options_t)
#   $('#payment_order').parent().show()
# else
#   $('#payment_order').empty()
#   $('#payment_order').parent().hide()