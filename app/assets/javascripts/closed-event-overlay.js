$(document).ready(function(){
    $('.closed').each(function(index){
        // Waiting for the images to load. Otherwise the height and width will be zero
        var currentClosedDiv = $(this);
        $(this).prev('img').load(function(){
            var image = $(this);       
            var width = image.width();
            var height = image.height();
            width = width - 20;
            height = height - 20;
            currentClosedDiv.width(width).height(height);
        });
    });
});