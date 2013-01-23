package coexpress

import org.springframework.dao.DataIntegrityViolationException

class MappingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	/*
	 * user defined actions
	 */
	
	def set(){
		session["mapping_id"] = 1;
	}
	
	def unset(){
		session["mapping_id"] = null;
	}
	 
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mappingInstanceList: Mapping.list(params), mappingInstanceTotal: Mapping.count()]
    }

    def create() {
        [mappingInstance: new Mapping(params)]
    }

    def save() {
        def mappingInstance = new Mapping(params)
        if (!mappingInstance.save(flush: true)) {
            render(view: "create", model: [mappingInstance: mappingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mapping.label', default: 'Mapping'), mappingInstance.id])
        redirect(action: "show", id: mappingInstance.id)
    }

    def show(Long id) {
        def mappingInstance = Mapping.get(id)
        if (!mappingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapping.label', default: 'Mapping'), id])
            redirect(action: "list")
            return
        }

        [mappingInstance: mappingInstance]
    }

    def edit(Long id) {
        def mappingInstance = Mapping.get(id)
        if (!mappingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapping.label', default: 'Mapping'), id])
            redirect(action: "list")
            return
        }

        [mappingInstance: mappingInstance]
    }

    def update(Long id, Long version) {
        def mappingInstance = Mapping.get(id)
        if (!mappingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapping.label', default: 'Mapping'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mappingInstance.version > version) {
                mappingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mapping.label', default: 'Mapping')] as Object[],
                          "Another user has updated this Mapping while you were editing")
                render(view: "edit", model: [mappingInstance: mappingInstance])
                return
            }
        }

        mappingInstance.properties = params

        if (!mappingInstance.save(flush: true)) {
            render(view: "edit", model: [mappingInstance: mappingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mapping.label', default: 'Mapping'), mappingInstance.id])
        redirect(action: "show", id: mappingInstance.id)
    }

    def delete(Long id) {
        def mappingInstance = Mapping.get(id)
        if (!mappingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapping.label', default: 'Mapping'), id])
            redirect(action: "list")
            return
        }

        try {
            mappingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mapping.label', default: 'Mapping'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mapping.label', default: 'Mapping'), id])
            redirect(action: "show", id: id)
        }
    }
}
