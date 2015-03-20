// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

	// On click show our hide learn moments
	showOurHideLearnMoments()

})

function showOurHideLearnMoments() {
	$('.js-show').on('click', function(e) {
		e.preventDefault();
		var learnMoment = $(this).parent().find('.learn-moments');
		
		$(learnMoment).toggleClass('show');
		$(this).toggleClass('active');
		if ($(this).hasClass('active')) {
			$(this).text('Hide learn moments')
		} else {
			$(this).text('Show learn moments')
		}
	});
}