package coexpress



import org.junit.*
import grails.test.mixin.*

@TestFor(ModuleController)
@Mock(Module)
class ModuleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/module/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.moduleInstanceList.size() == 0
        assert model.moduleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.moduleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.moduleInstance != null
        assert view == '/module/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/module/show/1'
        assert controller.flash.message != null
        assert Module.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/module/list'

        populateValidParams(params)
        def module = new Module(params)

        assert module.save() != null

        params.id = module.id

        def model = controller.show()

        assert model.moduleInstance == module
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/module/list'

        populateValidParams(params)
        def module = new Module(params)

        assert module.save() != null

        params.id = module.id

        def model = controller.edit()

        assert model.moduleInstance == module
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/module/list'

        response.reset()

        populateValidParams(params)
        def module = new Module(params)

        assert module.save() != null

        // test invalid parameters in update
        params.id = module.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/module/edit"
        assert model.moduleInstance != null

        module.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/module/show/$module.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        module.clearErrors()

        populateValidParams(params)
        params.id = module.id
        params.version = -1
        controller.update()

        assert view == "/module/edit"
        assert model.moduleInstance != null
        assert model.moduleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/module/list'

        response.reset()

        populateValidParams(params)
        def module = new Module(params)

        assert module.save() != null
        assert Module.count() == 1

        params.id = module.id

        controller.delete()

        assert Module.count() == 0
        assert Module.get(module.id) == null
        assert response.redirectedUrl == '/module/list'
    }
}
