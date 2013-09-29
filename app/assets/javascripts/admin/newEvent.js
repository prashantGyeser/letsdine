$(document).ready(function(){
	var panelspeed = 500; //panel animate speed in milliseconds
	var totalpanels = 3; //total number of collapsible panels   
	var defaultopenpanel = 0; //leave 0 for no panel open  

	// Hiding all the successHeaders. These will be shown only after the step is completed
	$('.successHeader').hide();

	// Hiding all the content panels
	$('.expandable-panel-content').hide();

	// Showing only the first panel on page load
	$('#cp-1 .expandable-panel-content').show().animate("fast");

	// Opening the next panel once one is done. 
	// Todo: Need to validate the data entered before moving to the next panel
	$('.nextStep').click(function(event){
		event.preventDefault();
		var selectedDiv = $(this).parent().parent().parent().parent().attr('id');
		var selectedDivValue = selectedDiv.slice(-1);
		var nextDiv = parseInt(selectedDivValue) + 1;

		if (nextDiv > 4) 
		{

		} 
		else
		{	
			var currentDiv = '#'+selectedDiv;
			$(currentDiv).find('.initialHeader').hide();
			$(currentDiv).find('.successHeader').show();

			var divToOpen = "#cp-" + nextDiv + " .expandable-panel-content"; 

			// Hiding all the other panels
			$('.expandable-panel-content').hide();

			// Showing the next div

			$(divToOpen).show().animate("fast");						
		};

	});

	// Opening a filled out panel when modify is clicked
	$('.successHeader a').click(function(e){
		e.preventDefault();

		// Hiding all the other panels
		$('.expandable-panel-content').hide();
		var divToReopen = $(this).parent().parent().parent().parent().attr('id');
		var divToOpen = "#" + divToReopen + ' .expandable-panel-content';
		//var divToOpen = "#cp-" + nextDiv + " .expandable-panel-content"; 
		$(divToOpen).show();
	});

});