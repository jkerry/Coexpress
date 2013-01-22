package coexpress

class Mapping {
	Date timestamp
	String name
	
	static hasMany = [libraries:Library,modules:Module]
	
    static constraints = {
    	name(maxSize: 50,nullable:true)
		timestamp(nullable:false)
	}
	
	static mapping = {
		table 'mapping'
		id			column: 'id', generator: 'increment'
		timestamp	column: 'timestamp'
		libraries	column: 'library_id'
		modules		column: 'mapping_id', joinTable: false
		
		version false
		autoTimestamp false
	}
}
