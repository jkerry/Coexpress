$(document).ready(function(){
	$('select#img_select').change(function(){
		console.log("changing url to "+$(this).val());
		$('img#sig_scatterplot').attr('src',$(this).val());
		
	})
	
});