package coexpress

class ModuleTraitStats {
	Module module;
	Trait  trait;
	double correlation;
	double pValue;
	
    static constraints = {
    }
	
	static mapping ={
		table 'module_trait'
		id 			column: 'id', generator: 'increment'
		trait 		column: 'trait_id' , type:'integer'
		module 		column: 'module_id', type:'integer'
		correlation	column:	'cor', type:'double'
		pValue		column: 'pVal', type:'double'
		
		version false
		autoTimestamp false
	}
}
