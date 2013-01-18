package coexpress

class Library {
	Mapping map
	String name
	
	static belongsTo = Transcript
	static hasMany = [transcripts: Transcript]
    
	static constraints = {
		name(maxSize: 50, nullable:false)
		map(nullable:false)
    }
	
	static mapping ={
		table 'library'
		id 			column: 'id', generator: 'increment'
		name 		column: 'name'
		map 		column: 'mapping_id'
		transcripts	joinTable:[name:'stats',column:"transcript_id"] 
		
		version false
		autoTimestamp false
	}
}
