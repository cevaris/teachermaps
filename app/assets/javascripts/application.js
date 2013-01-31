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
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(document).ready(function () { 
	$('.dropdown-toggle').dropdown(); 
});	

jQuery(function($) {
  // create a convenient toggleLoading function
   var closeCreateResourceModal = function() { 
    $('#uploadResourceModal').modal('hide');
    console.log("Closing Upload Resource modal");
  };

  $("#create_resource_form")
    // .bind("ajax:loading",  closeCreateResourceModal)
    .bind("ajax:complete", closeCreateResourceModal)
    .bind("ajax:success", function(event, data, status, xhr) {
        console.log("Closing Loading modal");
        $("#resources_table").html(data);      
    });
});