
var jsonKey = "18732cf4ff87fdab55a1c82914eb401e";
var tagArray = {};
var count = 0;
var pct = 0;

function updateCount(nrec,spinner){
	count++;
	pct = Math.round(100*(count/nrec));
	//update display
	
	$('div#tagCloud').html('<img src="'+spinner+'"/>&nbsp<em>Parsing keyword list..'+pct+'%</em>');
}

function clean(string){
	return string.toLowerCase().replace(':','').replace('[','').replace(']','').replace("full=","");
}

/**
 * function to fetch the protein definition from ncbi from the GI number
 * @param gi_number The gi number of the ncbi protein record
 * @returns a reference to the ajax status object
 */
function parseKeywords(kw,numRecords,spinner){
			var splitdef = kw.split(";");
			$.each(splitdef,function(key,value){
				if(value in tagArray){
					console.log("init\t"+value)
					tagArray[value] ++; 
				}
				else{
					tagArray[value]=1;
				}
			})
		
			updateCount(numRecords,spinner);
}
var keywords = [];
function getKeywords(url){
	return $.getJSON(url).success(function(data){
		console.log('Successfully retrieved Keywords')
		$.each(data.results,function(key,val){
			keywords.push(val);
		})
		
	})
}

/**
 * function that displays a histogram of all words in the definition line of all proteins in the given array
 * @param gis the array of all gi numbers of interest
 */
function displayTagCloud(modId,url,spinner){
	$('div#tagCloud').html('<img src="'+spinner+'"/>&nbsp<em>Fetching keywords from the first 500 transcripts...</em>');
	
	console.log(url);
	$.when(getKeywords(url)).then(function(){
		console.log("in request builder with "+keywords.length+" records")
		if(keywords.length > 0){
			$.each(keywords,function(idx,gi){
				console.log(gi)
				parseKeywords(gi,keywords.length,spinner);
			})
			$('div#tagCloud').html('<img src="'+spinner+'"/>&nbsp<em>Building the BLAST cloud...</em>');
			var tags=[];
			$.each(tagArray,function(key,value){

				if(! $.isNumeric(key)){
					tags.push({tag:key,count:value});
				}
			})
			$('div#tagCloud').tagCloud(tags);
		}
		else{
			$('div#tagCloud').html('<em>No keywords found for the BLAST hits for this module.</em>');
		}
		
	});
	
	
}

