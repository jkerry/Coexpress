package coexpress

class Mapping {
	String name
	
	static hasMany = [libraries:Library,modules:Module]
	
    static constraints = {
    	name(maxSize: 50,nullable:true,unique:true)
	}
	
	static mapping = {
		table 'mapping'
		id			column: 'id', generator: 'increment'
		libraries	column: 'library_id'
		modules		column: 'mapping_id', joinTable: false
		
		version false
		autoTimestamp false
	}
}
