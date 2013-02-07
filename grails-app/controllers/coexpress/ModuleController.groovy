package coexpress

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ModuleController {
	def grailsApplication
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "correlationTables", params: params)
    }
	
	def correlationTables(){
		/*if you havent selected a mapping run, redirect to do so*/
		if(session["mapping_id"]==null){
			flash.message = "Please select a Mapping first"
			redirect(controller:"Mapping",action:"select", params:params)
		}
		else{
			def thisMap = Mapping.findById(session["mapping_id"]);
			def modules = Module.findAllWhere( map:thisMap );
			modules.sort {it.name};
			def traits = Trait.findAllWhere( map:thisMap );
			traits.sort {it.id}
			def table = [:]
			def significance = []
			modules.each { mod ->
				def row = [];
				def stats = ModuleTraitStats.findAllWhere(module:mod)
				stats.sort {it.trait.id}
				def sig = false;
				traits.each{ trt ->
					stats.each{
						if(it.trait.name.compareTo(trt.name)==0){
							row.add(it);
							sig = sig || (it.pValue < 0.05)
						}
					}
				}
				table.put(mod.name, row)
				significance.add(!sig)
			}
			[modules:modules, traits:traits, table:table,significance:significance]
		}
	}
	
	def show(Long id) {
		if(session["mapping_id"]==null){
			redirect(controller:"Mapping",action:"select", params:params)
		}
		else{
			def p_max
			def p_offset
			if(!params.max){
				p_max=10
			}
			else{
				p_max = params.max.toInteger();
			}
			if(!params.offset){
				p_offset=0
			}
			else{
				p_offset=params.offset.toInteger()
			}
		
			def moduleInstance = Module.get(id)
			if (!moduleInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
				redirect(action: "list")
				return
			}
			/*
			 * Structure a criterion query so that the module view doesn't overflow with transcript requests
			 */
			def transcriptCriteria = Transcript.createCriteria()
			def transcriptInstanceList = transcriptCriteria.list(max:p_max, offset:p_offset) {
				modules{
					eq('id',params.id.toLong())
				}
			}
			def tMapping = Mapping.get(session["mapping_id"])
			def traitList = Trait.findAll("from Trait as t where t.map=?",[tMapping])
			[moduleInstance: moduleInstance, transcriptInstanceList: transcriptInstanceList,transcriptCount:transcriptInstanceList.totalCount,traitList:traitList]
		}
	}
	
	
    
	//TODO remove after sufficient development of action view_network
	/**
	def showAsCycle(){
		if(session["mapping_id"]==null){
			redirect(controller:"Mapping",action:"select", params:params)
		}
		else{
			//get all modules which correspond to the given mapping_id
			def modules = (Mapping.findById(session["mapping_id"])).modules
			//initialize empty map to store all module entries
			def adjacency = []
			def shape	=	grailsApplication.config.nodeShape
			def dim		=	grailsApplication.config.nodeDim
			modules.each{mod ->
			
				adjacency.add([
					"id":"module_${mod.id}",
					"name":mod.name,
					"data":[
						'color':"${mod.color}",
						'type':"${shape}",
						'dim':"${dim}"
					],
				]);
			}
		
			[adjacency:adjacency]
		}
	}
	//TODO remove after sufficient development of action view_network
	def listAsGraph(Integer mapping_id){
		//get all modules which correspond to the given mapping_id
		def modules = (Mapping.findById(mapping_id)).modules
		//initialize empty map to store all module entries
		def adjacency = []
		def shape	=	grailsApplication.config.nodeShape
		def dim		=	grailsApplication.config.nodeDim
		def prev
		modules.each{mod ->
			adjacency.add([
				"id":"module_${mod.id}",
				"name":mod.name,
				"data":[
					'$color':mod.color,
					'$type':shape,
					'$dim':dim
				],
				"adjacencies": [prev]
			]);
			prev = "module_${mod.id}"
		}
		adjacency[0].put("adjacencies",[prev])
		
		render adjacency as JSON
	}
	*/
}
