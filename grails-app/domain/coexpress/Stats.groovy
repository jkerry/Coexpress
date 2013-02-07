package coexpress

class Stats {
	
	Transcript transcript
	Library library
	int rawCount = 0.0
	double maxExpectationCount = 0.0
	double fpkm = 0.0
	float componentFpkm = 0.0
	double depValue =1.0
	double defdr = 1.0
	
    static constraints = {
		transcript(nullable:false)
		library(nullable:false)
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
