package coexpress

import org.springframework.dao.DataIntegrityViolationException

class MappingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def select() {
		[maps:Mapping.list()]
	}
	
    def index() {
        redirect(action: "select", params: params)
    }

	/*
	 * user defined actions
	 */
	
	def set(){
		if(Mapping.get(params["mapping_id"])!=null){
			session["mapping_id"]=params["mapping_id"]
			redirect(uri:"/")
		}
		else{
			flash.message="Warning: No mapping selected"
			redirect(action:"select")
		}
	}
	
	
}
