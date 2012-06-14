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
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require_tree .

/*The code bleow is used for rendering the partial that is used by the listings index.html file of the non datatables version*/
$(function() 
{
	$("#listings th a, #listings .pagination a").live("click", function() 
	{
		$.getScript(this.href);
		return false;
	});
	/*Ajaxing the search box */
	$("#listings_search input").keyup(function() 
		{
			$.get($("#listings_search").attr("action"), $("#listings_search").serialize(), null, "script" )
			return false;
		});
	
	
	
});

