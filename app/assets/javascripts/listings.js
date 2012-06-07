//#CoffeeScript:
/*
#Add code to enable checkboxes 
#$('input.some_class').bind('update', ->
 # $.post('/listings/update', { param1: value, param2: value ... }, (data) ->
  #  alert('updated!')
  
#Code to initialize the datatable
/*
jQuery -> $('#listings').dataTable 
  sPaginationType: "full_numbers" #adds pagination
  bJQueryUI: true 
  bSortClasses: false #This is set as false to improve performance when loading
  sScrollX: "90%" #This option allows horizintal scrolling
  bScrollCollapse: true #This option allows horizintal scrolling
  sDom: '<"top"iflp<"clear">>rt<"bottom"iflp<"clear">>' #This option is so that the previous and next show up on top
  #Followig code only for datatable JSON
  bProcessing: true
  bServerSide: true
  sAjaxSource: $('#listings').data('source')
  

#jQuery -> $('#listings').dataTable-> $('table#listings td').bind('mouseenter', function () { $(this).parent().children().each(function(){$(this).addClass('datatablerowhighlight');}); });$('table#listings td').bind('mouseleave', function () { $(this).parent().children().each(function(){$(this).removeClass('datatablerowhighlight');}); });
#}
#} );
*/
//=============================================================================
//#JQuery

//Initialize the datatable
$(document).ready(function()
{
  var oTable = $('#listings').dataTable(
  {
    "sPaginationType":  "full_numbers",
    "bJQueryUI": true,
    "bSortClasses": false,
    "sScrollX": "90%",
    "bScrollCollapse": true,
    "sDom":  '<"top"iflp<"clear">>rt<"bottom"iflp<"clear">>',
    "bProcessing": true,
    "bServerSide": true,
    "sAjaxSource": $('#listings').data('source')
  });
  /*
  $('td', oTable.fnGetNodes()).hover(function() 
  	{
		var iCol = $('td').index(this) % 5;
		var nTrs = oTable.fnGetNodes();
		$('td:nth-child('+(iCol+1)+')', nTrs).addClass( 'highlighted' );
	}, 
	function() 
	{
		$('td.highlighted', oTable.fnGetNodes()).removeClass('highlighted');
	} );
	*/
	
   
});

//=============================================================================
//Add the row highlight function
/*
$('#listings').dataTable(
	{
		"fnDrawCallback": function()
			{
      			$('#listings td').bind('mouseenter', function ()
      				{ 
      					$(this).parent().children().each(function()
      					{
      						$(this).addClass('datatablerowhighlight');
      					});
      				});
      
      			$('#listings td').bind('mouseleave', function ()
      				{ 
      					$(this).parent().children().each(function()
      					{ 
      						$(this).removeClass('datatablerowhighlight');
      					}); 
      				});
			}
	});
*/

