#Add code to enable checkboxes 
#$('input.some_class').bind('update', ->
 # $.post('/listings/update', { param1: value, param2: value ... }, (data) ->
  #  alert('updated!')



#Code to initialize the datatable
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
  

