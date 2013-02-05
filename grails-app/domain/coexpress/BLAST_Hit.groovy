package coexpress

class BLAST_Hit {
	Transcript query;
	String subject;
	float identity;
	int alignment_length;
	int mismatches;
	int gap_openings;
	int query_start;
	int query_end;
	int subject_start;
	int subject_end;
	double e_value;
	double bit_score;
	
	static belongsTo = Transcript
	
    static constraints = {
    }
	
	static mapping = {
		version false
		autoTimestamp false
	}
}
