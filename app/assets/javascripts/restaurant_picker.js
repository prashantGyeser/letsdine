$(document).ready(function(){
	$('.menuItems').hide();

	$('.restaurantDetailsCotaniner').click(function(){
		$('.menuItems').hide();		
		$('div').removeClass('selectedRestaurant');
		var clickedItemId = this.id;
		$('#event_restaurant_id').val(this.id);
		$(this).addClass("selectedRestaurant");
		//.restaurant1menu
		menuToShow = "#restaurant" + clickedItemId + "menu";
		$(menuToShow).show('fast');
		
	});
});