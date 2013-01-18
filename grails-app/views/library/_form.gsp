<%@ page import="coexpress.Library" %>



<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="library.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="50" value="${libraryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'map', 'error')} required">
	<label for="map">
		<g:message code="library.map.label" default="Map" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="map" name="map.id" from="${coexpress.Mapping.list()}" optionKey="id" required="" value="${libraryInstance?.map?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: libraryInstance, field: 'transcripts', 'error')} ">
	<label for="transcripts">
		<g:message code="library.transcripts.label" default="Transcripts" />
		
	</label>
	
</div>

