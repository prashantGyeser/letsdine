$(document).ready(function(){
	$('#private_event_description').hide();
	$('#public_event_description').hide();

	$('#private_event_radio').click(function (){
		$('#public_event_description').hide();		
		$('#private_event_description').show();
	});

	$('#public_event_radio').click(function (){
		$('#private_event_description').hide();
		$('#public_event_description').show();		
	});
});