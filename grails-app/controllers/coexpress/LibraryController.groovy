package coexpress

import org.springframework.dao.DataIntegrityViolationException

class LibraryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [libraryInstanceList: Library.list(params), libraryInstanceTotal: Library.count()]
    }

    def create() {
        [libraryInstance: new Library(params)]
    }

    def save() {
        def libraryInstance = new Library(params)
        if (!libraryInstance.save(flush: true)) {
            render(view: "create", model: [libraryInstance: libraryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'library.label', default: 'Library'), libraryInstance.id])
        redirect(action: "show", id: libraryInstance.id)
    }

    def show(Long id) {
        def libraryInstance = Library.get(id)
        if (!libraryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'library.label', default: 'Library'), id])
            redirect(action: "list")
            return
        }

        [libraryInstance: libraryInstance]
    }

    def edit(Long id) {
        def libraryInstance = Library.get(id)
        if (!libraryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'library.label', default: 'Library'), id])
            redirect(action: "list")
            return
        }

        [libraryInstance: libraryInstance]
    }

    def update(Long id, Long version) {
        def libraryInstance = Library.get(id)
        if (!libraryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'library.label', default: 'Library'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (libraryInstance.version > version) {
                libraryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'library.label', default: 'Library')] as Object[],
                          "Another user has updated this Library while you were editing")
                render(view: "edit", model: [libraryInstance: libraryInstance])
                return
            }
        }

        libraryInstance.properties = params

        if (!libraryInstance.save(flush: true)) {
            render(view: "edit", model: [libraryInstance: libraryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'library.label', default: 'Library'), libraryInstance.id])
        redirect(action: "show", id: libraryInstance.id)
    }

    def delete(Long id) {
        def libraryInstance = Library.get(id)
        if (!libraryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'library.label', default: 'Library'), id])
            redirect(action: "list")
            return
        }

        try {
            libraryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'library.label', default: 'Library'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'library.label', default: 'Library'), id])
            redirect(action: "show", id: id)
        }
    }
}
