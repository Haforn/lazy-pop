// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(window).load(function() {

	if($('body').find('.js-user-image').length > 0) {
		scaleImage();
	}

});

function scaleImage() {
	$('.js-user-image').find('img').each(function () {
		var widthImg = $(this).width();
		var heightImg = $(this).height();
 		if (widthImg < heightImg) {
			$(this).width('100px');
 		} else {
 			$(this).height('100px');
 		}

	}); 

}