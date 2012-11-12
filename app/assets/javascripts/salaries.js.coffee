# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#salary_course_id").hide()
  $('#course_label').hide()
  courses = $("#salary_course_id").html()
  $("#salary_teacher_id").change ->
    teacher = $("#salary_teacher_id :selected").text()
    options_course = $(courses).filter("optgroup[label='#{teacher}']").html()
    if options_course
      $('#salary_course_id').html(options_course)
      $('#salary_course_id').show()
      $('#course_label').show()
    else
      $('#salary_course_id').empty()
      $('#salary_course_id').hide()
      $('#course_label').hide()
      $('#salary_schedule_id').hide()
      $('#schedule_label').hide()

  $("#salary_schedule_id").hide()
  $('#schedule_label').hide()
  schedules = $("#salary_schedule_id").html()
  $("#salary_course_id").change ->
    course = $("#salary_course_id :selected").text()
    options_schedule = $(schedules).filter("optgroup[label='#{course}']").html()
    if options_schedule
      $('#salary_schedule_id').html(options_schedule)
      $('#salary_schedule_id').show()
      $('#schedule_label').show()
    else
      $('#salary_schedule_id').empty()
      $('#salary_schedule_id').hide()
      $('#schedule_label').hide()




