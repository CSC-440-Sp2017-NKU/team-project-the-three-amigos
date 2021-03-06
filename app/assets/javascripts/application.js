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
//= require jquery.easing
//= require jquery_ujs
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require select2

$(document).on('turbolinks:load', function() {
    $(".select2").select2();
});

$('#customize-controls').on('click' , function() { 
 $('select[data-customize-setting-link]').select2("close"); 
} );

$('.vote')
  .on('ajax:send', function () { $(this).addClass('loading'); })
  .on('ajax:complete', function () { $(this).removeClass('loading'); })
  .on('ajax:error', function () { $(this).after('<div class="error">There was an issue.</div>'); })
  .on('ajax:success', function (data) { $(this).html(data.count); });