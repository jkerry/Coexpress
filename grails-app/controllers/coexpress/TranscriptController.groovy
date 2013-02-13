package coexpress

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class TranscriptController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		if(params.module_id){
			def moduleInstance = Module.get(params.module_id);
			def ct = moduleInstance.transcripts.size();
			[transcriptInstanceList: Transcript.findAllByModules(moduleInstance,params), transcriptInstanceTotal: ct]
		}
		else{
			[transcriptInstanceList: Transcript.list(params), transcriptInstanceTotal: moduleInstance.transcripts.size()]
		}
	}

    def create() {
        [transcriptInstance: new Transcript(params)]
    }

    def save() {
        def transcriptInstance = new Transcript(params)
        if (!transcriptInstance.save(flush: true)) {
            render(view: "create", model: [transcriptInstance: transcriptInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'transcript.label', default: 'Transcript'), transcriptInstance.id])
        redirect(action: "show", id: transcriptInstance.id)
    }

    def show(Long id) {
        def transcriptInstance = Transcript.get(id)
        if (!transcriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transcript.label', default: 'Transcript'), id])
            redirect(action: "list")
            return
        }

        [transcriptInstance: transcriptInstance]
    }

    def edit(Long id) {
        def transcriptInstance = Transcript.get(id)
        if (!transcriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transcript.label', default: 'Transcript'), id])
            redirect(action: "list")
            return
        }

        [transcriptInstance: transcriptInstance]
    }

    def update(Long id, Long version) {
        def transcriptInstance = Transcript.get(id)
        if (!transcriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transcript.label', default: 'Transcript'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (transcriptInstance.version > version) {
                transcriptInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'transcript.label', default: 'Transcript')] as Object[],
                          "Another user has updated this Transcript while you were editing")
                render(view: "edit", model: [transcriptInstance: transcriptInstance])
                return
            }
        }

        transcriptInstance.properties = params

        if (!transcriptInstance.save(flush: true)) {
            render(view: "edit", model: [transcriptInstance: transcriptInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'transcript.label', default: 'Transcript'), transcriptInstance.id])
        redirect(action: "show", id: transcriptInstance.id)
    }

    def delete(Long id) {
        def transcriptInstance = Transcript.get(id)
        if (!transcriptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transcript.label', default: 'Transcript'), id])
            redirect(action: "list")
            return
        }

        try {
            transcriptInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'transcript.label', default: 'Transcript'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'transcript.label', default: 'Transcript'), id])
            redirect(action: "show", id: id)
        }
    }
}
