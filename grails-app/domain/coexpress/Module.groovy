package coexpress

class Module {
	Mapping map
	String name
	String color
	static hasMany = [transcripts: Transcript]
	static belongsTo = Mapping
	static constraints = {
		name(maxSize: 50, nullable:false)
		map(nullable:false)
	}
	
	static mapping ={
		table 'module'
		id 			column: 'id', generator: 'increment'
		name 		column: 'name'
		map 		column: 'mapping_id'
		color		column:	'color'
		transcripts	joinTable: [name:'module_transcript',	column: 'transcript_id'	]
		
		version false
		autoTimestamp false
	}
    
}
