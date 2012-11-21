# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#select: (event,ui) -> alert("Selected: " + ui.item.value + " aka " + ui.item.id)
jQuery ->
  $(document).ready ->
    #$('#payment_start').parent().hide()
    courses = $("#payment_start").html()
    schedule = $("#payment_end").html()
    $('#client').autocomplete
      source: $('#client').data('autocomplete-source')
      select: (event,ui) ->
        res = ui.item.value
        $.ajax 'new',
          type: 'POST'
          dataType: 'script'
          data: "client=#{res}"
          #error: (jqXHR, textStatus, errorThrown) ->
          #  $('body').append "AJAX Error: #{textStatus}"
          #success: (data, textStatus, jqXHR) ->
          #  $('body').append "Successful AJAX call: #{data}"
    $('#payment_order_id, #schedule_').keypress ->
      return false







# if options_t
#   $('#payment_order').html(options_t)
#   $('#payment_order').parent().show()
# else
#   $('#payment_order').empty()
#   $('#payment_order').parent().hide()




#options_t = $(courses).filter("optgroup[label='#{res}']").html()
#if options_t
#  $('#payment_start').html(options_t)
#  $('#payment_start').parent().show()
#else
#  $('#payment_start').empty()
#  $('#payment_start').parent().hide()