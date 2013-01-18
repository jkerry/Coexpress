<%@ page import="coexpress.Stats" %>



<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'componentFpkm', 'error')} required">
	<label for="componentFpkm">
		<g:message code="stats.componentFpkm.label" default="Component Fpkm" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="componentFpkm" value="${fieldValue(bean: statsInstance, field: 'componentFpkm')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'defdr', 'error')} required">
	<label for="defdr">
		<g:message code="stats.defdr.label" default="Defdr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="defdr" value="${fieldValue(bean: statsInstance, field: 'defdr')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'depValue', 'error')} required">
	<label for="depValue">
		<g:message code="stats.depValue.label" default="Dep Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="depValue" value="${fieldValue(bean: statsInstance, field: 'depValue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'fpkm', 'error')} required">
	<label for="fpkm">
		<g:message code="stats.fpkm.label" default="Fpkm" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fpkm" value="${fieldValue(bean: statsInstance, field: 'fpkm')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'library', 'error')} required">
	<label for="library">
		<g:message code="stats.library.label" default="Library" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="library" name="library.id" from="${coexpress.Library.list()}" optionKey="id" required="" value="${statsInstance?.library?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'maxExpectationCount', 'error')} required">
	<label for="maxExpectationCount">
		<g:message code="stats.maxExpectationCount.label" default="Max Expectation Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxExpectationCount" value="${fieldValue(bean: statsInstance, field: 'maxExpectationCount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'rawCount', 'error')} required">
	<label for="rawCount">
		<g:message code="stats.rawCount.label" default="Raw Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rawCount" type="number" value="${statsInstance.rawCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: statsInstance, field: 'transcript', 'error')} required">
	<label for="transcript">
		<g:message code="stats.transcript.label" default="Transcript" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="transcript" name="transcript.id" from="${coexpress.Transcript.list()}" optionKey="id" required="" value="${statsInstance?.transcript?.id}" class="many-to-one"/>
</div>

