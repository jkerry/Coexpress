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
	$("a.heatmap_btn").removeClass("btn-success");
	$("a.heatmap_btn").addClass("btn-info");
	$("a.heatmap_btn").text("Apply Heatmap");
	$("a.heatmap_btn").click(addHeatmap);
}

function addHeatmap() {
	$("td.heatmap").each(function(index){
		var text = $(this).text();
		var cor = parseFloat(text.split(" ")[0]);
		var hex;
		if(cor>=0){
			hex = rgbToHex(Math.round((255)*cor),0,0);
		}
		else{
			hex = rgbToHex(0,Math.round((255)*(-1)*cor),0);
		}
					
		$(this).css('background-color',hex);
		$(this).addClass('heated');
	});
	$("a.heatmap_btn").removeClass("btn-info");
	$("a.heatmap_btn").addClass("btn-success");
	$("a.heatmap_btn").text("Remove Heatmap");
	$("a.heatmap_btn").click(removeHeatmap);
	
}
$(document).ready(function(){
	addHeatmap();
});