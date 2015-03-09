// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(window).load(function() {
	
	if($('.learnmoment-detail').find('img').length > 0) {
		setMaxWidthOnImage()
	}
	
});


function setMaxWidthOnImage() {
	var el = $('.learnmoment-detail').find('img')
	var elWidth = el.get(0).naturalWidth;
	var elHeight = el.get(0).naturalHeight;
	
	$(el).css({
		maxWidth: elWidth + 'px',
		maxHeight: elHeight + 'px'
	});
	console.log(elWidth, elHeight);
}

