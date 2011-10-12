$(function(){
  $("#accordion").accordion({
      change: function(event, ui) {
      $('.ui-accordion-content').css('height','');
      $( ".selector" ).accordion( "option", "active", 2 ); 
    }
    }); 
    if($('#notice').length>0){    
    $('#notice').fadeOut(4000)
  }else{
    $('#notice').hide();
  }
});