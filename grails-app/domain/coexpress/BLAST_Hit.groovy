package coexpress

class BLAST_Hit {
	Transcript query;
	String subject;
	float identity;
	long alignment_length;
	long mismatches;
	long gap_openings;
	long query_start;
	long query_end;
	long subject_start;
	long subject_end;
	double e_value;
	double bit_score;
	long gi_number;
	String accession = "";
	String organism = "";
	String defline = "";
	String keywords = "";
	
	static belongsTo = Transcript
	
    static constraints = {
    }
	
	static mapping = {
		version false
		autoTimestamp false
	}
}
