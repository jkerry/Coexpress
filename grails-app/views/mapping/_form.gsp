<%@ page import="coexpress.Mapping" %>



<div class="fieldcontain ${hasErrors(bean: mappingInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="mapping.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="50" value="${mappingInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mappingInstance, field: 'timestamp', 'error')} required">
	<label for="timestamp">
		<g:message code="mapping.timestamp.label" default="Timestamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="timestamp" precision="day"  value="${mappingInstance?.timestamp}"  />
</div>

