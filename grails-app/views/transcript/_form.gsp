<%@ page import="coexpress.Transcript" %>



<div class="fieldcontain ${hasErrors(bean: transcriptInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="transcript.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="50" value="${transcriptInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transcriptInstance, field: 'sequence', 'error')} ">
	<label for="sequence">
		<g:message code="transcript.sequence.label" default="Sequence" />
		
	</label>
	<g:textArea name="sequence" cols="40" rows="5" maxlength="30000" value="${transcriptInstance?.sequence}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transcriptInstance, field: 'libraries', 'error')} ">
	<label for="libraries">
		<g:message code="transcript.libraries.label" default="Libraries" />
		
	</label>
	<g:select name="libraries" from="${coexpress.Library.list()}" multiple="multiple" optionKey="id" size="5" value="${transcriptInstance?.libraries*.id}" class="many-to-many"/>
</div>

