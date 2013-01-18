package coexpress



import org.junit.*
import grails.test.mixin.*

@TestFor(MappingController)
@Mock(Mapping)
class MappingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mapping/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mappingInstanceList.size() == 0
        assert model.mappingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mappingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mappingInstance != null
        assert view == '/mapping/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mapping/show/1'
        assert controller.flash.message != null
        assert Mapping.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mapping/list'

        populateValidParams(params)
        def mapping = new Mapping(params)

        assert mapping.save() != null

        params.id = mapping.id

        def model = controller.show()

        assert model.mappingInstance == mapping
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mapping/list'

        populateValidParams(params)
        def mapping = new Mapping(params)

        assert mapping.save() != null

        params.id = mapping.id

        def model = controller.edit()

        assert model.mappingInstance == mapping
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mapping/list'

        response.reset()

        populateValidParams(params)
        def mapping = new Mapping(params)

        assert mapping.save() != null

        // test invalid parameters in update
        params.id = mapping.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mapping/edit"
        assert model.mappingInstance != null

        mapping.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mapping/show/$mapping.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mapping.clearErrors()

        populateValidParams(params)
        params.id = mapping.id
        params.version = -1
        controller.update()

        assert view == "/mapping/edit"
        assert model.mappingInstance != null
        assert model.mappingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mapping/list'

        response.reset()

        populateValidParams(params)
        def mapping = new Mapping(params)

        assert mapping.save() != null
        assert Mapping.count() == 1

        params.id = mapping.id

        controller.delete()

        assert Mapping.count() == 0
        assert Mapping.get(mapping.id) == null
        assert response.redirectedUrl == '/mapping/list'
    }
}
