//source: http://stackoverflow.com/questions/5623838/rgb-to-hex-and-hex-to-rgb
//User: Tim Down
//http://stackoverflow.com/users/96100/tim-down
function componentToHex(c) {
	var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

//source: http://stackoverflow.com/questions/5623838/rgb-to-hex-and-hex-to-rgb
//User: Tim Down
//http://stackoverflow.com/users/96100/tim-down
function rgbToHex(r, g, b) {
	return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function removeHeatmap() {
	$("td.heatmap").each(function(index){
		$(this).css('background-color','');
		$(this).removeClass('heated');
	});
	$("a#toggle_heatmap").removeClass("btn-success");
	$("a#toggle_heatmap").addClass("btn-info");
	$("a#toggle_heatmap").text("Apply Heatmap");
	$("a#toggle_heatmap").click(addHeatmap);
}

function addHeatmap() {
	$("td.heatmap").each(function(index){
		var text = $(this).text();
		var cor = parseFloat(text.split(" ")[0]);
		var hex;
		if(cor>=0){
			hex = rgbToHex(0,Math.round((255)*cor),0);
		}
		else{
			hex = rgbToHex(Math.round((255)*(-1)*cor),0,0);
		}
					
		$(this).css('background-color',hex);
		$(this).addClass('heated');
	});
	$("a#toggle_heatmap").removeClass("btn-info");
	$("a#toggle_heatmap").addClass("btn-success");
	$("a#toggle_heatmap").text("Remove Heatmap");
	$("a#toggle_heatmap").click(removeHeatmap);
	
}

function removeNonSignificantRows(){
	$("tr.not_significant").css("display","none");
	
	$("a#toggle_signif").click(restoreNonSignificantRows);
	$("a#toggle_signif").removeClass("btn-success");
	$("a#toggle_signif").addClass("btn-info");
	$("a#toggle_signif").text("Show Non-Sig");

}

function restoreNonSignificantRows(){
	$("tr.not_significant").css("display","");
	
	$("a#toggle_signif").click(removeNonSignificantRows);
	$("a#toggle_signif").removeClass("btn-info");
	$("a#toggle_signif").addClass("btn-success");
	$("a#toggle_signif").text("Hide Non-Sig");
}


$(document).ready(function(){
	addHeatmap();
	restoreNonSignificantRows();
});