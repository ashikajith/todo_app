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
//= require jquery.ui.all
//= require twitter/bootstrap
//= require_tree .

// $(document).ready(function(){
// 	$('#list').hover(function(){
// 		$('#link_hidden').show();
// 	}, function(){
// 		$('#link_hidden').hide();
// 	});
// });

$(document).ready(function(){
	  $('#item_lists').sortable({
	    dropOnEmpty: false,
	    cursor: 'crosshair',
	    opacity: 0.4,
	    scroll: true,
	    update: function(){
	    $.ajax({
	      type: 'post',
	      data: $('#item_lists').sortable('serialize'),
	      url: '/todos/sort',
	      dataType: 'script',
	      complete: function(request){
	        $('#item_lists').effect('highlight');
	      },
	    })
	  }
  });
});