package coexpress

class Trait {
	
	String name
	String description
	Mapping map
	
	static constraints = {
		name(maxSize: 50, nullable:false)
		description(nullable:false)
	}
	
	static mapping ={
		table 'trait'
		id 			column: 'id', generator: 'increment'
		name 		column: 'name'
		description	column: 'descr'
		map			column: 'mapping_id'
		version false
		autoTimestamp false
	}
    
}
