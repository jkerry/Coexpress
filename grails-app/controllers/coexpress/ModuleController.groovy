package coexpress

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ModuleController {
	def grailsApplication
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	/*def burnit() {
		def modules = Module.list();
		def traits = Trait.list();
		
		modules.each { mod ->
			print "adding default correlation values for ${mod.name}"
			traits.each{ trait ->
				def tmpmod = new ModuleTraitStats(module: mod, trait: trait, correlation:(double)0.0, pValue:(double)1.0);
				if(!tmpmod.save(flush:true)){print "there was a problem with ${tmpmod}"}
			}
		}
	}*/
	
	
    def index() {
        redirect(action: "correlationTables", params: params)
    }

	def correlationTables(){
		/*if you havent selected a mapping run, redirect to do so*/
		if(session["mapping_id"]==null){
			redirect(controller:"Mapping",action:"select", params:params)
		}
		else{
			def thisMap = Mapping.findById(session["mapping_id"]);
			def modules = Module.findAllWhere( map:thisMap );
			modules.sort {it.name};
			def traits = Trait.findAllWhere( map:thisMap );
			traits.sort {it.id}
			def table = [:]
			modules.each { mod ->
				def row = [];
				def stats = ModuleTraitStats.findAllWhere(module:mod)
				stats.sort {it.trait.id}
				traits.each{ trt ->
					stats.each{
						if(it.trait.name.compareTo(trt.name)==0){
							row.add(it);
						}
					}
				}
				table.put(mod.name, row)
			}
			[modules:modules, traits:traits, table:table]
		}
	}
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [moduleInstanceList: Module.list(params), moduleInstanceTotal: Module.count()]
    }
	
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

    def create() {
        [moduleInstance: new Module(params)]
    }

    def save() {
        def moduleInstance = new Module(params)
        if (!moduleInstance.save(flush: true)) {
            render(view: "create", model: [moduleInstance: moduleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'module.label', default: 'Module'), moduleInstance.id])
        redirect(action: "show", id: moduleInstance.id)
    }

    def show(Long id) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        [moduleInstance: moduleInstance]
    }

    def edit(Long id) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        [moduleInstance: moduleInstance]
    }

    def update(Long id, Long version) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (moduleInstance.version > version) {
                moduleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'module.label', default: 'Module')] as Object[],
                          "Another user has updated this Module while you were editing")
                render(view: "edit", model: [moduleInstance: moduleInstance])
                return
            }
        }

        moduleInstance.properties = params

        if (!moduleInstance.save(flush: true)) {
            render(view: "edit", model: [moduleInstance: moduleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'module.label', default: 'Module'), moduleInstance.id])
        redirect(action: "show", id: moduleInstance.id)
    }

    def delete(Long id) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        try {
            moduleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "show", id: id)
        }
    }
}
