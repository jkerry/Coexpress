<%@ page import="coexpress.Module" %>



<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="module.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="50" value="${moduleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'map', 'error')} required">
	<label for="map">
		<g:message code="module.map.label" default="Map" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="map" name="map.id" from="${coexpress.Mapping.list()}" optionKey="id" required="" value="${moduleInstance?.map?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'transcripts', 'error')} ">
	<label for="transcripts">
		<g:message code="module.transcripts.label" default="Transcripts" />
		
	</label>
	<g:select name="transcripts" from="${coexpress.Transcript.list()}" multiple="multiple" optionKey="id" size="5" value="${moduleInstance?.transcripts*.id}" class="many-to-many"/>
</div>

