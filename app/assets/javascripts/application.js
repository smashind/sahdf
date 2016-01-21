// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require pnotify/pnotify.core
//= require_tree .

$(document).on("page:load", function () {
	$(".ui-pnotify").hide();
});

/* Ensures modal windows appear on top */
$(function($) {
  var checkeventcount = 1,prevTarget;
  $('.modal').on('show.bs.modal', function (e) {
    if(typeof prevTarget == 'undefined' || (checkeventcount==1 && e.target!=prevTarget))
    {
      prevTarget = e.target;
      checkeventcount++;
      e.preventDefault();
      $(e.target).appendTo('body').modal('show');
    }
      else if(e.target==prevTarget && checkeventcount==2)
    {
      checkeventcount--;
    }
  });
});

/* Keeps the navbar from bouncing around on submit */
$(document).on("page:change", function () {
	$('#navbar_post').bind('hidden.bs.modal', function () {
	  $("html").css("margin-right", "0px");
	});
	$('#navbar_post').bind('show.bs.modal', function () {
	  $("html").css("margin-right", "-16px");
	});
});