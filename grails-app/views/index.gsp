
<%@ page import="coexpress.Transcript" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${ grailsApplication.metadata['app.name'] }</title>
		<!-- css resources -->
		
		<style type="text/css">
		div#infovis{
			height:800px;
		}
		</style>
	</head>
	<body onload="init()">
		<div class="row">
			<div id="infovis" class="span12" ></div>
		</div>
		<!-- javascript resources -->
		<g:javascript src="jit.js"/>
		<script type="text/javascript">
		$(document).ready(function(){
		var json= [{"id":"module_30","name":"skyblue1","data":{"$color":"#87CEFF","$type":"circle","$dim":5},"adjacencies":["module_84"]},{"id":"module_58","name":"bisque4","data":{"$color":"#8B7D6B","$type":"circle","$dim":5},"adjacencies":["module_30"]},{"id":"module_79","name":"maroon","data":{"$color":"#B03060","$type":"circle","$dim":5},"adjacencies":["module_58"]},{"id":"module_78","name":"darkorange2","data":{"$color":"#EE7600","$type":"circle","$dim":5},"adjacencies":["module_79"]},{"id":"module_77","name":"plum2","data":{"$color":"#EEAEEE","$type":"circle","$dim":5},"adjacencies":["module_78"]},{"id":"module_62","name":"steelblue","data":{"$color":"#4682B4","$type":"circle","$dim":5},"adjacencies":["module_77"]},{"id":"module_83","name":"lightcyan","data":{"$color":"#E0FFFF","$type":"circle","$dim":5},"adjacencies":["module_62"]},{"id":"module_8","name":"yellow4","data":{"$color":"#8B8B00","$type":"circle","$dim":5},"adjacencies":["module_83"]},{"id":"module_38","name":"navajowhite2","data":{"$color":"#EECFA1","$type":"circle","$dim":5},"adjacencies":["module_8"]},{"id":"module_46","name":"skyblue","data":{"$color":"#87CEEB","$type":"circle","$dim":5},"adjacencies":["module_38"]},{"id":"module_43","name":"mediumpurple2","data":{"$color":"#9F79EE","$type":"circle","$dim":5},"adjacencies":["module_46"]},{"id":"module_4","name":"navajowhite1","data":{"$color":"#FFDEAD","$type":"circle","$dim":5},"adjacencies":["module_43"]},{"id":"module_36","name":"honeydew1","data":{"$color":"#F0FFF0","$type":"circle","$dim":5},"adjacencies":["module_4"]},{"id":"module_44","name":"midnightblue","data":{"$color":"#191970","$type":"circle","$dim":5},"adjacencies":["module_36"]},{"id":"module_81","name":"plum3","data":{"$color":"#CD96CD","$type":"circle","$dim":5},"adjacencies":["module_44"]},{"id":"module_1","name":"Null","data":{"$color":"#808080","$type":"circle","$dim":5},"adjacencies":["module_81"]},{"id":"module_23","name":"lightsteelblue1","data":{"$color":"#CAE1FF","$type":"circle","$dim":5},"adjacencies":["module_1"]},{"id":"module_9","name":"lavenderblush3","data":{"$color":"#CDC1C5","$type":"circle","$dim":5},"adjacencies":["module_23"]},{"id":"module_29","name":"magenta","data":{"$color":"#FF00FF","$type":"circle","$dim":5},"adjacencies":["module_9"]},{"id":"module_42","name":"lightpink4","data":{"$color":"#8B5F65","$type":"circle","$dim":5},"adjacencies":["module_29"]},{"id":"module_41","name":"purple","data":{"$color":"#A020F0","$type":"circle","$dim":5},"adjacencies":["module_42"]},{"id":"module_48","name":"mediumpurple3","data":{"$color":"#8968CD","$type":"circle","$dim":5},"adjacencies":["module_41"]},{"id":"module_63","name":"orangered4","data":{"$color":"#8B2500","$type":"circle","$dim":5},"adjacencies":["module_48"]},{"id":"module_71","name":"floralwhite","data":{"$color":"#FFFAF0","$type":"circle","$dim":5},"adjacencies":["module_63"]},{"id":"module_28","name":"salmon4","data":{"$color":"#8B4C39","$type":"circle","$dim":5},"adjacencies":["module_71"]},{"id":"module_85","name":"ivory","data":{"$color":"#FFFFF0","$type":"circle","$dim":5},"adjacencies":["module_28"]},{"id":"module_76","name":"darkviolet","data":{"$color":"#9400D3","$type":"circle","$dim":5},"adjacencies":["module_85"]},{"id":"module_56","name":"magenta4","data":{"$color":"#8B008B","$type":"circle","$dim":5},"adjacencies":["module_76"]},{"id":"module_35","name":"royalblue","data":{"$color":"#4169E1","$type":"circle","$dim":5},"adjacencies":["module_56"]},{"id":"module_52","name":"thistle2","data":{"$color":"#EED2EE","$type":"circle","$dim":5},"adjacencies":["module_35"]},{"id":"module_74","name":"orange","data":{"$color":"#FFA500","$type":"circle","$dim":5},"adjacencies":["module_52"]},{"id":"module_70","name":"violet","data":{"$color":"#EE82EE","$type":"circle","$dim":5},"adjacencies":["module_74"]},{"id":"module_24","name":"white","data":{"$color":"#FFFFFF","$type":"circle","$dim":5},"adjacencies":["module_70"]},{"id":"module_33","name":"lightsteelblue","data":{"$color":"#B0C4DE","$type":"circle","$dim":5},"adjacencies":["module_24"]},{"id":"module_47","name":"lightpink3","data":{"$color":"#CD8C95","$type":"circle","$dim":5},"adjacencies":["module_33"]},{"id":"module_15","name":"thistle","data":{"$color":"#D8BFD8","$type":"circle","$dim":5},"adjacencies":["module_47"]},{"id":"module_57","name":"darkseagreen4","data":{"$color":"#698B69","$type":"circle","$dim":5},"adjacencies":["module_15"]},{"id":"module_50","name":"darkolivegreen4","data":{"$color":"#6E8B3D","$type":"circle","$dim":5},"adjacencies":["module_57"]},{"id":"module_19","name":"thistle1","data":{"$color":"#FFE1FF","$type":"circle","$dim":5},"adjacencies":["module_50"]},{"id":"module_12","name":"lightcyan1","data":{"$color":"#E0FFFF","$type":"circle","$dim":5},"adjacencies":["module_19"]},{"id":"module_7","name":"lightgreen","data":{"$color":"#90EE90","$type":"circle","$dim":5},"adjacencies":["module_12"]},{"id":"module_75","name":"black","data":{"$color":"#000000","$type":"circle","$dim":5},"adjacencies":["module_7"]},{"id":"module_45","name":"cyan","data":{"$color":"#00FFFF","$type":"circle","$dim":5},"adjacencies":["module_75"]},{"id":"module_6","name":"mediumorchid","data":{"$color":"#BA55D3","$type":"circle","$dim":5},"adjacencies":["module_45"]},{"id":"module_14","name":"greenyellow","data":{"$color":"#ADFF2F","$type":"circle","$dim":5},"adjacencies":["module_6"]},{"id":"module_37","name":"salmon","data":{"$color":"#FA8072","$type":"circle","$dim":5},"adjacencies":["module_14"]},{"id":"module_10","name":"tan","data":{"$color":"#D2B48C","$type":"circle","$dim":5},"adjacencies":["module_37"]},{"id":"module_5","name":"yellow","data":{"$color":"#FFFF00","$type":"circle","$dim":5},"adjacencies":["module_10"]},{"id":"module_32","name":"brown","data":{"$color":"#A52A2A","$type":"circle","$dim":5},"adjacencies":["module_5"]},{"id":"module_66","name":"pink","data":{"$color":"#FFC0CB","$type":"circle","$dim":5},"adjacencies":["module_32"]},{"id":"module_20","name":"red","data":{"$color":"#FF0000","$type":"circle","$dim":5},"adjacencies":["module_66"]},{"id":"module_73","name":"darkmagenta","data":{"$color":"#8B008B","$type":"circle","$dim":5},"adjacencies":["module_20"]},{"id":"module_53","name":"blue","data":{"$color":"#0000FF","$type":"circle","$dim":5},"adjacencies":["module_73"]},{"id":"module_26","name":"darkgreen","data":{"$color":"#006400","$type":"circle","$dim":5},"adjacencies":["module_53"]},{"id":"module_25","name":"coral2","data":{"$color":"#EE6A50","$type":"circle","$dim":5},"adjacencies":["module_26"]},{"id":"module_55","name":"palevioletred3","data":{"$color":"#CD6889","$type":"circle","$dim":5},"adjacencies":["module_25"]},{"id":"module_13","name":"skyblue2","data":{"$color":"#7EC0EE","$type":"circle","$dim":5},"adjacencies":["module_55"]},{"id":"module_72","name":"darkturquoise","data":{"$color":"#00CED1","$type":"circle","$dim":5},"adjacencies":["module_13"]},{"id":"module_17","name":"brown2","data":{"$color":"#EE3B3B","$type":"circle","$dim":5},"adjacencies":["module_72"]},{"id":"module_51","name":"brown4","data":{"$color":"#8B2323","$type":"circle","$dim":5},"adjacencies":["module_17"]},{"id":"module_18","name":"sienna3","data":{"$color":"#CD6839","$type":"circle","$dim":5},"adjacencies":["module_51"]},{"id":"module_69","name":"green","data":{"$color":"#00FF00","$type":"circle","$dim":5},"adjacencies":["module_18"]},{"id":"module_61","name":"orangered3","data":{"$color":"#CD3700","$type":"circle","$dim":5},"adjacencies":["module_69"]},{"id":"module_21","name":"darkorange","data":{"$color":"#FF8C00","$type":"circle","$dim":5},"adjacencies":["module_61"]},{"id":"module_82","name":"blue2","data":{"$color":"#0000EE","$type":"circle","$dim":5},"adjacencies":["module_21"]},{"id":"module_22","name":"skyblue3","data":{"$color":"#6CA6CD","$type":"circle","$dim":5},"adjacencies":["module_82"]},{"id":"module_86","name":"lightcoral","data":{"$color":"#F08080","$type":"circle","$dim":5},"adjacencies":["module_22"]},{"id":"module_40","name":"grey60","data":{"$color":"#999999","$type":"circle","$dim":5},"adjacencies":["module_86"]},{"id":"module_68","name":"firebrick4","data":{"$color":"#8B1A1A","$type":"circle","$dim":5},"adjacencies":["module_40"]},{"id":"module_31","name":"palevioletred2","data":{"$color":"#EE799F","$type":"circle","$dim":5},"adjacencies":["module_68"]},{"id":"module_80","name":"antiquewhite4","data":{"$color":"#8B8378","$type":"circle","$dim":5},"adjacencies":["module_31"]},{"id":"module_39","name":"darkgrey","data":{"$color":"#A9A9A9","$type":"circle","$dim":5},"adjacencies":["module_80"]},{"id":"module_16","name":"saddlebrown","data":{"$color":"#8B4513","$type":"circle","$dim":5},"adjacencies":["module_39"]},{"id":"module_11","name":"darkred","data":{"$color":"#8B0000","$type":"circle","$dim":5},"adjacencies":["module_16"]},{"id":"module_88","name":"paleturquoise","data":{"$color":"#AFEEEE","$type":"circle","$dim":5},"adjacencies":["module_11"]},{"id":"module_64","name":"coral1","data":{"$color":"#FF7256","$type":"circle","$dim":5},"adjacencies":["module_88"]},{"id":"module_65","name":"turquoise","data":{"$color":"#40E0D0","$type":"circle","$dim":5},"adjacencies":["module_64"]},{"id":"module_54","name":"darkolivegreen","data":{"$color":"#556B2F","$type":"circle","$dim":5},"adjacencies":["module_65"]},{"id":"module_27","name":"darkslateblue","data":{"$color":"#483D8B","$type":"circle","$dim":5},"adjacencies":["module_54"]},{"id":"module_59","name":"salmon2","data":{"$color":"#EE8262","$type":"circle","$dim":5},"adjacencies":["module_27"]},{"id":"module_49","name":"yellowgreen","data":{"$color":"#9ACD32","$type":"circle","$dim":5},"adjacencies":["module_59"]},{"id":"module_87","name":"plum","data":{"$color":"#DDA0DD","$type":"circle","$dim":5},"adjacencies":["module_49"]},{"id":"module_34","name":"lightyellow","data":{"$color":"#FFFFE0","$type":"circle","$dim":5},"adjacencies":["module_87"]},{"id":"module_60","name":"plum1","data":{"$color":"#FFBBFF","$type":"circle","$dim":5},"adjacencies":["module_34"]},{"id":"module_67","name":"thistle3","data":{"$color":"#CDB5CD","$type":"circle","$dim":5},"adjacencies":["module_60"]},{"id":"module_84","name":"indianred4","data":{"$color":"#8B3A3A","$type":"circle","$dim":5},"adjacencies":["module_67"]}]
		var fd = new $jit.ForceDirected({
		    //id of the visualization container
		    injectInto: 'infovis',
		    //Enable zooming and panning
		    //by scrolling and DnD
		    Navigation: {
		      enable: true,
		      //Enable panning events only if we're dragging the empty
		      //canvas (and not a node).
		      panning: 'avoid nodes',
		      zooming: 10 //zoom speed. higher is more sensible
		    },
		    // Change node and edge styles such as
		    // color and width.
		    // These properties are also set per node
		    // with dollar prefixed data-properties in the
		    // JSON structure.
		    Node: {
		      overridable: true
		    },
		    Edge: {
		      overridable: true,
		      color: '#23A4FF',
		      lineWidth: 0.4
		    },
		    //Native canvas text styling
		    Label: {
		      type: 'Native', //Native or HTML
		      size: 10,
		      style: 'bold',
		      color: '#000'
		    },
		    //Add Tips
		    Tips: {
		      enable: true,
		      onShow: function(tip, node) {
		        //count connections
		        var count = 0;
		        node.eachAdjacency(function() { count++; });
		        //display node info in tooltip
		        tip.innerHTML = "<div class=\"tip-title\">" + node.name + "</div>"
		          + "<div class=\"tip-text\"><b>connections:</b> " + count + "</div>";
		      }
		    },
		    // Add node events
		    Events: {
		        enable: true,
		        type: 'Native',
		        //Change cursor style when hovering a node
		        onMouseEnter: function() {
		          fd.canvas.getElement().style.cursor = 'move';
		        },
		        onMouseLeave: function() {
		          fd.canvas.getElement().style.cursor = '';
		        },
		        //Update node positions when dragged
		        onDragMove: function(node, eventInfo, e) {
		            var pos = eventInfo.getPos();
		            node.pos.setc(pos.x, pos.y);
		            fd.plot();
		        },
		        //Implement the same handler for touchscreens
		        onTouchMove: function(node, eventInfo, e) {
		          $jit.util.event.stop(e); //stop default touchmove event
		          this.onDragMove(node, eventInfo, e);
		        },
		        //Add also a click handler to nodes
		        onClick: function(node) {
		          if(!node) return;
		          // Build the right column relations list.
		          // This is done by traversing the clicked node connections.
		          var html = "<h4>" + node.name + "</h4><b> connections:</b><ul><li>",
		              list = [];
		          node.eachAdjacency(function(adj){
		            list.push(adj.nodeTo.name);
		          });
		          //append connections information
		          $jit.id('infoviz').innerHTML = html + list.join("</li><li>") + "</li></ul>";
		        }
		      },
		      //Number of iterations for the FD algorithm
		      iterations: 200,
		      //Edge length
		      levelDistance: 130,
		      // Add text to the labels. This method is only triggered
		      // on label creation and only for DOM labels (not native canvas ones).
		      onCreateLabel: function(domElement, node){
		        domElement.innerHTML = node.name;
		        var style = domElement.style;
		        style.fontSize = "0.8em";
		        style.color = "#ddd";
		      },
		      // Change node styles when DOM labels are placed
		      // or moved.
		      onPlaceLabel: function(domElement, node){
		        var style = domElement.style;
		        var left = parseInt(style.left);
		        var top = parseInt(style.top);
		        var w = domElement.offsetWidth;
		        style.left = (left - w / 2) + 'px';
		        style.top = (top + 10) + 'px';
		        style.display = '';
		      }
		});
		// load JSON data.
		  fd.loadJSON(json);
		  // compute positions incrementally and animate.
		  fd.computeIncremental({
		    iter: 100,
		    property: 'end',
		    onStep: function(perc){
		      console.log(perc + '% loaded...');
		    },
		    onComplete: function(){
		      console.log('done');
		      fd.animate({
		        modes: ['linear'],
		        transition: $jit.Trans.Elastic.easeOut,
		        duration: 2500
		      });
		    }
		  });
		});
		  // end
		</script>
	</body>
</html>
