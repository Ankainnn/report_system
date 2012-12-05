# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#jQuery ->
#  $('#salary_course_id').parent().hide()
#  courses = $("#salary_course_id").html()
#  schedule = $("#salary_schedule_id").html()
#  $('#salary_teacher_id').change ->
#    teacher = $('#salary_teacher_id :selected').text()
#    options_t = $(courses).filter("optgroup[label='#{teacher}']").html()
#    if options_t
#      $('#salary_course_id').html(options_t)
#      $('#salary_course_id').parent().show()
#      selected_c = $('#salary_course_id :selected').text()
#      options = $(schedule).filter("optgroup[label='#{selected_c}']").html()
#      if options
#        $('#salary_schedule_id').html(options)
#        $('#salary_schedule_id').parent().show()
#    else
#      $('#salary_course_id').empty()
#      $('#salary_schedule_id').empty()       #Добавил
#      $('#salary_course_id').parent().hide()
#      $('#salary_schedule_id').parent().hide()
#
#  $('#salary_schedule_id').parent().hide()
#  schedule = $("#salary_schedule_id").html()
#  $('#salary_course_id').change ->
#    course = $('#salary_course_id :selected').text()
#    options_c = $(schedule).filter("optgroup[label='#{course}']").html()
#    if options_c
#      $('#salary_schedule_id').html(options_c)
#      $('#salary_schedule_id').parent().show()
#    else
#      $('#salary_schedule_id').empty()
#      $('#salary_schedule_id').parent().hide()

#jQuery ->
#  $('#course_').live 'change', (event) ->
#    jQuery ->
#      schedule = $('#schedule_course_id').html()
#      course =  $('#course_ :selected').text()
#      options = $(schedule).filter("optgroup[label='#{course}']").html()
#      if options
#        $('#schedule_course_id').html(options)
#        $('#hide_schedule').show()
#      else
#       # $('#schedule_course_id').empty()
#        $('#hide_schedule').hide()

