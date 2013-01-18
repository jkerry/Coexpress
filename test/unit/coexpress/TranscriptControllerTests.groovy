package coexpress



import org.junit.*
import grails.test.mixin.*

@TestFor(TranscriptController)
@Mock(Transcript)
class TranscriptControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/transcript/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.transcriptInstanceList.size() == 0
        assert model.transcriptInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.transcriptInstance != null
    }

    void testSave() {
        controller.save()

        assert model.transcriptInstance != null
        assert view == '/transcript/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/transcript/show/1'
        assert controller.flash.message != null
        assert Transcript.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/transcript/list'

        populateValidParams(params)
        def transcript = new Transcript(params)

        assert transcript.save() != null

        params.id = transcript.id

        def model = controller.show()

        assert model.transcriptInstance == transcript
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/transcript/list'

        populateValidParams(params)
        def transcript = new Transcript(params)

        assert transcript.save() != null

        params.id = transcript.id

        def model = controller.edit()

        assert model.transcriptInstance == transcript
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/transcript/list'

        response.reset()

        populateValidParams(params)
        def transcript = new Transcript(params)

        assert transcript.save() != null

        // test invalid parameters in update
        params.id = transcript.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/transcript/edit"
        assert model.transcriptInstance != null

        transcript.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/transcript/show/$transcript.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        transcript.clearErrors()

        populateValidParams(params)
        params.id = transcript.id
        params.version = -1
        controller.update()

        assert view == "/transcript/edit"
        assert model.transcriptInstance != null
        assert model.transcriptInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/transcript/list'

        response.reset()

        populateValidParams(params)
        def transcript = new Transcript(params)

        assert transcript.save() != null
        assert Transcript.count() == 1

        params.id = transcript.id

        controller.delete()

        assert Transcript.count() == 0
        assert Transcript.get(transcript.id) == null
        assert response.redirectedUrl == '/transcript/list'
    }
}
