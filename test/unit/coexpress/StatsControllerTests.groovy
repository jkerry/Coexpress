package coexpress



import org.junit.*
import grails.test.mixin.*

@TestFor(StatsController)
@Mock(Stats)
class StatsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stats/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.statsInstanceList.size() == 0
        assert model.statsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.statsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.statsInstance != null
        assert view == '/stats/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stats/show/1'
        assert controller.flash.message != null
        assert Stats.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stats/list'

        populateValidParams(params)
        def stats = new Stats(params)

        assert stats.save() != null

        params.id = stats.id

        def model = controller.show()

        assert model.statsInstance == stats
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stats/list'

        populateValidParams(params)
        def stats = new Stats(params)

        assert stats.save() != null

        params.id = stats.id

        def model = controller.edit()

        assert model.statsInstance == stats
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stats/list'

        response.reset()

        populateValidParams(params)
        def stats = new Stats(params)

        assert stats.save() != null

        // test invalid parameters in update
        params.id = stats.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stats/edit"
        assert model.statsInstance != null

        stats.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stats/show/$stats.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stats.clearErrors()

        populateValidParams(params)
        params.id = stats.id
        params.version = -1
        controller.update()

        assert view == "/stats/edit"
        assert model.statsInstance != null
        assert model.statsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stats/list'

        response.reset()

        populateValidParams(params)
        def stats = new Stats(params)

        assert stats.save() != null
        assert Stats.count() == 1

        params.id = stats.id

        controller.delete()

        assert Stats.count() == 0
        assert Stats.get(stats.id) == null
        assert response.redirectedUrl == '/stats/list'
    }
}
