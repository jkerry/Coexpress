package coexpress

class Mapping {
	Date timestamp
	String name
	
	static hasMany = [libraries:Library]
	
    static constraints = {
    	name(maxSize: 50,nullable:true)
		timestamp(nullable:false)
	}
	
	static mapping = {
		table 'mapping'
		id			column: 'id', generator: 'increment'
		timestamp	column: 'timestamp'
		libraries	column: 'library_id'
		
		
		version false
		autoTimestamp false
	}
}
