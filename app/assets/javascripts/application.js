// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require autocomplete-rails
//= require_tree .


$(document).ready(function() {

	// Initialise Plugin
	/*var options = {
		additionalFilterTriggers: [$('#quickfind')]
	};*/

	$('#demotable').tableFilter();
    $('#demotable').tablesorter();


    jQuery(function($){
   $("#date").mask("99/99/9999");
   $.mask.definitions['#']='[0123456789.]';
   $("#order_discount").mask("#?#####");
   $(".tel").mask("(999) 999-9999");
   $("#ssn").mask("999-99-9999");

        $( "#order_client" ).autocomplete({
            source: $('#order_client').data('autocomplete-source')
        });

    });

});

