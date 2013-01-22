package coexpress

class Transcript {

	String name;
	String sequence;
	
	
	static hasMany =[libraries: Library, modules:Module]
	static belongsTo = Module 
    static constraints = {
		name	(maxSize: 50, nullable:false)
		sequence(maxSize: 30000, nullable:true)
    }
	
	static mapping ={
		table 'transcript'
		id			column: 'id', generator: 'increment'
		name		column: 'name'
		sequence	column: 'seq'
		libraries	joinTable: [name:'stats',				column: 'library_id']
		modules		joinTable: [name:'module_transcript',	column: 'module_id'	]
		version false
		autoTimestamp false
	}
}
