package coexpress

import org.springframework.dao.DataIntegrityViolationException

class StatsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [statsInstanceList: Stats.list(params), statsInstanceTotal: Stats.count()]
    }

    def create() {
        [statsInstance: new Stats(params)]
    }

    def save() {
        def statsInstance = new Stats(params)
        if (!statsInstance.save(flush: true)) {
            render(view: "create", model: [statsInstance: statsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stats.label', default: 'Stats'), statsInstance.id])
        redirect(action: "show", id: statsInstance.id)
    }

    def show(Long id) {
        def statsInstance = Stats.get(id)
        if (!statsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stats.label', default: 'Stats'), id])
            redirect(action: "list")
            return
        }

        [statsInstance: statsInstance]
    }

    def edit(Long id) {
        def statsInstance = Stats.get(id)
        if (!statsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stats.label', default: 'Stats'), id])
            redirect(action: "list")
            return
        }

        [statsInstance: statsInstance]
    }

    def update(Long id, Long version) {
        def statsInstance = Stats.get(id)
        if (!statsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stats.label', default: 'Stats'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (statsInstance.version > version) {
                statsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stats.label', default: 'Stats')] as Object[],
                          "Another user has updated this Stats while you were editing")
                render(view: "edit", model: [statsInstance: statsInstance])
                return
            }
        }

        statsInstance.properties = params

        if (!statsInstance.save(flush: true)) {
            render(view: "edit", model: [statsInstance: statsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stats.label', default: 'Stats'), statsInstance.id])
        redirect(action: "show", id: statsInstance.id)
    }

    def delete(Long id) {
        def statsInstance = Stats.get(id)
        if (!statsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stats.label', default: 'Stats'), id])
            redirect(action: "list")
            return
        }

        try {
            statsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stats.label', default: 'Stats'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stats.label', default: 'Stats'), id])
            redirect(action: "show", id: id)
        }
    }
}
