// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

// Tooltip init
var is_touch_device = ("ontouchstart" in window) || window.DocumentTouch && document instanceof DocumentTouch;

var tooltips = function () {
  if (is_touch_device) {
    $('[data-toggle="tooltip"]').popover(
      { placement : 'auto', container: 'body' }
    );
  } else {
    $('[data-toggle="tooltip"]').tooltip(
      { placement : 'auto', container: 'body' }
    );
  }
};

$(document).ready(tooltips);
$(document).on('turbolinks:load', tooltips);

$(function() {
  $(document).on('click', '.btn-add-candidate', function(e) {
    e.preventDefault();
    var controlForm = $('#candidate-labeled'),
        currentEntry = $(this).parents('.candidate-entry:first'),
        newEntry = $(currentEntry.clone()).appendTo(controlForm);

    newEntry.find('input').val('');
    controlForm.find('.candidate-entry:not(:last) .btn-add-candidate')
        .removeClass('btn-add-candidate').addClass('btn-remove-candidate')
        .removeClass('btn-success').addClass('btn-danger')
        .html('<span class="glyphicon glyphicon-minus"></span>');
  }).on('click', '.btn-remove-candidate', function(e) {
    $(this).parents('.candidate-entry:first').remove();
    e.preventDefault();
    return false;
  });

  $(document).on('change', 'input[type=radio][name=candidate-label-radio]', function(e) {
    // first: hide all the divs
    $('#candidate-labeled').css("display","none");
    $('#candidate-unlabeled').css("display","none");
    //
    // // then get the div ID to show (i stored it in the "value" of the radio button
    var fieldToShow = $(this).val();
    console.log(fieldToShow);
    // // now use jQuery selector and change the display setting of that field
    $("#" + fieldToShow).css("display","");
  });
});
