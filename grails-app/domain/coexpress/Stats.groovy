package coexpress

class Stats {
	
	Transcript transcript
	Library library
	int rawCount
	double maxExpectationCount
	double fpkm
	float componentFpkm
	double depValue
	double defdr
	
    static constraints = {
		//transcript(nullable:false)
		//library(nullable:false)
		
    }
	
	static mapping ={
		table 'stats'
		id column: 'id', generator: 'increment'
		transcript column:'transcript_id'
		library column:'library_id'
		rawCount column:'raw_count'
		maxExpectationCount column:'EM_count'
		fpkm column:'fpkm'
		componentFpkm column:'pct_component_fpkm'
		depValue column:'edgeR_pval'
		defdr column:'edgeR_fdr'
		version false
		autoTimestamp false
	}
}
